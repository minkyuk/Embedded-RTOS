/**
 * @file   timer.h
 *
 * @brief  Routines for interacting with the ARM timer.
 *
 * @date   September 26, 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#ifndef _TIMER_H_
#define _TIMER_H_

/**
 * @brief Configures the arm timer to start running with the given frequency. The Timer
 *        should run in 32 bit mode, with a prescaler of 1, and with interrupts enabled.
 *
 * @param freq  frequency at which to run the timer
 */
void timer_start(int freq);

/**
 * @brief Disables timer IRQs
 */
void timer_stop(void);

/**
 * @brief Determines if there is currently a pending timer interrupt
 *
 * @return 1 if timer interrupt is pending, 0 if not.
 */
int timer_is_pending(void);

/**
 * @brief Should be called to acknowledge that a timer interrupt occurred and has been
 *        appropriately handled. Will clear the pending bit in the timer's MMIO registers.
 */
void timer_clear_pending(void);

#endif /* _TIMER_H_ */