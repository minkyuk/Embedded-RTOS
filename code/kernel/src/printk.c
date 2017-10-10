/**
 * @file printk.c
 *
 * @brief printf() implementation for KERNEL using UART
 *
 * @date   July 27 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <kstdarg.h>

#include <uart.h>


/**
 * allows for numbers with 64 digits/letters
 */
#define MAXBUF (sizeof(uint64_t))

/**
 * static array of digits for use in printnum(s)
 */
static char digits[] = "0123456789abcdef";


/**
 * @brief prints a number
 *
 * @param base 8, 10, 16
 * @param num the number to print
 */
static void printnumk(uint8_t base, uint64_t num) {
  int8_t *prefix = 0;
  int8_t buf[MAXBUF];
  int8_t *ptr = &buf[MAXBUF - 1];

  // standard radius prefixes
  if (base == 8) {
    prefix = "0";
  } else if (base == 16) {
    prefix = "0x";
  }

  // convert number to string in buffer
  do {
    *ptr-- = digits[num % base];
    num /= base;
  } while (num != 0);

  // print result
  if (prefix) {
    while (*prefix) {
      uart_put_byte(*prefix++);
    }
  }
  while (++ptr != &buf[MAXBUF]) {
    uart_put_byte(*ptr);
  }
}


int printk(const char *fmt, ...) {
  va_list args;
  // set up va_list and print it
  va_start(args, fmt);

  // loop through format string looking for formatting
  while (*fmt) {
    // handle normal characters
    if (*fmt != '%') {
      uart_put_byte(*fmt++);
      continue;
    }
    fmt++;
    // handle formatting
    switch (*fmt) {

      case 'd': { // signed decimal
        int32_t num = va_arg(args, int32_t);
        if (num < 0) {
          uart_put_byte('-');
          printnumk(10, -num);
        } else {
          printnumk(10, num);
        }
        break;
      }

      case 'u': { // unsigned decimal
        uint32_t num = va_arg(args, uint32_t);
        printnumk(10, num);
        break;
      }

      case 'o': { // octal
        uint32_t num = va_arg(args, uint32_t);
        printnumk(8, num);
        break;
      }

      case 'x': // hex
      case 'p': { // pointer
        uint32_t num = va_arg(args, uint32_t);
        printnumk(16, num);
        break;
      }

      case 's': { // string
        int8_t *byte_ptr = (int8_t *)va_arg(args, int32_t);
        while (*byte_ptr) {
          uart_put_byte(*byte_ptr);
          byte_ptr++;
        }
        break;
      }

      case 'c': { // character
        int32_t byte = va_arg(args, int32_t);
        uart_put_byte(byte);
        break;
      }

      case '%': { // escaped percent symbol
        uart_put_byte('%');
        break;
      }

      default: { // error
        va_end(args);
        return -1;
      }
    }
    fmt++;
  }

  va_end(args);
  return 0;
}
