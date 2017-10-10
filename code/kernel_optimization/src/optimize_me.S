	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"optimize_me.c"
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
  // removed stuff
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	func, .-func
	.align	2
	.global	optimize_me
	.type	optimize_me, %function
optimize_me:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16     // get rid of
	sub	sp, sp, #28
  mov r9, r0
	//str	r0, [fp, #-40]  
	//mov	r3, #0          // get rid of
	//str	r3, [fp, #-24]
  mov r7, #0          //added
	b	.L4
.L7:
	mov	r3, #17
	str	r3, [fp, #-32]
  //mov	r3, #0
	//str	r3, [fp, #-28]
	mov r8, #0          //added
	b	.L5
.L6:
	//mov	r3, #2         // get rid of
	//str	r3, [fp, #-36] // doesn't do anything
	//ldr	r3, [fp, #-36] // doesn't do anything
	//add	r3, r3, #1     // "                "
	//str	r3, [fp, #-36] // "                "
	//ldr	r3, [fp, #-36] // "                "
	//sub	r2, r3, #2     // "                "
	//mov	r3, r2         // "                "
	//mov	r3, r3, asl #1 // "                "
	//add	r3, r3, r2     // mov r3, #3
	mov r3, #3           // added
  str	r3, [fp, #-36]
  //ldr r7, [fp, #-28]   // added
  //mov r3, r7, asl #2
  //check after
	//ldr	r3, [fp, #-28]
  mov r3, r8           // added
	mov	r3, r3, asl #2
	//ldr	r2, [fp, #-40] // remove
  mov r2, r9
	add	r4, r2, r3
	//ldr	r3, [fp, #-28] // reuse
	//mov	r3, r3, asl #2
	//ldr	r2, [fp, #-40] // reuse
	//add	r3, r2, r3     // mov r3, r4
	//ldr	r3, [r3]  
  ldr r3, [r4]         // added
	ldr	r2, [fp, #-32]   // 
	mul	r3, r2, r3
	add	r5, r3, #16
	//ldr	r3, [fp, #-24]
  mov r3, r7
	mov	r3, r3, asl #2
	//ldr	r2, [fp, #-40]   // reuse
	mov r2, r9
  add	r3, r2, r3
	ldr	r6, [r3]
	//ldr	r0, [fp, #-24]
	//ldr	r1, [fp, #-28] //reuse
  mov r1, r8 
  mov r0, r7
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	//ldr	r2, [fp, #-12]
  mov r2, r1           // added
	//start here
  mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r2, r3, r2
	//ldr	r3, [fp, #-8]
	//add	r3, r2, r3
	//mov	r0, r3
  add r0, r2, r0       // added
  //end here
	//bl	func
	mov	r3, r0
	mul	r3, r6, r3
	add	r2, r5, r3
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	add	r2, r3, #15
	cmp	r3, #0
	movlt	r3, r2
	movge	r3, r3
	mov	r3, r3, asr #4
	str	r3, [r4]
	//ldr	r3, [fp, #-28]
	//add	r3, r3, #1
	//str	r3, [fp, #-28]
  add r8, r8, #1
.L5:
	//ldr	r3, [fp, #-28]
	//cmp	r3, #500
  cmp r8, #500        //added
	blt	.L6
	//ldr	r3, [fp, #-24] //re-use
	//add	r3, r3, #1
	//str	r3, [fp, #-24] //re-use
  add r7, r7, #1
.L4:
	//ldr	r3, [fp, #-24]  // re-use from prior
	//cmp	r3, #500
	cmp r7, #500 //added
  blt	.L7
	sub	sp, fp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
	.size	optimize_me, .-optimize_me
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20150529 (release) [ARM/embedded-4_9-branch revision 224288]"
