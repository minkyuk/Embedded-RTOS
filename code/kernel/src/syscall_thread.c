
/** @file syscall_thread.c
 *
 *  @brief  Custom syscalls to support real-time threading in 18-349 lab 3.
 *
 *  @date   October 22nd, 2016
 *
 *  @author Calvin Giroud <cgiroud@andrew.cmu.edu>
 *  @author Minkyu Kim    <minkyuk@andrew.cmu.edu>
 */

#include <syscall_thread.h>

/** @brief maximum number of tasks permitted */
#define MAX_TASKS 32

/** @brief function to set ith bit in a pool */
#define POOL_SET_PRIO(pool, i) (pool |= (1 << i))

/** @brief enum encoding status */
typedef enum {RUNNABLE, WAITING, RUNNING} task_status;

/** @brief task control block structure, holds information pertinent 
 *         to individual task 
 */
typedef struct task_control_block 
{
  uint32_t     *stack_ptr;
  uint32_t     *pc;
  unsigned int C;
  unsigned int T;
  unsigned int prio;
  task_status  status;
} task_cb;

/** @brief define a task control block pool, contains an array of 
 *         all the TCBs and a run_pool, wait_pool mask
 */
typedef struct task_cb_pool
{
  // TCB array and end, running index
  task_cb      task_cb_arr[MAX_TASKS];
  unsigned int task_cb_end_idx;
  unsigned int task_cb_run_idx;

  // runnable pool, wait pool masks
  uint32_t     run_pool;
  uint32_t     wait_pool;

  // idle task
  task_cb      idle_task_cb; 
} task_cb_pool;

/** @brief statically allocate task control block pool */
task_cb_pool task_struct;

/** @brief Initialize the thread library
 *
 *  A user program must call this initializer before attempting to create any
 *  threads or start the scheduler.
 *
 *  @param idle_fn Pointer to a thread function to run when no other threads are
 *  runnable.
 *  @param idle_stack_start Pointer to the first valid location of idle thread's
 *  stack.
 *
 *  @return 0 on success or -1 on failure
 */
int thread_init(thread_fn idle_fn, uint32_t *idle_stack_start)
{
  // initialize task_cb_arr
  task_struct.task_cb_end_idx = 0;
  task_struct.task_cb_run_idx = 0;

  // initialize runnable and wait pool
  task_struct.run_pool    = 0;
  task_struct.wait_pool   = 0;

  // initialize idle task struct
  task_struct.idle_task_cb.stack_ptr = idle_stack_start;
  task_struct.idle_task_cb.pc        = (uint32_t *)idle_fn;
}

/** @brief Create a new thread running the given function
 *
 *  @param fn Pointer to the function to run in the new thread.
 *  @param stack_start Pointer to the first valid location of this thread's
 *  stack.
 *  @param prio Priority of this thread. Lower number are higher priority.
 *  @param C Real time execution time (ms).
 *  @param T Real time task period (ms).
 *
 *  @return 0 on success or -1 on failure
 */
int thread_create(thread_fn fn, uint32_t *stack_start,
                  unsigned int prio, unsigned int C, unsigned int T)
{
  unsigned int i = task_struct.task_cb_end_idx;

  // no more room for additional tasks
  if (i < 0 || i >= MAX_TASKS)
  {
    return -1;
  }

  // set TCB fields
  task_struct.task_cb_arr[i].stack_ptr = stack_start;
  task_struct.task_cb_arr[i].pc        = (uint32_t *)fn;
  task_struct.task_cb_arr[i].C         = C;
  task_struct.task_cb_arr[i].T         = T;
  task_struct.task_cb_arr[i].prio      = prio;
  task_struct.task_cb_arr[i].status    = RUNNABLE;

  // set the runnable pool
  POOL_SET_PRIO(task_struct.run_pool, prio);

  // set new end to task arr
  task_struct.task_cb_end_idx++;

  return 0;
}

/** @brief Initialize the mutex
 *
 *  A user program must call this initializer before attempting to lock or
 *  unlock the mutex. You can assume that this initializer will only be called
 *  once by any test programs.
 *
 *  @param mutex The mutex to act on.
 *  @param max_prio The maximum priority of a thread which could use
 *
 *  @return 0 on success or -1 on failure
 */
int mutex_init(mutex_t *mutex, unsigned int max_prio);

/** @brief Lock the mutex
 *
 *  This function will not return (may block) until the current thread has
 *  exclusive rights to the mutex. You can assume the mutex has been
 *  initialized.
 *
 *  @param mutex The mutex to act on.
 */
void mutex_lock(mutex_t *mutex);

/** @brief Unlock the mutex
 *
 *  @param mutex The mutex to act on.
 */
void mutex_unlock(mutex_t *mutex);

/** @brief Efficiently waits to run until the next period */
void wait_until_next_period(void);

/** @brief Get the current time in milliseconds */
unsigned int get_time(void);

/** @brief Allow the kernel to start running the added task set.
 *
 *  This function should enable IRQs and thus enable your scheduler. The kernel
 *  will test that a task set with this new task is scheduleable before running
 *  and may return an error if this is not the case.
 *
 *  @return 0 on success or -1 on failure
 */
int scheduler_start(void)
{
  enable_interrupts();
  return 0; 
}

