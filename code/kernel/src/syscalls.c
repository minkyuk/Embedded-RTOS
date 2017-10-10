/**
 * @file   syscalls.c
 *
 * @brief  Implementation of syscalls needed for newlib and 349 custom syscalls
 *
 * @date   October 15th, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <uart.h>
#include <printk.h>
#include <arm.h>
#include <timer.h>

/** @brief end of transmission ASCII value */
#define EOT           4
/** @brief backspace ASCII value */
#define BS            8
/** @brief delete ASCII value */
#define DEL           127
/** @brief new line ASCII value */
#define LF            10
/** @brief carriage return ASCII value */
#define CR            13

/** @brief standard file output */
#define STDOUT_FILENO 1

/** @brief standard file input */
#define STDIN_FILENO  0

/** @brief Global variable to keep track of where our heap ends */
char *heap_end = 0;

/**
 * @brief Print out the exit status of the user program and hang with interrupts
 *        disabled (this is different behavior than the Linux man pages!)
 *
 * @param status Exit status to return to the kernel
 */
void syscall_exit(int status) 
{
  // print exit status
  printk("%d", status);

  // hang
  while (1);

  return;
}

/**
 * @brief See linux man page for write
 *
 * @param file  file descriptor to write to. In our kernel, we only support STDOUT.
 * @param ptr   pointer to buffer to write to
 * @param len   max length to write
 * @return -1 on error, otherwise the number of bytes written
 */
int syscall_write(int file, char *ptr, int len) 
{
  // only STDOUT support
  if (file != STDOUT_FILENO)
  {
    return -1;
  }

  int i;
  for (i = 0; i < len; i++)
  {
    uart_put_byte(ptr[i]);
  }

  return len;
}

/**
 * Reads until all len bytes are read or newline/return is found.
 * Detects backspace and EOL characters and handles them appropriately.
 *
 * The idea is to mimic normal terminal reading input, that is,
 * if the user hits backspace it should erase the previously read character.
 */
int syscall_read(int file, char *ptr, int len) 
{
  int count = 0;
  char byte;

  // only STDIN supported
  if (file != STDIN_FILENO)
  {
    return -1;
  }

  // read from uart 
  while(count < len)
  {
    byte = uart_get_byte();

    // parse byte
    switch (byte)
    {
      case EOT:
        return count;
      case BS:
      case DEL:
        if (count > 0)
        {
          ptr[count-1] = '\0'; 
        }
        break;
      case LF:
      case CR:
        uart_put_byte(byte);
        ptr[count] = byte;
        ptr[count+1] = '\0';
        return count;
        break;
      default:
        uart_put_byte(byte);
        ptr[count] = byte;
        ptr[count+1] = '\0';
        break;
    }
    
    count++;
  }
  return count;
}

/** @brief Define this in kernel.c */
extern void (*sample_fn)(uint16_t);
/**
 * @brief Starts sampling the ADC periodically, calling the given callback
 *        with the ADC sample value.
 *
 * @param freq      frequency at which to sample
 * @param channel   channel to sample
 * @param callback        function to be called everytime a sample is read from the adc.
 *
 * @return 0 on success or -1 on failure
 */
int syscall_sample_adc_start(int freq, uint8_t channel, void (*callback)(uint16_t)) 
{
  timer_start(freq);
  sample_fn = callback;
  enable_interrupts(); 
  return 0;
}


/**
 * @brief Stops periodic sampling of the ADC.
 *
 * @return 0 on success or -1 on failure
 */
int syscall_sample_adc_stop() 
{
  timer_stop();
  return 0;
}

/*****************************************************************************/
/* TA system call implementations:                                           */
/*****************************************************************************/

void *syscall_sbrk(int incr) {
  extern char __heap_low; // Defined by the linker
  extern char __heap_top; // Defined by the linker
  char *prev_heap_end;

  if (heap_end == 0) {
    // Initialize heap_end if this is the first time sbrk was called
    heap_end = &__heap_low;
  }

  prev_heap_end = heap_end;
  if (heap_end + incr > &__heap_top) {
    // Heap and stack collision, return error
    return (void *) -1;
  }

  // update heap_end and return old heap_end
  heap_end += incr;
  return (void *) prev_heap_end;
}

int syscall_close(int file) {
  return -1;
}

int syscall_fstat(int file, void *st) {
  return 0;
}

int syscall_isatty(int file) {
  return 1;
}

int syscall_lseek(int file, int ptr, int dir) {
  return 0;
}
