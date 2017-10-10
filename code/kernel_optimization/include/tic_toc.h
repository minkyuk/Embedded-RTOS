/**
 * @file   tic_toc.h
 *
 * @brief  tic-toc routines for interacting with the ARM timer.
 *
 * @date   ???
 * @author ??? <???@andrew.cmu.edu>
 */

#ifndef _TIC_TOC_H_
#define _TIC_TOC_H_


#include <kstdint.h>	// to support uint32_t data types

/**
 * @brief Configures the arm timer to start running from the starting point with the given frequency.
 *        The Timer should run in 32 bit mode, with a prescaler of 1
 */
void tic(void);

/**
 * @brief Called to check the value of the timer.
 *
 * @return timer's decrementing value
 */
uint32_t toc(void);

#endif /* _TIC_TOC_H_ */