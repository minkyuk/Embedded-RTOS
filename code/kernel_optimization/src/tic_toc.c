/**
 * @file   tic_toc.c
 *
 * @brief  Implementation of tic-toc routines for interacting with ARM timer
 *
 * @date   September 25th, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

#include <BCM2836.h>
#include <tic_toc.h>

#define MAX_TIME 0xFFFFFFFF

#define TIMER_LOAD_REG    (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0xB400)
#define TIMER_VALUE_REG   (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0xB404)
#define TIMER_CONTROL_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0xB408)

/**
 * @brief Configures the arm timer to start running with the given frequency. 
 *        The timer should run in 32 bit mode, with a prescaler of 1
 */
void tic(void) 
{
  // initialize timer value
  *TIMER_LOAD_REG = MAX_TIME;

  // configure timer to 32 bit, prescaler 1
  *TIMER_CONTROL_REG = 0x82;
}

/**
 * @brief Called to check the value of the timer.
 *
 * @return time ticks that have elapsed since tic()
 */
uint32_t toc(void) {
  // read timer value, subtract from MAX_TIME since it counts down
  return (MAX_TIME - *TIMER_VALUE_REG);
}
