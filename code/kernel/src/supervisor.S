/**
 * @file   supervisor.S
 *
 * @brief  Assembly implementation to setup interrupts and enter/exit user mode
 *
 * @date   October 4th, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

.section ".text"

/**
 * vector table that is loaded by install_vector_table to address 0x0
 */
interrupt_vector_table:
  // ARM core does the following on interrupt:
  // 1) save cpsr into spsr
  // 2) set mode bits in current cpsr
  // 3) disable further interrupts of lower/same priority
  // 4) store return address in lr
  // 5) set pc to correct vector table entry below
  ldr pc, _reset_asm_handler                 // priority: 1st
  ldr pc, _undefined_instruction_asm_handler // priority: 6th
  ldr pc, _swi_asm_handler                   // priority: 6th
  ldr pc, _prefetch_abort_asm_handler        // priority: 5th
  ldr pc, _data_abort_asm_handler            // priority: 2nd
  ldr pc, _reset_asm_handler                 // priority: undefined
  ldr pc, _irq_asm_handler                   // priority: 4th
  ldr pc, _fiq_asm_handler                   // priority: 3rd

/**
 * SOFT vector table that is loaded by install_vector_table ABOVE
 * interrupt_vector_table
 */
// to make sure the addresses are aligned this must follow the
// actual vector table above!
_reset_asm_handler:                 .word reset_asm_handler
_undefined_instruction_asm_handler: .word undefined_instruction_asm_handler
_swi_asm_handler:                   .word swi_asm_handler
_prefetch_abort_asm_handler:        .word prefetch_abort_asm_handler
_data_abort_asm_handler:            .word data_abort_asm_handler
_irq_asm_handler:                   .word irq_asm_handler
_fiq_asm_handler:                   .word fiq_asm_handler

/**
 * called to install the vector table at address 0x0
 */
.global install_interrupt_table
install_interrupt_table:
  stmfd sp!, {r0-r12, lr}
  ldr   r0,  =interrupt_vector_table
  mov   r1,  #0
  ldmia r0!, {r4-r11}
  stmia r1!, {r4-r11}
  ldr   r0,  =_reset_asm_handler
  ldmia r0!, {r4-r10}
  stmia r1!, {r4-r10}
  ldmfd sp!, {r0-r12, pc}
   

/************************************************************/
/* Assembly handlers for interrupts in the vector table     */
/************************************************************/

// TODO: Get this checked!
swi_asm_handler:
  sub    sp, sp, #4
  stmfd  sp!, {r0-r12, lr}
  mrs    r2, spsr
  str    r2, [sp, #14*4]
  mov    r1, sp
  ldr    r0, [lr, #-4]
  bic    r0, r0, #0xFF000000
  
  //start experimental IRQ
  mrs    r3, cpsr
  bic    r3, #0x80
  msr    cpsr, r3               // enable IRQ
  //end experimental IRQ
  
  bl      swi_c_handler

  ldr    r2, [sp, #14*4]
  msr    spsr, r2
  add    sp, sp, #4            // skipping r0
  ldmfd  sp!, {r1-r12, lr}
  add    sp, sp, #4
  movs   pc, lr

// TODO: Ensure that this works (and that idea is correct), still trying things out
// General Procedure: 
// 1. Check mode -> fetch appropriate lr and sp
// 2. Pass lr,sp into irq_c_handler
// 3. irq_c_handler will save context of running task (in task_struct), schedule and return pointer to new task
// 4. Access struct to get pc(lr), sp of next task
// 5. Set new context in appropriate mode
// 6. Return

// Questions:
// 1. Why do we want to pass lr_usr/lr_svc, and not lr_irq. Doesn't lr_irq act as the pc of the current task,
//    and so we want to save that instead?
// 2. Is there a better way of doing this without branching? (I'm trying this out)
irq_asm_handler:
  ldr   sp, =__irq_stack_top

  // TODO: Do we still want to save lr?
  sub   lr, lr, #4
  stmfd sp!, {r0-r12, lr}
  
  // Check mode
  mrs   r6, spsr
  and   r5, r6, #0xFF
  
  // Go to SYS mode, conditional on spsr in USR mode
  orrne r4, r6, #0x1F // system mode (11111)
  mrs   r7, cpsr      // save IRQ mode
  msr   cpsr, r4      // switch to either SVC or SYS mode

  mov   r0, sp  // ARG 0
  mov   r1, lr  // ARG 1

  msr   cpsr, r7      // go back to IRQ
  stmfd sp!, {r1-r12} // save registers
  
  bl    irq_c_handler // new task will be in r0

  ldmfd sp!, {r1-r12} // restore registers
 
  // Load new task lr, sp into registers 
  ldr   r2, [r0]      // load sp
  ldr   r3, [r0, #4]  // load pc, hope compiler alignment doesn't fuck me
 
  // Switch to SYS/SVC mode
  and   r5, r6, #0xFF
  orrne r4, r6, #0x1F
  mrs   r7, cpsr
  msr   cpsr, r4      // switch to either SVC or SYS mode
 
  // Set new context
  mov   sp, r2 
  mov   lr, r3

  msr  cpsr, r7       // go back to IRQ

  // Return from IRQ
  ldmfd sp!, {r0-r12, lr}
  movs  pc, lr 

reset_asm_handler:
  b _start // just reset the kernel


/************************************************************
 * If you fall into one of these handlers something bad is
 * happening. bkpt will drop back into gdb so you can debug.
 ************************************************************/
undefined_instruction_asm_handler:
  bkpt

prefetch_abort_asm_handler:
  bkpt

data_abort_asm_handler:
  bkpt

fiq_asm_handler:
  bkpt


/************************************************************/
/* Initializes cpsr for user mode and jumps to user program */
/************************************************************/
.global enter_user_mode
enter_user_mode:
  stmfd sp!, {r0-r12} 
  
  mrs r0, cpsr
  bic r0, r0, #0xFF
  // TODO: get this checked, we want to enter user mode w/out interrupts
  mov r0, #0xD0       // user mode | dis. FIQ | dis. IRQ (11010000)
  
  msr   cpsr, r0  
  ldr   sp, =__user_stack_top
  ldr   pc, =__user_program


