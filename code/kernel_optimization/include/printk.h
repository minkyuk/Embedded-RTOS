/**
 * @file   printk.h
 *
 * @brief  kernel debugging routine
 *
 * @date   August 28 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#ifndef _PRINTK_H_
#define _PRINTK_H_

/**
 * @brief A kernel printf() function for debugging the kernel
 *
 * @param fmt the format string
 * @return 0 on success or -1 on failure
 */
int printk(const char *fmt, ...);

#endif /* _PRINTK_H_ */