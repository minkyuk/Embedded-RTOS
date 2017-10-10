/**
 * @file   timer.c
 *
 * @brief  Implementation of routines for interacting with ARM timer
 *
 * @date   Oct 9th 
 * @author Minkyu Kim <minkyuk@andrew.cmu.edu>, Calvin Giroud <cgiroud@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <timer.h>
#include <BCM2836.h>

/** @brief base address of the ARM timer */ 
#define ARM_TIMER_BASE 0x00B000

/** @brief base address of the ARM interrupt */
#define ARM_INTERRUPT_BASE 0x00B000

/** @brief timer load register */
#define TIMER_LOAD_REG        (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_TIMER_BASE + 0x400)
/** @brief timer value register */
#define TIMER_VALUE_REG       (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_TIMER_BASE + 0x404)
/** @brief timer control register */
#define TIMER_CONTROL_REG     (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_TIMER_BASE + 0x408)
/** @brief timer IRQ clear register */
#define TIMER_IRQ_CLEAR_REG   (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_TIMER_BASE + 0x40C)
/** @brief timer IRQ mask register */
#define TIMER_IRQ_MASK_REG    (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_TIMER_BASE + 0x414)
/** @brief timer pre-divider register */
#define TIMER_PRE_DIV_REG     (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_TIMER_BASE + 0x41C)

/** @brief enable basic IRQs register */
#define ARM_ENABLE_BASIC_IRQ  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_INTERRUPT_BASE + 0x218)
/** @brief enable basic IRQs register */
#define ARM_PENDING_BASIC_IRQ (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_INTERRUPT_BASE + 0x200)
/** @brief enable basic IRQs register */
#define ARM_DISABLE_BASIC_IRQ (volatile uint32_t *)(MMIO_BASE_PHYSICAL + ARM_INTERRUPT_BASE + 0x224)


/**
 * @brief Configures the arm timer to start running with the given frequency. The Timer
 *        should run in 32 bit mode, with a prescaler of 1, and with interrupts enabled.
 *
 * @param freq  frequency at which to run the timer
 */
void timer_start(int freq) 
{
  // enable IRQ for timer
  *ARM_ENABLE_BASIC_IRQ = 0x1;

  // enable interrupts on timer side, timer, no-prescale
  *TIMER_CONTROL_REG = 0xA2;

  // set timer value
  *TIMER_LOAD_REG = 1000000 / freq;

  return;
}

/**
 * @brief Disables timer IRQs
 */
void timer_stop(void) 
{

  // disable IRQ
  *ARM_DISABLE_BASIC_IRQ = 0x1;
  
  return;
}

/**
 * @brief Determines if there is currently a pending timer interrupt
 *
 * @return 1 if timer interrupt is pending, 0 if not.
 */
int timer_is_pending(void) 
{
  //return (*TIMER_IRQ_MASK_REG & 0x1);
  return (*ARM_PENDING_BASIC_IRQ & 0x1);
}

/**
 * @brief Should be called to acknowledge that a timer interrupt occurred and has been
 *        appropriately handled. Will clear the pending bit in the timer's MMIO registers.
 */
void timer_clear_pending(void) 
{
  *TIMER_IRQ_CLEAR_REG = 0x1;
  return;
}
