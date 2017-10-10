/**
 * @file   supervisor.h
 *
 * @brief  Routines used in supervisor mode for settig up interrupts and user mode.
 *
 * @date   September 26 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#ifndef _SUPERVISOR_H_
#define _SUPERVISOR_H_

/**
 * @brief Installs the ARM vector table at address 0x0
 */
void install_interrupt_table();

/**
 * @brief Sets up user mode and jumps to user main() function
 *
 * @return Exit status of the user program
 */
int enter_user_mode();


#endif /* _SUPERVISOR_H_ */