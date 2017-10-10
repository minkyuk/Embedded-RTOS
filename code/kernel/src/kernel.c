/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   Sept. 25, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <arm.h>
#include <timer.h>
#include <uart.h>
#include <ads1015.h>
#include <supervisor.h>
#include <printk.h>
#include <swi_num.h>
#include <syscalls.h>
#include <syscall_thread.c>

/** @brief channel associated with audio sensor */
#define AUDIO_SENSOR_CHANNEL 1
/** @brief Frequency of the clock in Hertz (1/sec)*/
#define FREQ 1000

/** @brief references control block over all tasks */
extern task_cb_pool task_struct;

/**
 * @brief Enables interrupts and times, then loops indefinitely
 */
void kernel_main(void) 
{
  uart_init();
  adc_init();

  install_interrupt_table();
  thread_init();
  timer_start(FREQ);
  enter_user_mode();
  
  while(1);
}

/**
 * @brief Saves the context of the current active task
 *
 * @param stack pointer of current active task
 * @param instruction pointer of current active task
 */
void pause_running_task(uint32_t *sp, uint32_t *pc)
{
  unsigned int x = task_struct.task_cb_arr[task_struct.task_cb_run_idx].prio;

  task_struct.task_cb_arr[task_struct.task_cb_run_idx].stack_ptr = sp;
  task_struct.task_cb_arr[task_struct.task_cb_run_idx].pc        = pc; 
  task_struct.task_cb_arr[task_cb_run_idx].status    = RUNNABLE;
  
  // Set runnable pool
  // TODO: inline function
  task_struct.run_pool |= (1 << x);

  return;
}

/**
 * @brief Schedules the new task to run
 *
 * @param stack pointer of current active task
 * @param instruction pointer of current active task
 *
 * @return a pointer to the task_cb to be executed next
 */
task_cb *scheduler(uint32_t *sp, uint32_t *pc)
{
  unsigned int i;
  unsigned int n = task_struct.task_cb_end_idx;
 
  // iterate through tasks
  for (i = 0; i < n; i++)
  {
    // finds next runnable task
    if (task_struct.task_cb_arr[i].status == RUNNABLE)
    {
      // pause running task
      pause_running_task(sp, pc);

      // set new running task
      task_struct.task_cb_arr[i].status = RUNNING;
      task_struct.task_cb_run_idx = i;
      return &task_struct.task_cb_arr[i];
    }
  }

  // return idle task if nothing else can be found
  return &task_struct.idle_task_cb;
}

/**
 * @brief Function called when irq_c_handler is called. Defined in main.c
 */
void (*sample_fn)(uint16_t);

/**
 * @brief Handler called when an IRQ occurs
 */
task_cb *irq_c_handler(uint32_t *sp, uint32_t *pc) 
{
  timer_clear_pending();
  return scheduler(sp, pc);
}

/**
 * @brief Handles the given swi_num
 *
 * @param swi_num the swi number passed in from swi_asm_handler
 * @param args pointer to arguments array, set up by the swi_asm_handler
 *
 * @return the return result of the syscall
 */
void *swi_c_handler(int swi_num, int *args)
{
  switch (swi_num)
  {
    case SWI_SBRK:
      return (void*)syscall_sbrk((int)args[0]);
      break;
    case SWI_WRITE:
      return (void*)syscall_write((int)args[0], (char*)args[1], (int)args[2]);
      break;
    case SWI_CLOSE:
      return (void*)syscall_close((int)args[0]);
      break;
    case SWI_FSTAT:
      return (void*)syscall_fstat((int)args[0], (void*)args[1]);
      break;
    case SWI_ISATTY:
      return (void*)syscall_isatty((int)args[0]);
      break;
    case SWI_LSEEK:
      return (void*)syscall_lseek((int)args[0], (int)args[1], (int)args[2]);
      break;
    case SWI_READ:
      return (void*)syscall_read((int)args[0], (char*)args[1], (int)args[2]);
      break;
    case SWI_EXIT:
      syscall_exit((int)args[0]);
      break;
    case SWI_ADC_START:
      return (void*)syscall_sample_adc_start((int)args[0], (uint8_t)args[1], (void*)args[2]);
      break;
    case SWI_ADC_STOP:
      return (void*)syscall_sample_adc_stop();
      break;
    case SWI_THR_INIT:
      break;
    case SWI_THR_CREATE:
      break;
    case SWI_MUT_INIT:
      break;
    case SWI_MUT_LOK:
      break;
    case SWI_MUT_ULK:
      break;
    case SWI_WAIT:
      break;
    case SWI_TIME:
      break;
    case SWI_SCHD_START:
      break;
    default:
      break;
  }
  return NULL;
}
