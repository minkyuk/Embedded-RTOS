
kernel/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__start>:
    8000:	e10f0000 	mrs	r0, CPSR
    8004:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8008:	e59fd034 	ldr	sp, [pc, #52]	; 8044 <hang+0x8>
    800c:	e121f000 	msr	CPSR_c, r0
    8010:	e59fd030 	ldr	sp, [pc, #48]	; 8048 <hang+0xc>
    8014:	e59f0030 	ldr	r0, [pc, #48]	; 804c <hang+0x10>
    8018:	e59f1030 	ldr	r1, [pc, #48]	; 8050 <hang+0x14>
    801c:	e3a02000 	mov	r2, #0
    8020:	e3a03000 	mov	r3, #0
    8024:	e3a04000 	mov	r4, #0
    8028:	e3a05000 	mov	r5, #0

0000802c <bss_loop>:
    802c:	e8a0003c 	stmia	r0!, {r2, r3, r4, r5}
    8030:	e1500001 	cmp	r0, r1
    8034:	3afffffc 	bcc	802c <bss_loop>
    8038:	eb000075 	bl	8214 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	0012d000 	andseq	sp, r2, r0
    8048:	0011c000 	andseq	ip, r1, r0
    804c:	0000b000 	andeq	fp, r0, r0
    8050:	0000c000 	andeq	ip, r0, r0

00008054 <led_init>:
    8054:	e92d4008 	push	{r3, lr}
    8058:	e3a0002f 	mov	r0, #47	; 0x2f
    805c:	e3a01001 	mov	r1, #1
    8060:	eb000013 	bl	80b4 <gpio_config>
    8064:	e3a00023 	mov	r0, #35	; 0x23
    8068:	e3a01001 	mov	r1, #1
    806c:	eb000010 	bl	80b4 <gpio_config>
    8070:	e8bd8008 	pop	{r3, pc}

00008074 <led_set_green>:
    8074:	e92d4008 	push	{r3, lr}
    8078:	e3a0002f 	mov	r0, #47	; 0x2f
    807c:	eb000021 	bl	8108 <gpio_set>
    8080:	e8bd8008 	pop	{r3, pc}

00008084 <led_clr_green>:
    8084:	e92d4008 	push	{r3, lr}
    8088:	e3a0002f 	mov	r0, #47	; 0x2f
    808c:	eb00002e 	bl	814c <gpio_clr>
    8090:	e8bd8008 	pop	{r3, pc}

00008094 <led_set_red>:
    8094:	e92d4008 	push	{r3, lr}
    8098:	e3a00023 	mov	r0, #35	; 0x23
    809c:	eb000019 	bl	8108 <gpio_set>
    80a0:	e8bd8008 	pop	{r3, pc}

000080a4 <led_clr_red>:
    80a4:	e92d4008 	push	{r3, lr}
    80a8:	e3a00023 	mov	r0, #35	; 0x23
    80ac:	eb000026 	bl	814c <gpio_clr>
    80b0:	e8bd8008 	pop	{r3, pc}

000080b4 <gpio_config>:
    80b4:	e3510007 	cmp	r1, #7
    80b8:	93500035 	cmpls	r0, #53	; 0x35
    80bc:	812fff1e 	bxhi	lr
    80c0:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    80c4:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    80c8:	e0832290 	umull	r2, r3, r0, r2
    80cc:	e1a0c1a3 	lsr	ip, r3, #3
    80d0:	e6ef307c 	uxtb	r3, ip
    80d4:	e1a03103 	lsl	r3, r3, #2
    80d8:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    80dc:	e2833602 	add	r3, r3, #2097152	; 0x200000
    80e0:	e5932000 	ldr	r2, [r3]
    80e4:	e08cc10c 	add	ip, ip, ip, lsl #2
    80e8:	e040008c 	sub	r0, r0, ip, lsl #1
    80ec:	e6ef0070 	uxtb	r0, r0
    80f0:	e0800080 	add	r0, r0, r0, lsl #1
    80f4:	e3a0c007 	mov	ip, #7
    80f8:	e1c2201c 	bic	r2, r2, ip, lsl r0
    80fc:	e1820011 	orr	r0, r2, r1, lsl r0
    8100:	e5830000 	str	r0, [r3]
    8104:	e12fff1e 	bx	lr

00008108 <gpio_set>:
    8108:	e3500035 	cmp	r0, #53	; 0x35
    810c:	812fff1e 	bxhi	lr
    8110:	e350001f 	cmp	r0, #31
    8114:	9a000006 	bls	8134 <gpio_set+0x2c>
    8118:	e2400020 	sub	r0, r0, #32
    811c:	e3a03001 	mov	r3, #1
    8120:	e1a00013 	lsl	r0, r3, r0
    8124:	e3a03000 	mov	r3, #0
    8128:	e3433f20 	movt	r3, #16160	; 0x3f20
    812c:	e5830020 	str	r0, [r3, #32]
    8130:	e12fff1e 	bx	lr
    8134:	e3a03001 	mov	r3, #1
    8138:	e1a00013 	lsl	r0, r3, r0
    813c:	e3a03000 	mov	r3, #0
    8140:	e3433f20 	movt	r3, #16160	; 0x3f20
    8144:	e583001c 	str	r0, [r3, #28]
    8148:	e12fff1e 	bx	lr

0000814c <gpio_clr>:
    814c:	e3500035 	cmp	r0, #53	; 0x35
    8150:	812fff1e 	bxhi	lr
    8154:	e350001f 	cmp	r0, #31
    8158:	9a000006 	bls	8178 <gpio_clr+0x2c>
    815c:	e2400020 	sub	r0, r0, #32
    8160:	e3a03001 	mov	r3, #1
    8164:	e1a00013 	lsl	r0, r3, r0
    8168:	e3a03000 	mov	r3, #0
    816c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8170:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8174:	e12fff1e 	bx	lr
    8178:	e3a03001 	mov	r3, #1
    817c:	e1a00013 	lsl	r0, r3, r0
    8180:	e3a03000 	mov	r3, #0
    8184:	e3433f20 	movt	r3, #16160	; 0x3f20
    8188:	e5830028 	str	r0, [r3, #40]	; 0x28
    818c:	e12fff1e 	bx	lr

00008190 <gpio_set_pull>:
    8190:	e3510002 	cmp	r1, #2
    8194:	93500035 	cmpls	r0, #53	; 0x35
    8198:	812fff1e 	bxhi	lr
    819c:	e92d4038 	push	{r3, r4, r5, lr}
    81a0:	e1a04000 	mov	r4, r0
    81a4:	e3a03000 	mov	r3, #0
    81a8:	e3433f20 	movt	r3, #16160	; 0x3f20
    81ac:	e5831094 	str	r1, [r3, #148]	; 0x94
    81b0:	e3a00096 	mov	r0, #150	; 0x96
    81b4:	eb000257 	bl	8b18 <delay_cycles>
    81b8:	e354001f 	cmp	r4, #31
    81bc:	9a00000a 	bls	81ec <gpio_set_pull+0x5c>
    81c0:	e2440020 	sub	r0, r4, #32
    81c4:	e3a04001 	mov	r4, #1
    81c8:	e1a00014 	lsl	r0, r4, r0
    81cc:	e3a05000 	mov	r5, #0
    81d0:	e3435f20 	movt	r5, #16160	; 0x3f20
    81d4:	e585009c 	str	r0, [r5, #156]	; 0x9c
    81d8:	e3a00096 	mov	r0, #150	; 0x96
    81dc:	eb00024d 	bl	8b18 <delay_cycles>
    81e0:	e3a03000 	mov	r3, #0
    81e4:	e585309c 	str	r3, [r5, #156]	; 0x9c
    81e8:	e8bd8038 	pop	{r3, r4, r5, pc}
    81ec:	e3a00001 	mov	r0, #1
    81f0:	e1a00410 	lsl	r0, r0, r4
    81f4:	e3a05000 	mov	r5, #0
    81f8:	e3435f20 	movt	r5, #16160	; 0x3f20
    81fc:	e5850098 	str	r0, [r5, #152]	; 0x98
    8200:	e3a00096 	mov	r0, #150	; 0x96
    8204:	eb000243 	bl	8b18 <delay_cycles>
    8208:	e3a03000 	mov	r3, #0
    820c:	e5853098 	str	r3, [r5, #152]	; 0x98
    8210:	e8bd8038 	pop	{r3, r4, r5, pc}

00008214 <kernel_main>:
    8214:	e92d4008 	push	{r3, lr}
    8218:	eb0000eb 	bl	85cc <uart_init>
    821c:	eb0001ab 	bl	88d0 <adc_init>
    8220:	eb00025c 	bl	8b98 <install_interrupt_table>
    8224:	eb000247 	bl	8b48 <enable_interrupts>
    8228:	eb00027f 	bl	8c2c <enter_user_mode>
    822c:	eafffffe 	b	822c <kernel_main+0x18>

00008230 <irq_c_handler>:
    8230:	e92d4010 	push	{r4, lr}
    8234:	e30b3004 	movw	r3, #45060	; 0xb004
    8238:	e3403000 	movt	r3, #0
    823c:	e5934000 	ldr	r4, [r3]
    8240:	e3a00001 	mov	r0, #1
    8244:	eb0001a5 	bl	88e0 <adc_read>
    8248:	e12fff34 	blx	r4
    824c:	eb00019a 	bl	88bc <timer_clear_pending>
    8250:	e8bd8010 	pop	{r4, pc}

00008254 <swi_c_handler>:
    8254:	e92d4008 	push	{r3, lr}
    8258:	e1a03001 	mov	r3, r1
    825c:	e3500009 	cmp	r0, #9
    8260:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
    8264:	ea000030 	b	832c <swi_c_handler+0xd8>
    8268:	00008290 	muleq	r0, r0, r2
    826c:	0000829c 	muleq	r0, ip, r2
    8270:	000082b0 			; <UNDEFINED> instruction: 0x000082b0
    8274:	000082bc 			; <UNDEFINED> instruction: 0x000082bc
    8278:	000082cc 	andeq	r8, r0, ip, asr #5
    827c:	000082d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
    8280:	000082ec 	andeq	r8, r0, ip, ror #5
    8284:	00008300 	andeq	r8, r0, r0, lsl #6
    8288:	00008310 	andeq	r8, r0, r0, lsl r3
    828c:	00008324 	andeq	r8, r0, r4, lsr #6
    8290:	e5910000 	ldr	r0, [r1]
    8294:	eb000201 	bl	8aa0 <syscall_sbrk>
    8298:	e8bd8008 	pop	{r3, pc}
    829c:	e5910000 	ldr	r0, [r1]
    82a0:	e5911004 	ldr	r1, [r1, #4]
    82a4:	e5932008 	ldr	r2, [r3, #8]
    82a8:	eb0001b5 	bl	8984 <syscall_write>
    82ac:	e8bd8008 	pop	{r3, pc}
    82b0:	e5910000 	ldr	r0, [r1]
    82b4:	eb00020f 	bl	8af8 <syscall_close>
    82b8:	e8bd8008 	pop	{r3, pc}
    82bc:	e5910000 	ldr	r0, [r1]
    82c0:	e5911004 	ldr	r1, [r1, #4]
    82c4:	eb00020d 	bl	8b00 <syscall_fstat>
    82c8:	e8bd8008 	pop	{r3, pc}
    82cc:	e5910000 	ldr	r0, [r1]
    82d0:	eb00020c 	bl	8b08 <syscall_isatty>
    82d4:	e8bd8008 	pop	{r3, pc}
    82d8:	e5910000 	ldr	r0, [r1]
    82dc:	e5911004 	ldr	r1, [r1, #4]
    82e0:	e5932008 	ldr	r2, [r3, #8]
    82e4:	eb000209 	bl	8b10 <syscall_lseek>
    82e8:	e8bd8008 	pop	{r3, pc}
    82ec:	e5910000 	ldr	r0, [r1]
    82f0:	e5911004 	ldr	r1, [r1, #4]
    82f4:	e5932008 	ldr	r2, [r3, #8]
    82f8:	eb0001b3 	bl	89cc <syscall_read>
    82fc:	e8bd8008 	pop	{r3, pc}
    8300:	e5910000 	ldr	r0, [r1]
    8304:	eb000198 	bl	896c <syscall_exit>
    8308:	e3a00000 	mov	r0, #0
    830c:	e8bd8008 	pop	{r3, pc}
    8310:	e5910000 	ldr	r0, [r1]
    8314:	e5d11004 	ldrb	r1, [r1, #4]
    8318:	e5932008 	ldr	r2, [r3, #8]
    831c:	eb0001d2 	bl	8a6c <syscall_sample_adc_start>
    8320:	e8bd8008 	pop	{r3, pc}
    8324:	eb0001d9 	bl	8a90 <syscall_sample_adc_stop>
    8328:	e8bd8008 	pop	{r3, pc}
    832c:	e3a00000 	mov	r0, #0
    8330:	e8bd8008 	pop	{r3, pc}

00008334 <printnumk>:
    8334:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8338:	e24dd008 	sub	sp, sp, #8
    833c:	e1a06002 	mov	r6, r2
    8340:	e1a07003 	mov	r7, r3
    8344:	e3500008 	cmp	r0, #8
    8348:	0a000004 	beq	8360 <printnumk+0x2c>
    834c:	e30a8018 	movw	r8, #40984	; 0xa018
    8350:	e3408000 	movt	r8, #0
    8354:	e3500010 	cmp	r0, #16
    8358:	13a08000 	movne	r8, #0
    835c:	ea000001 	b	8368 <printnumk+0x34>
    8360:	e30a8014 	movw	r8, #40980	; 0xa014
    8364:	e3408000 	movt	r8, #0
    8368:	e28d4007 	add	r4, sp, #7
    836c:	e1a05000 	mov	r5, r0
    8370:	e3a09000 	mov	r9, #0
    8374:	e30aa000 	movw	sl, #40960	; 0xa000
    8378:	e340a000 	movt	sl, #0
    837c:	e1a00006 	mov	r0, r6
    8380:	e1a01007 	mov	r1, r7
    8384:	e1a02005 	mov	r2, r5
    8388:	e1a03009 	mov	r3, r9
    838c:	eb000285 	bl	8da8 <__aeabi_uldivmod>
    8390:	e7da3002 	ldrb	r3, [sl, r2]
    8394:	e4443001 	strb	r3, [r4], #-1
    8398:	e1a00006 	mov	r0, r6
    839c:	e1a01007 	mov	r1, r7
    83a0:	e1a02005 	mov	r2, r5
    83a4:	e1a03009 	mov	r3, r9
    83a8:	eb00027e 	bl	8da8 <__aeabi_uldivmod>
    83ac:	e1a06000 	mov	r6, r0
    83b0:	e1a07001 	mov	r7, r1
    83b4:	e1963007 	orrs	r3, r6, r7
    83b8:	1affffef 	bne	837c <printnumk+0x48>
    83bc:	e3580000 	cmp	r8, #0
    83c0:	0a000002 	beq	83d0 <printnumk+0x9c>
    83c4:	e5d80000 	ldrb	r0, [r8]
    83c8:	e3500000 	cmp	r0, #0
    83cc:	1a000004 	bne	83e4 <printnumk+0xb0>
    83d0:	e2844001 	add	r4, r4, #1
    83d4:	e28d3008 	add	r3, sp, #8
    83d8:	e1540003 	cmp	r4, r3
    83dc:	1a000005 	bne	83f8 <printnumk+0xc4>
    83e0:	ea000009 	b	840c <printnumk+0xd8>
    83e4:	eb000095 	bl	8640 <uart_put_byte>
    83e8:	e5f80001 	ldrb	r0, [r8, #1]!
    83ec:	e3500000 	cmp	r0, #0
    83f0:	1afffffb 	bne	83e4 <printnumk+0xb0>
    83f4:	eafffff5 	b	83d0 <printnumk+0x9c>
    83f8:	e4d40001 	ldrb	r0, [r4], #1
    83fc:	eb00008f 	bl	8640 <uart_put_byte>
    8400:	e28d3008 	add	r3, sp, #8
    8404:	e1540003 	cmp	r4, r3
    8408:	1afffffa 	bne	83f8 <printnumk+0xc4>
    840c:	e28dd008 	add	sp, sp, #8
    8410:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

00008414 <printk>:
    8414:	e92d000f 	push	{r0, r1, r2, r3}
    8418:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    841c:	e24dd008 	sub	sp, sp, #8
    8420:	e59d4020 	ldr	r4, [sp, #32]
    8424:	e28d3024 	add	r3, sp, #36	; 0x24
    8428:	e58d3004 	str	r3, [sp, #4]
    842c:	e3a06000 	mov	r6, #0
    8430:	e3a08008 	mov	r8, #8
    8434:	e3a07010 	mov	r7, #16
    8438:	ea00005c 	b	85b0 <printk+0x19c>
    843c:	e3500025 	cmp	r0, #37	; 0x25
    8440:	0a000002 	beq	8450 <printk+0x3c>
    8444:	e2844001 	add	r4, r4, #1
    8448:	eb00007c 	bl	8640 <uart_put_byte>
    844c:	ea000057 	b	85b0 <printk+0x19c>
    8450:	e5d43001 	ldrb	r3, [r4, #1]
    8454:	e353006f 	cmp	r3, #111	; 0x6f
    8458:	0a00002c 	beq	8510 <printk+0xfc>
    845c:	8a000006 	bhi	847c <printk+0x68>
    8460:	e3530063 	cmp	r3, #99	; 0x63
    8464:	0a000045 	beq	8580 <printk+0x16c>
    8468:	e3530064 	cmp	r3, #100	; 0x64
    846c:	0a00000d 	beq	84a8 <printk+0x94>
    8470:	e3530025 	cmp	r3, #37	; 0x25
    8474:	1a00004a 	bne	85a4 <printk+0x190>
    8478:	ea000046 	b	8598 <printk+0x184>
    847c:	e3530073 	cmp	r3, #115	; 0x73
    8480:	0a000032 	beq	8550 <printk+0x13c>
    8484:	8a000002 	bhi	8494 <printk+0x80>
    8488:	e3530070 	cmp	r3, #112	; 0x70
    848c:	0a000027 	beq	8530 <printk+0x11c>
    8490:	ea000043 	b	85a4 <printk+0x190>
    8494:	e3530075 	cmp	r3, #117	; 0x75
    8498:	0a000014 	beq	84f0 <printk+0xdc>
    849c:	e3530078 	cmp	r3, #120	; 0x78
    84a0:	0a000022 	beq	8530 <printk+0x11c>
    84a4:	ea00003e 	b	85a4 <printk+0x190>
    84a8:	e59d3004 	ldr	r3, [sp, #4]
    84ac:	e2832004 	add	r2, r3, #4
    84b0:	e58d2004 	str	r2, [sp, #4]
    84b4:	e5935000 	ldr	r5, [r3]
    84b8:	e3550000 	cmp	r5, #0
    84bc:	aa000006 	bge	84dc <printk+0xc8>
    84c0:	e3a0002d 	mov	r0, #45	; 0x2d
    84c4:	eb00005d 	bl	8640 <uart_put_byte>
    84c8:	e2652000 	rsb	r2, r5, #0
    84cc:	e3a0000a 	mov	r0, #10
    84d0:	e1a03fc2 	asr	r3, r2, #31
    84d4:	ebffff96 	bl	8334 <printnumk>
    84d8:	ea000033 	b	85ac <printk+0x198>
    84dc:	e3a0000a 	mov	r0, #10
    84e0:	e1a02005 	mov	r2, r5
    84e4:	e1a03fc5 	asr	r3, r5, #31
    84e8:	ebffff91 	bl	8334 <printnumk>
    84ec:	ea00002e 	b	85ac <printk+0x198>
    84f0:	e59d3004 	ldr	r3, [sp, #4]
    84f4:	e2832004 	add	r2, r3, #4
    84f8:	e58d2004 	str	r2, [sp, #4]
    84fc:	e3a0000a 	mov	r0, #10
    8500:	e5932000 	ldr	r2, [r3]
    8504:	e1a03006 	mov	r3, r6
    8508:	ebffff89 	bl	8334 <printnumk>
    850c:	ea000026 	b	85ac <printk+0x198>
    8510:	e59d3004 	ldr	r3, [sp, #4]
    8514:	e2832004 	add	r2, r3, #4
    8518:	e58d2004 	str	r2, [sp, #4]
    851c:	e1a00008 	mov	r0, r8
    8520:	e5932000 	ldr	r2, [r3]
    8524:	e1a03006 	mov	r3, r6
    8528:	ebffff81 	bl	8334 <printnumk>
    852c:	ea00001e 	b	85ac <printk+0x198>
    8530:	e59d3004 	ldr	r3, [sp, #4]
    8534:	e2832004 	add	r2, r3, #4
    8538:	e58d2004 	str	r2, [sp, #4]
    853c:	e1a00007 	mov	r0, r7
    8540:	e5932000 	ldr	r2, [r3]
    8544:	e1a03006 	mov	r3, r6
    8548:	ebffff79 	bl	8334 <printnumk>
    854c:	ea000016 	b	85ac <printk+0x198>
    8550:	e59d3004 	ldr	r3, [sp, #4]
    8554:	e2832004 	add	r2, r3, #4
    8558:	e58d2004 	str	r2, [sp, #4]
    855c:	e5935000 	ldr	r5, [r3]
    8560:	e5d50000 	ldrb	r0, [r5]
    8564:	e3500000 	cmp	r0, #0
    8568:	0a00000f 	beq	85ac <printk+0x198>
    856c:	eb000033 	bl	8640 <uart_put_byte>
    8570:	e5f50001 	ldrb	r0, [r5, #1]!
    8574:	e3500000 	cmp	r0, #0
    8578:	1afffffb 	bne	856c <printk+0x158>
    857c:	ea00000a 	b	85ac <printk+0x198>
    8580:	e59d3004 	ldr	r3, [sp, #4]
    8584:	e2832004 	add	r2, r3, #4
    8588:	e58d2004 	str	r2, [sp, #4]
    858c:	e5d30000 	ldrb	r0, [r3]
    8590:	eb00002a 	bl	8640 <uart_put_byte>
    8594:	ea000004 	b	85ac <printk+0x198>
    8598:	e3a00025 	mov	r0, #37	; 0x25
    859c:	eb000027 	bl	8640 <uart_put_byte>
    85a0:	ea000001 	b	85ac <printk+0x198>
    85a4:	e3e00000 	mvn	r0, #0
    85a8:	ea000003 	b	85bc <printk+0x1a8>
    85ac:	e2844002 	add	r4, r4, #2
    85b0:	e5d40000 	ldrb	r0, [r4]
    85b4:	e3500000 	cmp	r0, #0
    85b8:	1affff9f 	bne	843c <printk+0x28>
    85bc:	e28dd008 	add	sp, sp, #8
    85c0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    85c4:	e28dd010 	add	sp, sp, #16
    85c8:	e12fff1e 	bx	lr

000085cc <uart_init>:
    85cc:	e92d4010 	push	{r4, lr}
    85d0:	e3a04a05 	mov	r4, #20480	; 0x5000
    85d4:	e3434f21 	movt	r4, #16161	; 0x3f21
    85d8:	e3a03001 	mov	r3, #1
    85dc:	e5843004 	str	r3, [r4, #4]
    85e0:	e3a0000f 	mov	r0, #15
    85e4:	e3a01000 	mov	r1, #0
    85e8:	ebfffee8 	bl	8190 <gpio_set_pull>
    85ec:	e3a0000e 	mov	r0, #14
    85f0:	e3a01000 	mov	r1, #0
    85f4:	ebfffee5 	bl	8190 <gpio_set_pull>
    85f8:	e3a0000f 	mov	r0, #15
    85fc:	e3a01002 	mov	r1, #2
    8600:	ebfffeab 	bl	80b4 <gpio_config>
    8604:	e3a0000e 	mov	r0, #14
    8608:	e3a01002 	mov	r1, #2
    860c:	ebfffea8 	bl	80b4 <gpio_config>
    8610:	e3a03000 	mov	r3, #0
    8614:	e5843044 	str	r3, [r4, #68]	; 0x44
    8618:	e3a03003 	mov	r3, #3
    861c:	e584304c 	str	r3, [r4, #76]	; 0x4c
    8620:	e300310e 	movw	r3, #270	; 0x10e
    8624:	e5843068 	str	r3, [r4, #104]	; 0x68
    8628:	e8bd8010 	pop	{r4, pc}

0000862c <uart_close>:
    862c:	e3a03a05 	mov	r3, #20480	; 0x5000
    8630:	e3433f21 	movt	r3, #16161	; 0x3f21
    8634:	e3a02000 	mov	r2, #0
    8638:	e5832004 	str	r2, [r3, #4]
    863c:	e12fff1e 	bx	lr

00008640 <uart_put_byte>:
    8640:	e3a02a05 	mov	r2, #20480	; 0x5000
    8644:	e3432f21 	movt	r2, #16161	; 0x3f21
    8648:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    864c:	e3130040 	tst	r3, #64	; 0x40
    8650:	0afffffc 	beq	8648 <uart_put_byte+0x8>
    8654:	e3a03a05 	mov	r3, #20480	; 0x5000
    8658:	e3433f21 	movt	r3, #16161	; 0x3f21
    865c:	e5830040 	str	r0, [r3, #64]	; 0x40
    8660:	e12fff1e 	bx	lr

00008664 <uart_get_byte>:
    8664:	e3a02a05 	mov	r2, #20480	; 0x5000
    8668:	e3432f21 	movt	r2, #16161	; 0x3f21
    866c:	e5923054 	ldr	r3, [r2, #84]	; 0x54
    8670:	e3130001 	tst	r3, #1
    8674:	0afffffc 	beq	866c <uart_get_byte+0x8>
    8678:	e3a03a05 	mov	r3, #20480	; 0x5000
    867c:	e3433f21 	movt	r3, #16161	; 0x3f21
    8680:	e5930040 	ldr	r0, [r3, #64]	; 0x40
    8684:	e6ef0070 	uxtb	r0, r0
    8688:	e12fff1e 	bx	lr

0000868c <i2c_master_init>:
    868c:	e92d4010 	push	{r4, lr}
    8690:	e1a04000 	mov	r4, r0
    8694:	e3a00002 	mov	r0, #2
    8698:	e3a01000 	mov	r1, #0
    869c:	ebfffebb 	bl	8190 <gpio_set_pull>
    86a0:	e3a00003 	mov	r0, #3
    86a4:	e3a01000 	mov	r1, #0
    86a8:	ebfffeb8 	bl	8190 <gpio_set_pull>
    86ac:	e3a00002 	mov	r0, #2
    86b0:	e3a01004 	mov	r1, #4
    86b4:	ebfffe7e 	bl	80b4 <gpio_config>
    86b8:	e3a00003 	mov	r0, #3
    86bc:	e3a01004 	mov	r1, #4
    86c0:	ebfffe7b 	bl	80b4 <gpio_config>
    86c4:	e3a03901 	mov	r3, #16384	; 0x4000
    86c8:	e3433f80 	movt	r3, #16256	; 0x3f80
    86cc:	e5834014 	str	r4, [r3, #20]
    86d0:	e8bd8010 	pop	{r4, pc}

000086d4 <i2c_master_write>:
    86d4:	e3a03901 	mov	r3, #16384	; 0x4000
    86d8:	e3433f80 	movt	r3, #16256	; 0x3f80
    86dc:	e3a0c902 	mov	ip, #32768	; 0x8000
    86e0:	e583c000 	str	ip, [r3]
    86e4:	e3510010 	cmp	r1, #16
    86e8:	93a03000 	movls	r3, #0
    86ec:	83a03001 	movhi	r3, #1
    86f0:	e19333a2 	orrs	r3, r3, r2, lsr #7
    86f4:	1a000026 	bne	8794 <i2c_master_write+0xc0>
    86f8:	e3a03901 	mov	r3, #16384	; 0x4000
    86fc:	e3433f80 	movt	r3, #16256	; 0x3f80
    8700:	e583200c 	str	r2, [r3, #12]
    8704:	e5831008 	str	r1, [r3, #8]
    8708:	e3510000 	cmp	r1, #0
    870c:	0a000008 	beq	8734 <i2c_master_write+0x60>
    8710:	e2403001 	sub	r3, r0, #1
    8714:	e2411001 	sub	r1, r1, #1
    8718:	e6f00071 	uxtah	r0, r0, r1
    871c:	e3a01901 	mov	r1, #16384	; 0x4000
    8720:	e3431f80 	movt	r1, #16256	; 0x3f80
    8724:	e5f32001 	ldrb	r2, [r3, #1]!
    8728:	e5812010 	str	r2, [r1, #16]
    872c:	e1530000 	cmp	r3, r0
    8730:	1afffffb 	bne	8724 <i2c_master_write+0x50>
    8734:	e3a03901 	mov	r3, #16384	; 0x4000
    8738:	e3433f80 	movt	r3, #16256	; 0x3f80
    873c:	e3082080 	movw	r2, #32896	; 0x8080
    8740:	e5832000 	str	r2, [r3]
    8744:	e3a02901 	mov	r2, #16384	; 0x4000
    8748:	e3432f80 	movt	r2, #16256	; 0x3f80
    874c:	e5923004 	ldr	r3, [r2, #4]
    8750:	e3130002 	tst	r3, #2
    8754:	0afffffc 	beq	874c <i2c_master_write+0x78>
    8758:	e3a03901 	mov	r3, #16384	; 0x4000
    875c:	e3433f80 	movt	r3, #16256	; 0x3f80
    8760:	e5932004 	ldr	r2, [r3, #4]
    8764:	e3c22002 	bic	r2, r2, #2
    8768:	e5832004 	str	r2, [r3, #4]
    876c:	e3082030 	movw	r2, #32816	; 0x8030
    8770:	e5832000 	str	r2, [r3]
    8774:	e5932004 	ldr	r2, [r3, #4]
    8778:	e6ff2072 	uxth	r2, r2
    877c:	e5832004 	str	r2, [r3, #4]
    8780:	e5932000 	ldr	r2, [r3]
    8784:	e6ff2072 	uxth	r2, r2
    8788:	e5832000 	str	r2, [r3]
    878c:	e3a00000 	mov	r0, #0
    8790:	e12fff1e 	bx	lr
    8794:	e3a00001 	mov	r0, #1
    8798:	e12fff1e 	bx	lr

0000879c <i2c_master_read>:
    879c:	e3a03901 	mov	r3, #16384	; 0x4000
    87a0:	e3433f80 	movt	r3, #16256	; 0x3f80
    87a4:	e308c001 	movw	ip, #32769	; 0x8001
    87a8:	e583c000 	str	ip, [r3]
    87ac:	e3510010 	cmp	r1, #16
    87b0:	93a03000 	movls	r3, #0
    87b4:	83a03001 	movhi	r3, #1
    87b8:	e19333a2 	orrs	r3, r3, r2, lsr #7
    87bc:	1a000025 	bne	8858 <i2c_master_read+0xbc>
    87c0:	e3a03901 	mov	r3, #16384	; 0x4000
    87c4:	e3433f80 	movt	r3, #16256	; 0x3f80
    87c8:	e583200c 	str	r2, [r3, #12]
    87cc:	e5831008 	str	r1, [r3, #8]
    87d0:	e3082081 	movw	r2, #32897	; 0x8081
    87d4:	e5832000 	str	r2, [r3]
    87d8:	e3a02901 	mov	r2, #16384	; 0x4000
    87dc:	e3432f80 	movt	r2, #16256	; 0x3f80
    87e0:	e5923004 	ldr	r3, [r2, #4]
    87e4:	e3130002 	tst	r3, #2
    87e8:	0afffffc 	beq	87e0 <i2c_master_read+0x44>
    87ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    87f0:	e3510000 	cmp	r1, #0
    87f4:	0a000008 	beq	881c <i2c_master_read+0x80>
    87f8:	e2403001 	sub	r3, r0, #1
    87fc:	e2412001 	sub	r2, r1, #1
    8800:	e6f0c072 	uxtah	ip, r0, r2
    8804:	e3a0e901 	mov	lr, #16384	; 0x4000
    8808:	e343ef80 	movt	lr, #16256	; 0x3f80
    880c:	e59e2010 	ldr	r2, [lr, #16]
    8810:	e5e32001 	strb	r2, [r3, #1]!
    8814:	e153000c 	cmp	r3, ip
    8818:	1afffffb 	bne	880c <i2c_master_read+0x70>
    881c:	e3a03901 	mov	r3, #16384	; 0x4000
    8820:	e3433f80 	movt	r3, #16256	; 0x3f80
    8824:	e5932004 	ldr	r2, [r3, #4]
    8828:	e3c22002 	bic	r2, r2, #2
    882c:	e5832004 	str	r2, [r3, #4]
    8830:	e3082030 	movw	r2, #32816	; 0x8030
    8834:	e5832000 	str	r2, [r3]
    8838:	e5932004 	ldr	r2, [r3, #4]
    883c:	e6ff2072 	uxth	r2, r2
    8840:	e5832004 	str	r2, [r3, #4]
    8844:	e5932000 	ldr	r2, [r3]
    8848:	e6ff2072 	uxth	r2, r2
    884c:	e5832000 	str	r2, [r3]
    8850:	e6ef0071 	uxtb	r0, r1
    8854:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    8858:	e3a00001 	mov	r0, #1
    885c:	e12fff1e 	bx	lr

00008860 <timer_start>:
    8860:	e92d4010 	push	{r4, lr}
    8864:	e1a01000 	mov	r1, r0
    8868:	e3a04a0b 	mov	r4, #45056	; 0xb000
    886c:	e3434f00 	movt	r4, #16128	; 0x3f00
    8870:	e3a03001 	mov	r3, #1
    8874:	e5843218 	str	r3, [r4, #536]	; 0x218
    8878:	e3a030a2 	mov	r3, #162	; 0xa2
    887c:	e5843408 	str	r3, [r4, #1032]	; 0x408
    8880:	e3040240 	movw	r0, #16960	; 0x4240
    8884:	e340000f 	movt	r0, #15
    8888:	eb0000f3 	bl	8c5c <__aeabi_idiv>
    888c:	e5840400 	str	r0, [r4, #1024]	; 0x400
    8890:	e8bd8010 	pop	{r4, pc}

00008894 <timer_stop>:
    8894:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8898:	e3433f00 	movt	r3, #16128	; 0x3f00
    889c:	e3a02001 	mov	r2, #1
    88a0:	e5832224 	str	r2, [r3, #548]	; 0x224
    88a4:	e12fff1e 	bx	lr

000088a8 <timer_is_pending>:
    88a8:	e3a03a0b 	mov	r3, #45056	; 0xb000
    88ac:	e3433f00 	movt	r3, #16128	; 0x3f00
    88b0:	e5930200 	ldr	r0, [r3, #512]	; 0x200
    88b4:	e2000001 	and	r0, r0, #1
    88b8:	e12fff1e 	bx	lr

000088bc <timer_clear_pending>:
    88bc:	e3a03a0b 	mov	r3, #45056	; 0xb000
    88c0:	e3433f00 	movt	r3, #16128	; 0x3f00
    88c4:	e3a02001 	mov	r2, #1
    88c8:	e583240c 	str	r2, [r3, #1036]	; 0x40c
    88cc:	e12fff1e 	bx	lr

000088d0 <adc_init>:
    88d0:	e92d4008 	push	{r3, lr}
    88d4:	e30005dc 	movw	r0, #1500	; 0x5dc
    88d8:	ebffff6b 	bl	868c <i2c_master_init>
    88dc:	e8bd8008 	pop	{r3, pc}

000088e0 <adc_read>:
    88e0:	e92d4010 	push	{r4, lr}
    88e4:	e24dd008 	sub	sp, sp, #8
    88e8:	e3500000 	cmp	r0, #0
    88ec:	0a000003 	beq	8900 <adc_read+0x20>
    88f0:	e3500001 	cmp	r0, #1
    88f4:	03a03060 	moveq	r3, #96	; 0x60
    88f8:	0a000001 	beq	8904 <adc_read+0x24>
    88fc:	ea000017 	b	8960 <adc_read+0x80>
    8900:	e3a03070 	mov	r3, #112	; 0x70
    8904:	e3a04001 	mov	r4, #1
    8908:	e5cd4004 	strb	r4, [sp, #4]
    890c:	e5cd3005 	strb	r3, [sp, #5]
    8910:	e3e0307c 	mvn	r3, #124	; 0x7c
    8914:	e5cd3006 	strb	r3, [sp, #6]
    8918:	e28d0004 	add	r0, sp, #4
    891c:	e3a01003 	mov	r1, #3
    8920:	e3a02049 	mov	r2, #73	; 0x49
    8924:	ebffff6a 	bl	86d4 <i2c_master_write>
    8928:	e3a03000 	mov	r3, #0
    892c:	e5cd3004 	strb	r3, [sp, #4]
    8930:	e28d0004 	add	r0, sp, #4
    8934:	e1a01004 	mov	r1, r4
    8938:	e3a02049 	mov	r2, #73	; 0x49
    893c:	ebffff64 	bl	86d4 <i2c_master_write>
    8940:	e28d0004 	add	r0, sp, #4
    8944:	e3a01002 	mov	r1, #2
    8948:	e3a02049 	mov	r2, #73	; 0x49
    894c:	ebffff92 	bl	879c <i2c_master_read>
    8950:	e5dd0004 	ldrb	r0, [sp, #4]
    8954:	e5dd3005 	ldrb	r3, [sp, #5]
    8958:	e1830400 	orr	r0, r3, r0, lsl #8
    895c:	ea000000 	b	8964 <adc_read+0x84>
    8960:	e3a00001 	mov	r0, #1
    8964:	e28dd008 	add	sp, sp, #8
    8968:	e8bd8010 	pop	{r4, pc}

0000896c <syscall_exit>:
    896c:	e92d4008 	push	{r3, lr}
    8970:	e1a01000 	mov	r1, r0
    8974:	e30a001c 	movw	r0, #40988	; 0xa01c
    8978:	e3400000 	movt	r0, #0
    897c:	ebfffea4 	bl	8414 <printk>
    8980:	eafffffe 	b	8980 <syscall_exit+0x14>

00008984 <syscall_write>:
    8984:	e3500001 	cmp	r0, #1
    8988:	1a00000b 	bne	89bc <syscall_write+0x38>
    898c:	e3520000 	cmp	r2, #0
    8990:	da00000b 	ble	89c4 <syscall_write+0x40>
    8994:	e92d4070 	push	{r4, r5, r6, lr}
    8998:	e1a06002 	mov	r6, r2
    899c:	e1a04001 	mov	r4, r1
    89a0:	e0815002 	add	r5, r1, r2
    89a4:	e4d40001 	ldrb	r0, [r4], #1
    89a8:	ebffff24 	bl	8640 <uart_put_byte>
    89ac:	e1540005 	cmp	r4, r5
    89b0:	1afffffb 	bne	89a4 <syscall_write+0x20>
    89b4:	e1a00006 	mov	r0, r6
    89b8:	e8bd8070 	pop	{r4, r5, r6, pc}
    89bc:	e3e00000 	mvn	r0, #0
    89c0:	e12fff1e 	bx	lr
    89c4:	e1a00002 	mov	r0, r2
    89c8:	e12fff1e 	bx	lr

000089cc <syscall_read>:
    89cc:	e3500000 	cmp	r0, #0
    89d0:	1a000021 	bne	8a5c <syscall_read+0x90>
    89d4:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
    89d8:	e1a06002 	mov	r6, r2
    89dc:	e1a05001 	mov	r5, r1
    89e0:	e3a07000 	mov	r7, #0
    89e4:	ea000018 	b	8a4c <syscall_read+0x80>
    89e8:	ebffff1d 	bl	8664 <uart_get_byte>
    89ec:	e1a04000 	mov	r4, r0
    89f0:	e350000a 	cmp	r0, #10
    89f4:	0a00000a 	beq	8a24 <syscall_read+0x58>
    89f8:	8a000004 	bhi	8a10 <syscall_read+0x44>
    89fc:	e3500004 	cmp	r0, #4
    8a00:	0a000017 	beq	8a64 <syscall_read+0x98>
    8a04:	e3500008 	cmp	r0, #8
    8a08:	0afffff6 	beq	89e8 <syscall_read+0x1c>
    8a0c:	ea00000a 	b	8a3c <syscall_read+0x70>
    8a10:	e350000d 	cmp	r0, #13
    8a14:	0a000002 	beq	8a24 <syscall_read+0x58>
    8a18:	e350007f 	cmp	r0, #127	; 0x7f
    8a1c:	0afffff1 	beq	89e8 <syscall_read+0x1c>
    8a20:	ea000005 	b	8a3c <syscall_read+0x70>
    8a24:	e1a00004 	mov	r0, r4
    8a28:	ebffff04 	bl	8640 <uart_put_byte>
    8a2c:	e5c54000 	strb	r4, [r5]
    8a30:	e3a00000 	mov	r0, #0
    8a34:	e5c50001 	strb	r0, [r5, #1]
    8a38:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    8a3c:	e1a00004 	mov	r0, r4
    8a40:	ebfffefe 	bl	8640 <uart_put_byte>
    8a44:	e5c54000 	strb	r4, [r5]
    8a48:	e5c57001 	strb	r7, [r5, #1]
    8a4c:	e3560000 	cmp	r6, #0
    8a50:	caffffe4 	bgt	89e8 <syscall_read+0x1c>
    8a54:	e3a00001 	mov	r0, #1
    8a58:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    8a5c:	e3e00000 	mvn	r0, #0
    8a60:	e12fff1e 	bx	lr
    8a64:	e3a00000 	mov	r0, #0
    8a68:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}

00008a6c <syscall_sample_adc_start>:
    8a6c:	e92d4010 	push	{r4, lr}
    8a70:	e1a04002 	mov	r4, r2
    8a74:	ebffff79 	bl	8860 <timer_start>
    8a78:	e30b3004 	movw	r3, #45060	; 0xb004
    8a7c:	e3403000 	movt	r3, #0
    8a80:	e5834000 	str	r4, [r3]
    8a84:	eb00002f 	bl	8b48 <enable_interrupts>
    8a88:	e3a00000 	mov	r0, #0
    8a8c:	e8bd8010 	pop	{r4, pc}

00008a90 <syscall_sample_adc_stop>:
    8a90:	e92d4008 	push	{r3, lr}
    8a94:	ebffff7e 	bl	8894 <timer_stop>
    8a98:	e3a00000 	mov	r0, #0
    8a9c:	e8bd8008 	pop	{r3, pc}

00008aa0 <syscall_sbrk>:
    8aa0:	e30b3000 	movw	r3, #45056	; 0xb000
    8aa4:	e3403000 	movt	r3, #0
    8aa8:	e5933000 	ldr	r3, [r3]
    8aac:	e3530000 	cmp	r3, #0
    8ab0:	030b3000 	movweq	r3, #45056	; 0xb000
    8ab4:	03403000 	movteq	r3, #0
    8ab8:	030c2000 	movweq	r2, #49152	; 0xc000
    8abc:	03402000 	movteq	r2, #0
    8ac0:	05832000 	streq	r2, [r3]
    8ac4:	e30b3000 	movw	r3, #45056	; 0xb000
    8ac8:	e3403000 	movt	r3, #0
    8acc:	e5933000 	ldr	r3, [r3]
    8ad0:	e0830000 	add	r0, r3, r0
    8ad4:	e30c2000 	movw	r2, #49152	; 0xc000
    8ad8:	e3402010 	movt	r2, #16
    8adc:	e1500002 	cmp	r0, r2
    8ae0:	930b2000 	movwls	r2, #45056	; 0xb000
    8ae4:	93402000 	movtls	r2, #0
    8ae8:	95820000 	strls	r0, [r2]
    8aec:	91a00003 	movls	r0, r3
    8af0:	83e00000 	mvnhi	r0, #0
    8af4:	e12fff1e 	bx	lr

00008af8 <syscall_close>:
    8af8:	e3e00000 	mvn	r0, #0
    8afc:	e12fff1e 	bx	lr

00008b00 <syscall_fstat>:
    8b00:	e3a00000 	mov	r0, #0
    8b04:	e12fff1e 	bx	lr

00008b08 <syscall_isatty>:
    8b08:	e3a00001 	mov	r0, #1
    8b0c:	e12fff1e 	bx	lr

00008b10 <syscall_lseek>:
    8b10:	e3a00000 	mov	r0, #0
    8b14:	e12fff1e 	bx	lr

00008b18 <delay_cycles>:
    8b18:	e2500001 	subs	r0, r0, #1
    8b1c:	1afffffd 	bne	8b18 <delay_cycles>
    8b20:	e1a0f00e 	mov	pc, lr

00008b24 <read_cpsr>:
    8b24:	e10f0000 	mrs	r0, CPSR
    8b28:	e1a0f00e 	mov	pc, lr

00008b2c <write_cpsr>:
    8b2c:	e129f000 	msr	CPSR_fc, r0
    8b30:	e1a0f00e 	mov	pc, lr

00008b34 <disable_interrupts>:
    8b34:	e10f0000 	mrs	r0, CPSR
    8b38:	e3a01d07 	mov	r1, #448	; 0x1c0
    8b3c:	e1800001 	orr	r0, r0, r1
    8b40:	e129f000 	msr	CPSR_fc, r0
    8b44:	e1a0f00e 	mov	pc, lr

00008b48 <enable_interrupts>:
    8b48:	e10f0000 	mrs	r0, CPSR
    8b4c:	e3a01d07 	mov	r1, #448	; 0x1c0
    8b50:	e1c00001 	bic	r0, r0, r1
    8b54:	e129f000 	msr	CPSR_fc, r0
    8b58:	e1a0f00e 	mov	pc, lr

00008b5c <interrupt_vector_table>:
    8b5c:	e59ff018 	ldr	pc, [pc, #24]	; 8b7c <_reset_asm_handler>
    8b60:	e59ff018 	ldr	pc, [pc, #24]	; 8b80 <_undefined_instruction_asm_handler>
    8b64:	e59ff018 	ldr	pc, [pc, #24]	; 8b84 <_swi_asm_handler>
    8b68:	e59ff018 	ldr	pc, [pc, #24]	; 8b88 <_prefetch_abort_asm_handler>
    8b6c:	e59ff018 	ldr	pc, [pc, #24]	; 8b8c <_data_abort_asm_handler>
    8b70:	e59ff004 	ldr	pc, [pc, #4]	; 8b7c <_reset_asm_handler>
    8b74:	e59ff014 	ldr	pc, [pc, #20]	; 8b90 <_irq_asm_handler>
    8b78:	e59ff014 	ldr	pc, [pc, #20]	; 8b94 <_fiq_asm_handler>

00008b7c <_reset_asm_handler>:
    8b7c:	00008c18 	andeq	r8, r0, r8, lsl ip

00008b80 <_undefined_instruction_asm_handler>:
    8b80:	00008c1c 	andeq	r8, r0, ip, lsl ip

00008b84 <_swi_asm_handler>:
    8b84:	00008bbc 			; <UNDEFINED> instruction: 0x00008bbc

00008b88 <_prefetch_abort_asm_handler>:
    8b88:	00008c20 	andeq	r8, r0, r0, lsr #24

00008b8c <_data_abort_asm_handler>:
    8b8c:	00008c24 	andeq	r8, r0, r4, lsr #24

00008b90 <_irq_asm_handler>:
    8b90:	00008c00 	andeq	r8, r0, r0, lsl #24

00008b94 <_fiq_asm_handler>:
    8b94:	00008c28 	andeq	r8, r0, r8, lsr #24

00008b98 <install_interrupt_table>:
    8b98:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8b9c:	e59f00a4 	ldr	r0, [pc, #164]	; 8c48 <enter_user_mode+0x1c>
    8ba0:	e3a01000 	mov	r1, #0
    8ba4:	e8b00ff0 	ldm	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
    8ba8:	e8a10ff0 	stmia	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
    8bac:	e59f0098 	ldr	r0, [pc, #152]	; 8c4c <enter_user_mode+0x20>
    8bb0:	e8b007f0 	ldm	r0!, {r4, r5, r6, r7, r8, r9, sl}
    8bb4:	e8a107f0 	stmia	r1!, {r4, r5, r6, r7, r8, r9, sl}
    8bb8:	e8bd9fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

00008bbc <swi_asm_handler>:
    8bbc:	e24dd004 	sub	sp, sp, #4
    8bc0:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8bc4:	e14f2000 	mrs	r2, SPSR
    8bc8:	e58d2038 	str	r2, [sp, #56]	; 0x38
    8bcc:	e1a0100d 	mov	r1, sp
    8bd0:	e51e0004 	ldr	r0, [lr, #-4]
    8bd4:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    8bd8:	e10f3000 	mrs	r3, CPSR
    8bdc:	e3c33080 	bic	r3, r3, #128	; 0x80
    8be0:	e129f003 	msr	CPSR_fc, r3
    8be4:	ebfffd9a 	bl	8254 <swi_c_handler>
    8be8:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    8bec:	e169f002 	msr	SPSR_fc, r2
    8bf0:	e28dd004 	add	sp, sp, #4
    8bf4:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8bf8:	e28dd004 	add	sp, sp, #4
    8bfc:	e1b0f00e 	movs	pc, lr

00008c00 <irq_asm_handler>:
    8c00:	e59fd048 	ldr	sp, [pc, #72]	; 8c50 <enter_user_mode+0x24>
    8c04:	e24ee004 	sub	lr, lr, #4
    8c08:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8c0c:	ebfffd87 	bl	8230 <irq_c_handler>
    8c10:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8c14:	e1b0f00e 	movs	pc, lr

00008c18 <reset_asm_handler>:
    8c18:	eafffcf8 	b	8000 <__start>

00008c1c <undefined_instruction_asm_handler>:
    8c1c:	e1200070 	bkpt	0x0000

00008c20 <prefetch_abort_asm_handler>:
    8c20:	e1200070 	bkpt	0x0000

00008c24 <data_abort_asm_handler>:
    8c24:	e1200070 	bkpt	0x0000

00008c28 <fiq_asm_handler>:
    8c28:	e1200070 	bkpt	0x0000

00008c2c <enter_user_mode>:
    8c2c:	e92d1fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8c30:	e10f0000 	mrs	r0, CPSR
    8c34:	e3c000ff 	bic	r0, r0, #255	; 0xff
    8c38:	e3a00050 	mov	r0, #80	; 0x50
    8c3c:	e129f000 	msr	CPSR_fc, r0
    8c40:	e59fd00c 	ldr	sp, [pc, #12]	; 8c54 <enter_user_mode+0x28>
    8c44:	e59ff00c 	ldr	pc, [pc, #12]	; 8c58 <enter_user_mode+0x2c>
    8c48:	00008b5c 	andeq	r8, r0, ip, asr fp
    8c4c:	00008b7c 	andeq	r8, r0, ip, ror fp
    8c50:	0012d000 	andseq	sp, r2, r0
    8c54:	0012c000 	andseq	ip, r2, r0
    8c58:	00300000 	eorseq	r0, r0, r0

00008c5c <__aeabi_idiv>:
    8c5c:	e3510000 	cmp	r1, #0
    8c60:	0a000043 	beq	8d74 <.divsi3_skip_div0_test+0x110>

00008c64 <.divsi3_skip_div0_test>:
    8c64:	e020c001 	eor	ip, r0, r1
    8c68:	42611000 	rsbmi	r1, r1, #0
    8c6c:	e2512001 	subs	r2, r1, #1
    8c70:	0a000027 	beq	8d14 <.divsi3_skip_div0_test+0xb0>
    8c74:	e1b03000 	movs	r3, r0
    8c78:	42603000 	rsbmi	r3, r0, #0
    8c7c:	e1530001 	cmp	r3, r1
    8c80:	9a000026 	bls	8d20 <.divsi3_skip_div0_test+0xbc>
    8c84:	e1110002 	tst	r1, r2
    8c88:	0a000028 	beq	8d30 <.divsi3_skip_div0_test+0xcc>
    8c8c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    8c90:	01a01181 	lsleq	r1, r1, #3
    8c94:	03a02008 	moveq	r2, #8
    8c98:	13a02001 	movne	r2, #1
    8c9c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    8ca0:	31510003 	cmpcc	r1, r3
    8ca4:	31a01201 	lslcc	r1, r1, #4
    8ca8:	31a02202 	lslcc	r2, r2, #4
    8cac:	3afffffa 	bcc	8c9c <.divsi3_skip_div0_test+0x38>
    8cb0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    8cb4:	31510003 	cmpcc	r1, r3
    8cb8:	31a01081 	lslcc	r1, r1, #1
    8cbc:	31a02082 	lslcc	r2, r2, #1
    8cc0:	3afffffa 	bcc	8cb0 <.divsi3_skip_div0_test+0x4c>
    8cc4:	e3a00000 	mov	r0, #0
    8cc8:	e1530001 	cmp	r3, r1
    8ccc:	20433001 	subcs	r3, r3, r1
    8cd0:	21800002 	orrcs	r0, r0, r2
    8cd4:	e15300a1 	cmp	r3, r1, lsr #1
    8cd8:	204330a1 	subcs	r3, r3, r1, lsr #1
    8cdc:	218000a2 	orrcs	r0, r0, r2, lsr #1
    8ce0:	e1530121 	cmp	r3, r1, lsr #2
    8ce4:	20433121 	subcs	r3, r3, r1, lsr #2
    8ce8:	21800122 	orrcs	r0, r0, r2, lsr #2
    8cec:	e15301a1 	cmp	r3, r1, lsr #3
    8cf0:	204331a1 	subcs	r3, r3, r1, lsr #3
    8cf4:	218001a2 	orrcs	r0, r0, r2, lsr #3
    8cf8:	e3530000 	cmp	r3, #0
    8cfc:	11b02222 	lsrsne	r2, r2, #4
    8d00:	11a01221 	lsrne	r1, r1, #4
    8d04:	1affffef 	bne	8cc8 <.divsi3_skip_div0_test+0x64>
    8d08:	e35c0000 	cmp	ip, #0
    8d0c:	42600000 	rsbmi	r0, r0, #0
    8d10:	e12fff1e 	bx	lr
    8d14:	e13c0000 	teq	ip, r0
    8d18:	42600000 	rsbmi	r0, r0, #0
    8d1c:	e12fff1e 	bx	lr
    8d20:	33a00000 	movcc	r0, #0
    8d24:	01a00fcc 	asreq	r0, ip, #31
    8d28:	03800001 	orreq	r0, r0, #1
    8d2c:	e12fff1e 	bx	lr
    8d30:	e3510801 	cmp	r1, #65536	; 0x10000
    8d34:	21a01821 	lsrcs	r1, r1, #16
    8d38:	23a02010 	movcs	r2, #16
    8d3c:	33a02000 	movcc	r2, #0
    8d40:	e3510c01 	cmp	r1, #256	; 0x100
    8d44:	21a01421 	lsrcs	r1, r1, #8
    8d48:	22822008 	addcs	r2, r2, #8
    8d4c:	e3510010 	cmp	r1, #16
    8d50:	21a01221 	lsrcs	r1, r1, #4
    8d54:	22822004 	addcs	r2, r2, #4
    8d58:	e3510004 	cmp	r1, #4
    8d5c:	82822003 	addhi	r2, r2, #3
    8d60:	908220a1 	addls	r2, r2, r1, lsr #1
    8d64:	e35c0000 	cmp	ip, #0
    8d68:	e1a00233 	lsr	r0, r3, r2
    8d6c:	42600000 	rsbmi	r0, r0, #0
    8d70:	e12fff1e 	bx	lr
    8d74:	e3500000 	cmp	r0, #0
    8d78:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    8d7c:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    8d80:	ea000007 	b	8da4 <__aeabi_idiv0>

00008d84 <__aeabi_idivmod>:
    8d84:	e3510000 	cmp	r1, #0
    8d88:	0afffff9 	beq	8d74 <.divsi3_skip_div0_test+0x110>
    8d8c:	e92d4003 	push	{r0, r1, lr}
    8d90:	ebffffb3 	bl	8c64 <.divsi3_skip_div0_test>
    8d94:	e8bd4006 	pop	{r1, r2, lr}
    8d98:	e0030092 	mul	r3, r2, r0
    8d9c:	e0411003 	sub	r1, r1, r3
    8da0:	e12fff1e 	bx	lr

00008da4 <__aeabi_idiv0>:
    8da4:	e12fff1e 	bx	lr

00008da8 <__aeabi_uldivmod>:
    8da8:	e3530000 	cmp	r3, #0
    8dac:	03520000 	cmpeq	r2, #0
    8db0:	1a000004 	bne	8dc8 <__aeabi_uldivmod+0x20>
    8db4:	e3510000 	cmp	r1, #0
    8db8:	03500000 	cmpeq	r0, #0
    8dbc:	13e01000 	mvnne	r1, #0
    8dc0:	13e00000 	mvnne	r0, #0
    8dc4:	eafffff6 	b	8da4 <__aeabi_idiv0>
    8dc8:	e24dd008 	sub	sp, sp, #8
    8dcc:	e92d6000 	push	{sp, lr}
    8dd0:	eb000014 	bl	8e28 <__gnu_uldivmod_helper>
    8dd4:	e59de004 	ldr	lr, [sp, #4]
    8dd8:	e28dd008 	add	sp, sp, #8
    8ddc:	e8bd000c 	pop	{r2, r3}
    8de0:	e12fff1e 	bx	lr

00008de4 <__gnu_ldivmod_helper>:
    8de4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8de8:	e59d6020 	ldr	r6, [sp, #32]
    8dec:	e1a07002 	mov	r7, r2
    8df0:	e1a0a003 	mov	sl, r3
    8df4:	e1a04000 	mov	r4, r0
    8df8:	e1a05001 	mov	r5, r1
    8dfc:	eb000019 	bl	8e68 <__divdi3>
    8e00:	e1a03000 	mov	r3, r0
    8e04:	e0020197 	mul	r2, r7, r1
    8e08:	e0898097 	umull	r8, r9, r7, r0
    8e0c:	e023239a 	mla	r3, sl, r3, r2
    8e10:	e0544008 	subs	r4, r4, r8
    8e14:	e0839009 	add	r9, r3, r9
    8e18:	e0c55009 	sbc	r5, r5, r9
    8e1c:	e8860030 	stm	r6, {r4, r5}
    8e20:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8e24:	e12fff1e 	bx	lr

00008e28 <__gnu_uldivmod_helper>:
    8e28:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8e2c:	e59d5018 	ldr	r5, [sp, #24]
    8e30:	e1a04002 	mov	r4, r2
    8e34:	e1a08003 	mov	r8, r3
    8e38:	e1a06000 	mov	r6, r0
    8e3c:	e1a07001 	mov	r7, r1
    8e40:	eb000066 	bl	8fe0 <__udivdi3>
    8e44:	e0080890 	mul	r8, r0, r8
    8e48:	e0832490 	umull	r2, r3, r0, r4
    8e4c:	e0248491 	mla	r4, r1, r4, r8
    8e50:	e0566002 	subs	r6, r6, r2
    8e54:	e0843003 	add	r3, r4, r3
    8e58:	e0c77003 	sbc	r7, r7, r3
    8e5c:	e88500c0 	stm	r5, {r6, r7}
    8e60:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8e64:	e12fff1e 	bx	lr

00008e68 <__divdi3>:
    8e68:	e3510000 	cmp	r1, #0
    8e6c:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8e70:	a1a04000 	movge	r4, r0
    8e74:	a1a05001 	movge	r5, r1
    8e78:	a3a0a000 	movge	sl, #0
    8e7c:	ba000053 	blt	8fd0 <__divdi3+0x168>
    8e80:	e3530000 	cmp	r3, #0
    8e84:	a1a08002 	movge	r8, r2
    8e88:	a1a09003 	movge	r9, r3
    8e8c:	ba00004b 	blt	8fc0 <__divdi3+0x158>
    8e90:	e1550009 	cmp	r5, r9
    8e94:	01540008 	cmpeq	r4, r8
    8e98:	33a02000 	movcc	r2, #0
    8e9c:	33a03000 	movcc	r3, #0
    8ea0:	3a00003b 	bcc	8f94 <__divdi3+0x12c>
    8ea4:	e1a01009 	mov	r1, r9
    8ea8:	e1a00008 	mov	r0, r8
    8eac:	eb000093 	bl	9100 <__clzdi2>
    8eb0:	e1a01005 	mov	r1, r5
    8eb4:	e1a0b000 	mov	fp, r0
    8eb8:	e1a00004 	mov	r0, r4
    8ebc:	eb00008f 	bl	9100 <__clzdi2>
    8ec0:	e060000b 	rsb	r0, r0, fp
    8ec4:	e240e020 	sub	lr, r0, #32
    8ec8:	e1a07019 	lsl	r7, r9, r0
    8ecc:	e1877e18 	orr	r7, r7, r8, lsl lr
    8ed0:	e260c020 	rsb	ip, r0, #32
    8ed4:	e1877c38 	orr	r7, r7, r8, lsr ip
    8ed8:	e1550007 	cmp	r5, r7
    8edc:	e1a06018 	lsl	r6, r8, r0
    8ee0:	01540006 	cmpeq	r4, r6
    8ee4:	e1a01000 	mov	r1, r0
    8ee8:	33a02000 	movcc	r2, #0
    8eec:	33a03000 	movcc	r3, #0
    8ef0:	3a000005 	bcc	8f0c <__divdi3+0xa4>
    8ef4:	e3a08001 	mov	r8, #1
    8ef8:	e0544006 	subs	r4, r4, r6
    8efc:	e1a03e18 	lsl	r3, r8, lr
    8f00:	e1833c38 	orr	r3, r3, r8, lsr ip
    8f04:	e0c55007 	sbc	r5, r5, r7
    8f08:	e1a02018 	lsl	r2, r8, r0
    8f0c:	e3500000 	cmp	r0, #0
    8f10:	0a00001f 	beq	8f94 <__divdi3+0x12c>
    8f14:	e1b070a7 	lsrs	r7, r7, #1
    8f18:	e1a06066 	rrx	r6, r6
    8f1c:	ea000007 	b	8f40 <__divdi3+0xd8>
    8f20:	e0544006 	subs	r4, r4, r6
    8f24:	e0c55007 	sbc	r5, r5, r7
    8f28:	e0944004 	adds	r4, r4, r4
    8f2c:	e0a55005 	adc	r5, r5, r5
    8f30:	e2944001 	adds	r4, r4, #1
    8f34:	e2a55000 	adc	r5, r5, #0
    8f38:	e2500001 	subs	r0, r0, #1
    8f3c:	0a000006 	beq	8f5c <__divdi3+0xf4>
    8f40:	e1570005 	cmp	r7, r5
    8f44:	01560004 	cmpeq	r6, r4
    8f48:	9afffff4 	bls	8f20 <__divdi3+0xb8>
    8f4c:	e0944004 	adds	r4, r4, r4
    8f50:	e0a55005 	adc	r5, r5, r5
    8f54:	e2500001 	subs	r0, r0, #1
    8f58:	1afffff8 	bne	8f40 <__divdi3+0xd8>
    8f5c:	e261c020 	rsb	ip, r1, #32
    8f60:	e1a00134 	lsr	r0, r4, r1
    8f64:	e0922004 	adds	r2, r2, r4
    8f68:	e241e020 	sub	lr, r1, #32
    8f6c:	e1800c15 	orr	r0, r0, r5, lsl ip
    8f70:	e1a04135 	lsr	r4, r5, r1
    8f74:	e1800e35 	orr	r0, r0, r5, lsr lr
    8f78:	e1a07114 	lsl	r7, r4, r1
    8f7c:	e1877e10 	orr	r7, r7, r0, lsl lr
    8f80:	e1a06110 	lsl	r6, r0, r1
    8f84:	e0a33005 	adc	r3, r3, r5
    8f88:	e1877c30 	orr	r7, r7, r0, lsr ip
    8f8c:	e0522006 	subs	r2, r2, r6
    8f90:	e0c33007 	sbc	r3, r3, r7
    8f94:	e29a0000 	adds	r0, sl, #0
    8f98:	13a00001 	movne	r0, #1
    8f9c:	e3a01000 	mov	r1, #0
    8fa0:	e2704000 	rsbs	r4, r0, #0
    8fa4:	e2e15000 	rsc	r5, r1, #0
    8fa8:	e0222004 	eor	r2, r2, r4
    8fac:	e0233005 	eor	r3, r3, r5
    8fb0:	e0900002 	adds	r0, r0, r2
    8fb4:	e0a11003 	adc	r1, r1, r3
    8fb8:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8fbc:	e12fff1e 	bx	lr
    8fc0:	e2728000 	rsbs	r8, r2, #0
    8fc4:	e1e0a00a 	mvn	sl, sl
    8fc8:	e2e39000 	rsc	r9, r3, #0
    8fcc:	eaffffaf 	b	8e90 <__divdi3+0x28>
    8fd0:	e2704000 	rsbs	r4, r0, #0
    8fd4:	e2e15000 	rsc	r5, r1, #0
    8fd8:	e3e0a000 	mvn	sl, #0
    8fdc:	eaffffa7 	b	8e80 <__divdi3+0x18>

00008fe0 <__udivdi3>:
    8fe0:	e1510003 	cmp	r1, r3
    8fe4:	01500002 	cmpeq	r0, r2
    8fe8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8fec:	e1a04000 	mov	r4, r0
    8ff0:	e1a05001 	mov	r5, r1
    8ff4:	e1a08002 	mov	r8, r2
    8ff8:	e1a09003 	mov	r9, r3
    8ffc:	33a00000 	movcc	r0, #0
    9000:	33a01000 	movcc	r1, #0
    9004:	3a00003b 	bcc	90f8 <__udivdi3+0x118>
    9008:	e1a01003 	mov	r1, r3
    900c:	e1a00002 	mov	r0, r2
    9010:	eb00003a 	bl	9100 <__clzdi2>
    9014:	e1a01005 	mov	r1, r5
    9018:	e1a0a000 	mov	sl, r0
    901c:	e1a00004 	mov	r0, r4
    9020:	eb000036 	bl	9100 <__clzdi2>
    9024:	e060300a 	rsb	r3, r0, sl
    9028:	e243e020 	sub	lr, r3, #32
    902c:	e1a07319 	lsl	r7, r9, r3
    9030:	e1877e18 	orr	r7, r7, r8, lsl lr
    9034:	e263c020 	rsb	ip, r3, #32
    9038:	e1877c38 	orr	r7, r7, r8, lsr ip
    903c:	e1550007 	cmp	r5, r7
    9040:	e1a06318 	lsl	r6, r8, r3
    9044:	01540006 	cmpeq	r4, r6
    9048:	e1a02003 	mov	r2, r3
    904c:	33a00000 	movcc	r0, #0
    9050:	33a01000 	movcc	r1, #0
    9054:	3a000005 	bcc	9070 <__udivdi3+0x90>
    9058:	e3a08001 	mov	r8, #1
    905c:	e0544006 	subs	r4, r4, r6
    9060:	e1a01e18 	lsl	r1, r8, lr
    9064:	e1811c38 	orr	r1, r1, r8, lsr ip
    9068:	e0c55007 	sbc	r5, r5, r7
    906c:	e1a00318 	lsl	r0, r8, r3
    9070:	e3530000 	cmp	r3, #0
    9074:	0a00001f 	beq	90f8 <__udivdi3+0x118>
    9078:	e1b070a7 	lsrs	r7, r7, #1
    907c:	e1a06066 	rrx	r6, r6
    9080:	ea000007 	b	90a4 <__udivdi3+0xc4>
    9084:	e0544006 	subs	r4, r4, r6
    9088:	e0c55007 	sbc	r5, r5, r7
    908c:	e0944004 	adds	r4, r4, r4
    9090:	e0a55005 	adc	r5, r5, r5
    9094:	e2944001 	adds	r4, r4, #1
    9098:	e2a55000 	adc	r5, r5, #0
    909c:	e2533001 	subs	r3, r3, #1
    90a0:	0a000006 	beq	90c0 <__udivdi3+0xe0>
    90a4:	e1570005 	cmp	r7, r5
    90a8:	01560004 	cmpeq	r6, r4
    90ac:	9afffff4 	bls	9084 <__udivdi3+0xa4>
    90b0:	e0944004 	adds	r4, r4, r4
    90b4:	e0a55005 	adc	r5, r5, r5
    90b8:	e2533001 	subs	r3, r3, #1
    90bc:	1afffff8 	bne	90a4 <__udivdi3+0xc4>
    90c0:	e0948000 	adds	r8, r4, r0
    90c4:	e0a59001 	adc	r9, r5, r1
    90c8:	e1a03234 	lsr	r3, r4, r2
    90cc:	e2621020 	rsb	r1, r2, #32
    90d0:	e2420020 	sub	r0, r2, #32
    90d4:	e1833115 	orr	r3, r3, r5, lsl r1
    90d8:	e1a0c235 	lsr	ip, r5, r2
    90dc:	e1833035 	orr	r3, r3, r5, lsr r0
    90e0:	e1a0721c 	lsl	r7, ip, r2
    90e4:	e1877013 	orr	r7, r7, r3, lsl r0
    90e8:	e1a06213 	lsl	r6, r3, r2
    90ec:	e1877133 	orr	r7, r7, r3, lsr r1
    90f0:	e0580006 	subs	r0, r8, r6
    90f4:	e0c91007 	sbc	r1, r9, r7
    90f8:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    90fc:	e12fff1e 	bx	lr

00009100 <__clzdi2>:
    9100:	e92d4010 	push	{r4, lr}
    9104:	e3510000 	cmp	r1, #0
    9108:	1a000002 	bne	9118 <__clzdi2+0x18>
    910c:	eb000005 	bl	9128 <__clzsi2>
    9110:	e2800020 	add	r0, r0, #32
    9114:	ea000001 	b	9120 <__clzdi2+0x20>
    9118:	e1a00001 	mov	r0, r1
    911c:	eb000001 	bl	9128 <__clzsi2>
    9120:	e8bd4010 	pop	{r4, lr}
    9124:	e12fff1e 	bx	lr

00009128 <__clzsi2>:
    9128:	e3a0101c 	mov	r1, #28
    912c:	e3500801 	cmp	r0, #65536	; 0x10000
    9130:	21a00820 	lsrcs	r0, r0, #16
    9134:	22411010 	subcs	r1, r1, #16
    9138:	e3500c01 	cmp	r0, #256	; 0x100
    913c:	21a00420 	lsrcs	r0, r0, #8
    9140:	22411008 	subcs	r1, r1, #8
    9144:	e3500010 	cmp	r0, #16
    9148:	21a00220 	lsrcs	r0, r0, #4
    914c:	22411004 	subcs	r1, r1, #4
    9150:	e28f2008 	add	r2, pc, #8
    9154:	e7d20000 	ldrb	r0, [r2, r0]
    9158:	e0800001 	add	r0, r0, r1
    915c:	e12fff1e 	bx	lr
    9160:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    9164:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

0000a000 <__rodata_start>:
    a000:	33323130 	teqcc	r2, #48, 2
    a004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    a008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    a00c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

0000a014 <.rodata.str1.4>:
    a014:	00000030 	andeq	r0, r0, r0, lsr r0
    a018:	00007830 	andeq	r7, r0, r0, lsr r8
    a01c:	00006425 	andeq	r6, r0, r5, lsr #8

Disassembly of section .ARM.exidx:

0000a020 <.ARM.exidx>:
    a020:	7fffee48 	svcvc	0x00ffee48
    a024:	00000001 	andeq	r0, r0, r1

Disassembly of section .bss:

0000b000 <__bss_start>:
    b000:	00000000 	andeq	r0, r0, r0

0000b004 <sample_fn>:
    b004:	00000000 	andeq	r0, r0, r0

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00000175 	andeq	r0, r0, r5, ror r1
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000087 	andeq	r0, r0, r7, lsl #1
      10:	00007401 	andeq	r7, r0, r1, lsl #8
      14:	00002800 	andeq	r2, r0, r0, lsl #16
      18:	00805400 	addeq	r5, r0, r0, lsl #8
      1c:	00006000 	andeq	r6, r0, r0
      20:	00000000 	andeq	r0, r0, r0
      24:	08010200 	stmdaeq	r1, {r9}
      28:	00000117 	andeq	r0, r0, r7, lsl r1
      2c:	55050202 	strpl	r0, [r5, #-514]	; 0x202
      30:	03000001 	movweq	r0, #1
      34:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
      38:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
      3c:	00000005 	andeq	r0, r0, r5
      40:	01060400 	tsteq	r6, r0, lsl #8
      44:	16030000 	strne	r0, [r3], -r0
      48:	0000004c 	andeq	r0, r0, ip, asr #32
      4c:	0e080102 	adfeqe	f0, f0, f2
      50:	02000001 	andeq	r0, r0, #1
      54:	01280702 	teqeq	r8, r2, lsl #14
      58:	04020000 	streq	r0, [r2], #-0
      5c:	00005e07 	andeq	r5, r0, r7, lsl #28
      60:	07080200 	streq	r0, [r8, -r0, lsl #4]
      64:	00000054 	andeq	r0, r0, r4, asr r0
      68:	00004b05 	andeq	r4, r0, r5, lsl #22
      6c:	54170100 	ldrpl	r0, [r7], #-256	; 0x100
      70:	20000080 	andcs	r0, r0, r0, lsl #1
      74:	01000000 	mrseq	r0, (UNDEF: 0)
      78:	0000ac9c 	muleq	r0, ip, ip
      7c:	80640600 	rsbhi	r0, r4, r0, lsl #12
      80:	01440000 	mrseq	r0, (UNDEF: 68)
      84:	00960000 	addseq	r0, r6, r0
      88:	01070000 	mrseq	r0, (UNDEF: 7)
      8c:	07310151 			; <UNDEFINED> instruction: 0x07310151
      90:	08025001 	stmdaeq	r2, {r0, ip, lr}
      94:	7008002f 	andvc	r0, r8, pc, lsr #32
      98:	44000080 	strmi	r0, [r0], #-128	; 0x80
      9c:	07000001 	streq	r0, [r0, -r1]
      a0:	31015101 	tstcc	r1, r1, lsl #2
      a4:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
      a8:	00002308 	andeq	r2, r0, r8, lsl #6
      ac:	00013b05 	andeq	r3, r1, r5, lsl #22
      b0:	741d0100 	ldrvc	r0, [sp], #-256	; 0x100
      b4:	10000080 	andne	r0, r0, r0, lsl #1
      b8:	01000000 	mrseq	r0, (UNDEF: 0)
      bc:	0000d29c 	muleq	r0, ip, r2
      c0:	80800800 	addhi	r0, r0, r0, lsl #16
      c4:	015a0000 	cmpeq	sl, r0
      c8:	01070000 	mrseq	r0, (UNDEF: 7)
      cc:	2f080250 	svccs	0x00080250
      d0:	0e050000 	cdpeq	0, 0, cr0, cr5, cr0, {0}
      d4:	01000000 	mrseq	r0, (UNDEF: 0)
      d8:	00808422 	addeq	r8, r0, r2, lsr #8
      dc:	00001000 	andeq	r1, r0, r0
      e0:	f89c0100 			; <UNDEFINED> instruction: 0xf89c0100
      e4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
      e8:	00008090 	muleq	r0, r0, r0
      ec:	0000016b 	andeq	r0, r0, fp, ror #2
      f0:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
      f4:	00002f08 	andeq	r2, r0, r8, lsl #30
      f8:	00001c05 	andeq	r1, r0, r5, lsl #24
      fc:	94270100 	strtls	r0, [r7], #-256	; 0x100
     100:	10000080 	andne	r0, r0, r0, lsl #1
     104:	01000000 	mrseq	r0, (UNDEF: 0)
     108:	00011e9c 	muleq	r1, ip, lr
     10c:	80a00800 	adchi	r0, r0, r0, lsl #16
     110:	015a0000 	cmpeq	sl, r0
     114:	01070000 	mrseq	r0, (UNDEF: 7)
     118:	23080250 	movwcs	r0, #33360	; 0x8250
     11c:	1c050000 	stcne	0, cr0, [r5], {-0}
     120:	01000001 	tsteq	r0, r1
     124:	0080a42c 	addeq	sl, r0, ip, lsr #8
     128:	00001000 	andeq	r1, r0, r0
     12c:	449c0100 	ldrmi	r0, [ip], #256	; 0x100
     130:	08000001 	stmdaeq	r0, {r0}
     134:	000080b0 	strheq	r8, [r0], -r0
     138:	0000016b 	andeq	r0, r0, fp, ror #2
     13c:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
     140:	00002308 	andeq	r2, r0, r8, lsl #6
     144:	00014909 	andeq	r4, r1, r9, lsl #18
     148:	5a370200 	bpl	dc0950 <__user_program+0xac0950>
     14c:	0a000001 	beq	158 <__start-0x7ea8>
     150:	00000041 	andeq	r0, r0, r1, asr #32
     154:	0000410a 	andeq	r4, r0, sl, lsl #2
     158:	42090000 	andmi	r0, r9, #0
     15c:	02000000 	andeq	r0, r0, #0
     160:	00016b3d 	andeq	r6, r1, sp, lsr fp
     164:	00410a00 	subeq	r0, r1, r0, lsl #20
     168:	0b000000 	bleq	170 <__start-0x7e90>
     16c:	0000006b 	andeq	r0, r0, fp, rrx
     170:	410a4302 	tstmi	sl, r2, lsl #6
     174:	00000000 	andeq	r0, r0, r0
     178:	0001b100 	andeq	fp, r1, r0, lsl #2
     17c:	a0000400 	andge	r0, r0, r0, lsl #8
     180:	04000000 	streq	r0, [r0], #-0
     184:	00008701 	andeq	r8, r0, r1, lsl #14
     188:	01900100 	orrseq	r0, r0, r0, lsl #2
     18c:	00280000 	eoreq	r0, r8, r0
     190:	80b40000 	adcshi	r0, r4, r0
     194:	01600000 	cmneq	r0, r0
     198:	00730000 	rsbseq	r0, r3, r0
     19c:	01020000 	mrseq	r0, (UNDEF: 2)
     1a0:	00010e08 	andeq	r0, r1, r8, lsl #28
     1a4:	08010200 	stmdaeq	r1, {r9}
     1a8:	00000117 	andeq	r0, r0, r7, lsl r1
     1ac:	55050202 	strpl	r0, [r5, #-514]	; 0x202
     1b0:	03000001 	movweq	r0, #1
     1b4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     1b8:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
     1bc:	00000005 	andeq	r0, r0, r5
     1c0:	01060400 	tsteq	r6, r0, lsl #8
     1c4:	16020000 	strne	r0, [r2], -r0
     1c8:	00000025 	andeq	r0, r0, r5, lsr #32
     1cc:	28070202 	stmdacs	r7, {r1, r9}
     1d0:	04000001 	streq	r0, [r0], #-1
     1d4:	0000016d 	andeq	r0, r0, sp, ror #2
     1d8:	00651a02 	rsbeq	r1, r5, r2, lsl #20
     1dc:	04020000 	streq	r0, [r2], #-0
     1e0:	00005e07 	andeq	r5, r0, r7, lsl #28
     1e4:	07080200 	streq	r0, [r8, -r0, lsl #4]
     1e8:	00000054 	andeq	r0, r0, r4, asr r0
     1ec:	00014905 	andeq	r4, r1, r5, lsl #18
     1f0:	b4550100 	ldrblt	r0, [r5], #-256	; 0x100
     1f4:	54000080 	strpl	r0, [r0], #-128	; 0x80
     1f8:	01000000 	mrseq	r0, (UNDEF: 0)
     1fc:	0000d29c 	muleq	r0, ip, r2
     200:	69700600 	ldmdbvs	r0!, {r9, sl}^
     204:	5501006e 	strpl	r0, [r1, #-110]	; 0x6e
     208:	00000048 	andeq	r0, r0, r8, asr #32
     20c:	00000000 	andeq	r0, r0, r0
     210:	6e756607 	cdpvs	6, 7, cr6, cr5, cr7, {0}
     214:	48550100 	ldmdami	r5, {r8}^
     218:	01000000 	mrseq	r0, (UNDEF: 0)
     21c:	65720851 	ldrbvs	r0, [r2, #-2129]!	; 0x851
     220:	5a010067 	bpl	403c4 <__bss_end+0x343c4>
     224:	0000005a 	andeq	r0, r0, sl, asr r0
     228:	00000021 	andeq	r0, r0, r1, lsr #32
     22c:	00044809 	andeq	r4, r4, r9, lsl #16
     230:	5a5c0100 	bpl	1700638 <__user_program+0x1400638>
     234:	5a000000 	bpl	23c <__start-0x7dc4>
     238:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     23c:	00000189 	andeq	r0, r0, r9, lsl #3
     240:	005a5e01 	subseq	r5, sl, r1, lsl #28
     244:	00780000 	rsbseq	r0, r8, r0
     248:	05000000 	streq	r0, [r0, #-0]
     24c:	00000042 	andeq	r0, r0, r2, asr #32
     250:	81086501 	tsthi	r8, r1, lsl #10
     254:	00440000 	subeq	r0, r4, r0
     258:	9c010000 	stcls	0, cr0, [r1], {-0}
     25c:	000000f7 	strdeq	r0, [r0], -r7
     260:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
     264:	48650100 	stmdami	r5!, {r8}^
     268:	8b000000 	blhi	270 <__start-0x7d90>
     26c:	00000000 	andeq	r0, r0, r0
     270:	00006b05 	andeq	r6, r0, r5, lsl #22
     274:	4c710100 	ldfmie	f0, [r1], #-0
     278:	44000081 	strmi	r0, [r0], #-129	; 0x81
     27c:	01000000 	mrseq	r0, (UNDEF: 0)
     280:	00011c9c 	muleq	r1, ip, ip
     284:	69700600 	ldmdbvs	r0!, {r9, sl}^
     288:	7101006e 	tstvc	r1, lr, rrx
     28c:	00000048 	andeq	r0, r0, r8, asr #32
     290:	000000c5 	andeq	r0, r0, r5, asr #1
     294:	015f0500 	cmpeq	pc, r0, lsl #10
     298:	7d010000 	stcvc	0, cr0, [r1, #-0]
     29c:	00008190 	muleq	r0, r0, r1
     2a0:	00000084 	andeq	r0, r0, r4, lsl #1
     2a4:	01889c01 	orreq	r9, r8, r1, lsl #24
     2a8:	70060000 	andvc	r0, r6, r0
     2ac:	01006e69 	tsteq	r0, r9, ror #28
     2b0:	0000487d 	andeq	r4, r0, sp, ror r8
     2b4:	0000ff00 	andeq	pc, r0, r0, lsl #30
     2b8:	01830a00 	orreq	r0, r3, r0, lsl #20
     2bc:	7d010000 	stcvc	0, cr0, [r1, #-0]
     2c0:	00000048 	andeq	r0, r0, r8, asr #32
     2c4:	00000120 	andeq	r0, r0, r0, lsr #2
     2c8:	0081b80b 	addeq	fp, r1, fp, lsl #16
     2cc:	0001a700 	andeq	sl, r1, r0, lsl #14
     2d0:	00016300 	andeq	r6, r1, r0, lsl #6
     2d4:	50010c00 	andpl	r0, r1, r0, lsl #24
     2d8:	00960802 	addseq	r0, r6, r2, lsl #16
     2dc:	0081e00b 	addeq	lr, r1, fp
     2e0:	0001a700 	andeq	sl, r1, r0, lsl #14
     2e4:	00017700 	andeq	r7, r1, r0, lsl #14
     2e8:	50010c00 	andpl	r0, r1, r0, lsl #24
     2ec:	00960802 	addseq	r0, r6, r2, lsl #16
     2f0:	0082080d 	addeq	r0, r2, sp, lsl #16
     2f4:	0001a700 	andeq	sl, r1, r0, lsl #14
     2f8:	50010c00 	andpl	r0, r1, r0, lsl #24
     2fc:	00960802 	addseq	r0, r6, r2, lsl #16
     300:	01a30e00 			; <UNDEFINED> instruction: 0x01a30e00
     304:	52010000 	andpl	r0, r1, #0
     308:	00000197 	muleq	r0, r7, r1
     30c:	3f200000 	svccc	0x00200000
     310:	00019c0f 	andeq	r9, r1, pc, lsl #24
     314:	a2041000 	andge	r1, r4, #0
     318:	11000001 	tstne	r0, r1
     31c:	0000005a 	andeq	r0, r0, sl, asr r0
     320:	00017612 	andeq	r7, r1, r2, lsl r6
     324:	13190300 	tstne	r9, #0, 6
     328:	0000005a 	andeq	r0, r0, sl, asr r0
     32c:	02f10000 	rscseq	r0, r1, #0
     330:	00040000 	andeq	r0, r4, r0
     334:	0000019e 	muleq	r0, lr, r1
     338:	00870104 	addeq	r0, r7, r4, lsl #2
     33c:	b6010000 	strlt	r0, [r1], -r0
     340:	28000001 	stmdacs	r0, {r0}
     344:	14000000 	strne	r0, [r0], #-0
     348:	20000082 	andcs	r0, r0, r2, lsl #1
     34c:	f9000001 			; <UNDEFINED> instruction: 0xf9000001
     350:	02000000 	andeq	r0, r0, #0
     354:	01170801 	tsteq	r7, r1, lsl #16
     358:	02020000 	andeq	r0, r2, #0
     35c:	00015505 	andeq	r5, r1, r5, lsl #10
     360:	05040300 	streq	r0, [r4, #-768]	; 0x300
     364:	00746e69 	rsbseq	r6, r4, r9, ror #28
     368:	00050802 	andeq	r0, r5, r2, lsl #16
     36c:	04000000 	streq	r0, [r0], #-0
     370:	00000106 	andeq	r0, r0, r6, lsl #2
     374:	004c1602 	subeq	r1, ip, r2, lsl #12
     378:	01020000 	mrseq	r0, (UNDEF: 2)
     37c:	00010e08 	andeq	r0, r1, r8, lsl #28
     380:	02cf0400 	sbceq	r0, pc, #0, 8
     384:	18020000 	stmdane	r2, {}	; <UNPREDICTABLE>
     388:	0000005e 	andeq	r0, r0, lr, asr r0
     38c:	28070202 	stmdacs	r7, {r1, r9}
     390:	02000001 	andeq	r0, r0, #1
     394:	005e0704 	subseq	r0, lr, r4, lsl #14
     398:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
     39c:	00005407 	andeq	r5, r0, r7, lsl #8
     3a0:	029b0500 	addseq	r0, fp, #0, 10
     3a4:	1d010000 	stcne	0, cr0, [r1, #-0]
     3a8:	00008214 	andeq	r8, r0, r4, lsl r2
     3ac:	0000001c 	andeq	r0, r0, ip, lsl r0
     3b0:	00b69c01 	adcseq	r9, r6, r1, lsl #24
     3b4:	1c060000 	stcne	0, cr0, [r6], {-0}
     3b8:	ac000082 	stcge	0, cr0, [r0], {130}	; 0x82
     3bc:	06000001 	streq	r0, [r0], -r1
     3c0:	00008220 	andeq	r8, r0, r0, lsr #4
     3c4:	000001b3 			; <UNDEFINED> instruction: 0x000001b3
     3c8:	00822406 	addeq	r2, r2, r6, lsl #8
     3cc:	0001ba00 	andeq	fp, r1, r0, lsl #20
     3d0:	82280600 	eorhi	r0, r8, #0, 12
     3d4:	01c70000 	biceq	r0, r7, r0
     3d8:	2c060000 	stccs	0, cr0, [r6], {-0}
     3dc:	ce000082 	cdpgt	0, 0, cr0, cr0, cr2, {4}
     3e0:	00000001 	andeq	r0, r0, r1
     3e4:	00021405 	andeq	r1, r2, r5, lsl #8
     3e8:	30310100 	eorscc	r0, r1, r0, lsl #2
     3ec:	24000082 	strcs	r0, [r0], #-130	; 0x82
     3f0:	01000000 	mrseq	r0, (UNDEF: 0)
     3f4:	0000f09c 	muleq	r0, ip, r0
     3f8:	82480700 	subhi	r0, r8, #0, 14
     3fc:	01df0000 	bicseq	r0, pc, r0
     400:	00de0000 	sbcseq	r0, lr, r0
     404:	01080000 	mrseq	r0, (UNDEF: 8)
     408:	00310150 	eorseq	r0, r1, r0, asr r1
     40c:	00824c09 	addeq	r4, r2, r9, lsl #24
     410:	00740200 	rsbseq	r0, r4, r0, lsl #4
     414:	00825006 	addeq	r5, r2, r6
     418:	0001f400 	andeq	pc, r1, r0, lsl #8
     41c:	f30a0000 	vhadd.u8	d0, d10, d0
     420:	01000001 	tsteq	r0, r1
     424:	00018241 	andeq	r8, r1, r1, asr #4
     428:	00825400 	addeq	r5, r2, r0, lsl #8
     42c:	0000e000 	andeq	lr, r0, r0
     430:	829c0100 	addshi	r0, ip, #0, 2
     434:	0b000001 	bleq	440 <__start-0x7bc0>
     438:	000001eb 	andeq	r0, r0, fp, ror #3
     43c:	00334101 	eorseq	r4, r3, r1, lsl #2
     440:	01410000 	mrseq	r0, (UNDEF: 65)
     444:	080b0000 	stmdaeq	fp, {}	; <UNPREDICTABLE>
     448:	01000003 	tsteq	r0, r3
     44c:	00018441 	andeq	r8, r1, r1, asr #8
     450:	00025c00 	andeq	r5, r2, r0, lsl #24
     454:	82980600 	addshi	r0, r8, #0, 12
     458:	01fb0000 	mvnseq	r0, r0
     45c:	ac060000 	stcge	0, cr0, [r6], {-0}
     460:	10000082 	andne	r0, r0, r2, lsl #1
     464:	06000002 	streq	r0, [r0], -r2
     468:	000082b8 			; <UNDEFINED> instruction: 0x000082b8
     46c:	00000235 	andeq	r0, r0, r5, lsr r2
     470:	0082c806 	addeq	ip, r2, r6, lsl #16
     474:	00024a00 	andeq	r4, r2, r0, lsl #20
     478:	82d40600 	sbcshi	r0, r4, #0, 12
     47c:	02640000 	rsbeq	r0, r4, #0
     480:	e8060000 	stmda	r6, {}	; <UNPREDICTABLE>
     484:	79000082 	stmdbvc	r0, {r1, r7}
     488:	06000002 	streq	r0, [r0], -r2
     48c:	000082fc 	strdeq	r8, [r0], -ip
     490:	00000298 	muleq	r0, r8, r2
     494:	00830806 	addeq	r0, r3, r6, lsl #16
     498:	0002b700 	andeq	fp, r2, r0, lsl #14
     49c:	83200600 	teqhi	r0, #0, 12
     4a0:	02c80000 	sbceq	r0, r8, #0
     4a4:	28060000 	stmdacs	r6, {}	; <UNPREDICTABLE>
     4a8:	e7000083 	str	r0, [r0, -r3, lsl #1]
     4ac:	00000002 	andeq	r0, r0, r2
     4b0:	040d040c 	streq	r0, [sp], #-1036	; 0x40c
     4b4:	00000033 	andeq	r0, r0, r3, lsr r0
     4b8:	0001950e 	andeq	r9, r1, lr, lsl #10
     4bc:	00530f00 	subseq	r0, r3, r0, lsl #30
     4c0:	10000000 	andne	r0, r0, r0
     4c4:	0000020a 	andeq	r0, r0, sl, lsl #4
     4c8:	01a62c01 			; <UNDEFINED> instruction: 0x01a62c01
     4cc:	03050000 	movweq	r0, #20480	; 0x5000
     4d0:	0000b004 	andeq	fp, r0, r4
     4d4:	018a040d 	orreq	r0, sl, sp, lsl #8
     4d8:	44110000 	ldrmi	r0, [r1], #-0
     4dc:	03000002 	movweq	r0, #2
     4e0:	02011117 	andeq	r1, r1, #-1073741819	; 0xc0000005
     4e4:	12040000 	andne	r0, r4, #0
     4e8:	00027412 	andeq	r7, r2, r2, lsl r4
     4ec:	c7100800 	ldrgt	r0, [r0, -r0, lsl #16]
     4f0:	13000001 	movwne	r0, #1
     4f4:	02321100 	eorseq	r1, r2, #0, 2
     4f8:	2b050000 	blcs	140500 <__end+0x13500>
     4fc:	00022214 	andeq	r2, r2, r4, lsl r2
     500:	33170800 	tstcc	r7, #0, 16
     504:	df000000 	svcle	0x00000000
     508:	13000001 	movwne	r0, #1
     50c:	02e61500 	rsceq	r1, r6, #0, 10
     510:	1a040000 	bne	100518 <__bss_end+0xf4518>
     514:	00000053 	andeq	r0, r0, r3, asr r0
     518:	000001f4 	strdeq	r0, [r0], -r4
     51c:	0000410f 	andeq	r4, r0, pc, lsl #2
     520:	ca110000 	bgt	440528 <__user_program+0x140528>
     524:	06000001 	streq	r0, [r0], -r1
     528:	02b51525 	adcseq	r1, r5, #155189248	; 0x9400000
     52c:	15070000 	strne	r0, [r7, #-0]
     530:	00000182 	andeq	r0, r0, r2, lsl #3
     534:	00000210 	andeq	r0, r0, r0, lsl r2
     538:	0000330f 	andeq	r3, r0, pc, lsl #6
     53c:	a7150000 	ldrge	r0, [r5, -r0]
     540:	07000002 	streq	r0, [r0, -r2]
     544:	0000331f 	andeq	r3, r0, pc, lsl r3
     548:	00022f00 	andeq	r2, r2, r0, lsl #30
     54c:	00330f00 	eorseq	r0, r3, r0, lsl #30
     550:	2f0f0000 	svccs	0x000f0000
     554:	0f000002 	svceq	0x00000002
     558:	00000033 	andeq	r0, r0, r3, lsr r0
     55c:	25040d00 	strcs	r0, [r4, #-3328]	; 0xd00
     560:	15000000 	strne	r0, [r0, #-0]
     564:	000001a8 	andeq	r0, r0, r8, lsr #3
     568:	00332807 	eorseq	r2, r3, r7, lsl #16
     56c:	024a0000 	subeq	r0, sl, #0
     570:	330f0000 	movwcc	r0, #61440	; 0xf000
     574:	00000000 	andeq	r0, r0, r0
     578:	00024e15 	andeq	r4, r2, r5, lsl lr
     57c:	33320700 	teqcc	r2, #0, 14
     580:	64000000 	strvs	r0, [r0], #-0
     584:	0f000002 	svceq	0x00000002
     588:	00000033 	andeq	r0, r0, r3, lsr r0
     58c:	0001820f 	andeq	r8, r1, pc, lsl #4
     590:	8c150000 	ldchi	0, cr0, [r5], {-0}
     594:	07000002 	streq	r0, [r0, -r2]
     598:	0000333b 	andeq	r3, r0, fp, lsr r3
     59c:	00027900 	andeq	r7, r2, r0, lsl #18
     5a0:	00330f00 	eorseq	r0, r3, r0, lsl #30
     5a4:	15000000 	strne	r0, [r0, #-0]
     5a8:	000002d8 	ldrdeq	r0, [r0], -r8
     5ac:	00334607 	eorseq	r4, r3, r7, lsl #12
     5b0:	02980000 	addseq	r0, r8, #0
     5b4:	330f0000 	movwcc	r0, #61440	; 0xf000
     5b8:	0f000000 	svceq	0x00000000
     5bc:	00000033 	andeq	r0, r0, r3, lsr r0
     5c0:	0000330f 	andeq	r3, r0, pc, lsl #6
     5c4:	de150000 	cdple	0, 1, cr0, cr5, cr0, {0}
     5c8:	07000001 	streq	r0, [r0, -r1]
     5cc:	00003350 	andeq	r3, r0, r0, asr r3
     5d0:	0002b700 	andeq	fp, r2, r0, lsl #14
     5d4:	00330f00 	eorseq	r0, r3, r0, lsl #30
     5d8:	2f0f0000 	svccs	0x000f0000
     5dc:	0f000002 	svceq	0x00000002
     5e0:	00000033 	andeq	r0, r0, r3, lsr r0
     5e4:	02c21600 	sbceq	r1, r2, #0, 12
     5e8:	58070000 	stmdapl	r7, {}	; <UNPREDICTABLE>
     5ec:	000002c8 	andeq	r0, r0, r8, asr #5
     5f0:	0000330f 	andeq	r3, r0, pc, lsl #6
     5f4:	ef150000 	svc	0x00150000
     5f8:	07000002 	streq	r0, [r0, -r2]
     5fc:	00003364 	andeq	r3, r0, r4, ror #6
     600:	0002e700 	andeq	lr, r2, r0, lsl #14
     604:	00330f00 	eorseq	r0, r3, r0, lsl #30
     608:	410f0000 	mrsmi	r0, CPSR
     60c:	0f000000 	svceq	0x00000000
     610:	000001a6 	andeq	r0, r0, r6, lsr #3
     614:	025c1700 	subseq	r1, ip, #0, 14
     618:	6b070000 	blvs	1c0620 <__end+0x93620>
     61c:	00000033 	andeq	r0, r0, r3, lsr r0
     620:	f0000013 			; <UNDEFINED> instruction: 0xf0000013
     624:	04000002 	streq	r0, [r0], #-2
     628:	0002ee00 	andeq	lr, r2, r0, lsl #28
     62c:	87010400 	strhi	r0, [r1, -r0, lsl #8]
     630:	01000000 	mrseq	r0, (UNDEF: 0)
     634:	00000316 	andeq	r0, r0, r6, lsl r3
     638:	00000028 	andeq	r0, r0, r8, lsr #32
     63c:	00008334 	andeq	r8, r0, r4, lsr r3
     640:	00000298 	muleq	r0, r8, r2
     644:	000001d9 	ldrdeq	r0, [r0], -r9
     648:	00010702 	andeq	r0, r1, r2, lsl #14
     64c:	300e0200 	andcc	r0, lr, r0, lsl #4
     650:	03000000 	movweq	r0, #0
     654:	01170801 	tsteq	r7, r1, lsl #16
     658:	02030000 	andeq	r0, r3, #0
     65c:	00015505 	andeq	r5, r1, r5, lsl #10
     660:	016e0200 	cmneq	lr, r0, lsl #4
     664:	12020000 	andne	r0, r2, #0
     668:	00000049 	andeq	r0, r0, r9, asr #32
     66c:	69050404 	stmdbvs	r5, {r2, sl}
     670:	0300746e 	movweq	r7, #1134	; 0x46e
     674:	00000508 	andeq	r0, r0, r8, lsl #10
     678:	06020000 	streq	r0, [r2], -r0
     67c:	02000001 	andeq	r0, r0, #1
     680:	00006216 	andeq	r6, r0, r6, lsl r2
     684:	08010300 	stmdaeq	r1, {r8, r9}
     688:	0000010e 	andeq	r0, r0, lr, lsl #2
     68c:	28070203 	stmdacs	r7, {r0, r1, r9}
     690:	02000001 	andeq	r0, r0, #1
     694:	0000016d 	andeq	r0, r0, sp, ror #2
     698:	007b1a02 	rsbseq	r1, fp, r2, lsl #20
     69c:	04030000 	streq	r0, [r3], #-0
     6a0:	00005e07 	andeq	r5, r0, r7, lsl #28
     6a4:	030d0200 	movweq	r0, #53760	; 0xd200
     6a8:	1c020000 	stcne	0, cr0, [r2], {-0}
     6ac:	0000008d 	andeq	r0, r0, sp, lsl #1
     6b0:	54070803 	strpl	r0, [r7], #-2051	; 0x803
     6b4:	02000000 	andeq	r0, r0, #0
     6b8:	0000032c 	andeq	r0, r0, ip, lsr #6
     6bc:	009f1303 	addseq	r1, pc, r3, lsl #6
     6c0:	2a050000 	bcs	1406c8 <__end+0x136c8>
     6c4:	04000003 	streq	r0, [r0], #-3
     6c8:	00b60004 	adcseq	r0, r6, r4
     6cc:	78060000 	stmdavc	r6, {}	; <UNPREDICTABLE>
     6d0:	b6000003 	strlt	r0, [r0], -r3
     6d4:	00000000 	andeq	r0, r0, r0
     6d8:	08040700 	stmdaeq	r4, {r8, r9, sl}
     6dc:	00000342 	andeq	r0, r0, r2, asr #6
     6e0:	83342101 	teqhi	r4, #1073741824	; 0x40000000
     6e4:	00e00000 	rsceq	r0, r0, r0
     6e8:	9c010000 	stcls	0, cr0, [r1], {-0}
     6ec:	0000012a 	andeq	r0, r0, sl, lsr #2
     6f0:	00035a09 	andeq	r5, r3, r9, lsl #20
     6f4:	57210100 	strpl	r0, [r1, -r0, lsl #2]!
     6f8:	a0000000 	andge	r0, r0, r0
     6fc:	0a000003 	beq	710 <__start-0x78f0>
     700:	006d756e 	rsbeq	r7, sp, lr, ror #10
     704:	00822101 	addeq	r2, r2, r1, lsl #2
     708:	03c10000 	biceq	r0, r1, #0
     70c:	530b0000 	movwpl	r0, #45056	; 0xb000
     710:	01000003 	tsteq	r0, r3
     714:	00012a22 	andeq	r2, r1, r2, lsr #20
     718:	0003f900 	andeq	pc, r3, r0, lsl #18
     71c:	75620c00 	strbvc	r0, [r2, #-3072]!	; 0xc00
     720:	23010066 	movwcs	r0, #4198	; 0x1066
     724:	00000130 	andeq	r0, r0, r0, lsr r1
     728:	0d589102 	ldfeqp	f1, [r8, #-8]
     72c:	00727470 	rsbseq	r7, r2, r0, ror r4
     730:	012a2401 	teqeq	sl, r1, lsl #8
     734:	04300000 	ldrteq	r0, [r0], #-0
     738:	e80e0000 	stmda	lr, {}	; <UNPREDICTABLE>
     73c:	e6000083 	str	r0, [r0], -r3, lsl #1
     740:	0e000002 	cdpeq	0, 0, cr0, cr0, cr2, {0}
     744:	00008400 	andeq	r8, r0, r0, lsl #8
     748:	000002e6 	andeq	r0, r0, r6, ror #5
     74c:	25040f00 	strcs	r0, [r4, #-3840]	; 0xf00
     750:	10000000 	andne	r0, r0, r0
     754:	00000025 	andeq	r0, r0, r5, lsr #32
     758:	00000140 	andeq	r0, r0, r0, asr #2
     75c:	00014011 	andeq	r4, r1, r1, lsl r0
     760:	03000700 	movweq	r0, #1792	; 0x700
     764:	036f0704 	cmneq	pc, #4, 14	; 0x100000
     768:	5f120000 	svcpl	0x00120000
     76c:	01000003 	tsteq	r0, r3
     770:	0000493f 	andeq	r4, r0, pc, lsr r9
     774:	00841400 	addeq	r1, r4, r0, lsl #8
     778:	0001b800 	andeq	fp, r1, r0, lsl #16
     77c:	b59c0100 	ldrlt	r0, [ip, #256]	; 0x100
     780:	0a000002 	beq	790 <__start-0x7870>
     784:	00746d66 	rsbseq	r6, r4, r6, ror #26
     788:	02b53f01 	adcseq	r3, r5, #1, 30
     78c:	04980000 	ldreq	r0, [r8], #0
     790:	14130000 	ldrne	r0, [r3], #-0
     794:	00000308 	andeq	r0, r0, r8, lsl #6
     798:	00944001 	addseq	r4, r4, r1
     79c:	91020000 	mrsls	r0, (UNDEF: 2)
     7a0:	00001554 	andeq	r1, r0, r4, asr r5
     7a4:	01a70000 			; <UNDEFINED> instruction: 0x01a70000
     7a8:	6e0d0000 	cdpvs	0, 0, cr0, cr13, cr0, {0}
     7ac:	01006d75 	tsteq	r0, r5, ror sp
     7b0:	00007061 	andeq	r7, r0, r1, rrx
     7b4:	0004cf00 	andeq	ip, r4, r0, lsl #30
     7b8:	852c1600 	strhi	r1, [ip, #-1536]!	; 0x600
     7bc:	00b80000 	adcseq	r0, r8, r0
     7c0:	01170000 	tsteq	r7, r0
     7c4:	00780250 	rsbseq	r0, r8, r0, asr r2
     7c8:	18150000 	ldmdane	r5, {}	; <UNPREDICTABLE>
     7cc:	d0000000 	andle	r0, r0, r0
     7d0:	0d000001 	stceq	0, cr0, [r0, #-4]
     7d4:	006d756e 	rsbeq	r7, sp, lr, ror #10
     7d8:	00706801 	rsbseq	r6, r0, r1, lsl #16
     7dc:	04ee0000 	strbteq	r0, [lr], #0
     7e0:	4c160000 	ldcmi	0, cr0, [r6], {-0}
     7e4:	b8000085 	stmdalt	r0, {r0, r2, r7}
     7e8:	17000000 	strne	r0, [r0, -r0]
     7ec:	77025001 	strvc	r5, [r2, -r1]
     7f0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     7f4:	000084a8 	andeq	r8, r0, r8, lsr #9
     7f8:	00000048 	andeq	r0, r0, r8, asr #32
     7fc:	00000223 	andeq	r0, r0, r3, lsr #4
     800:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
     804:	3e500100 	rdfccs	f0, f0, f0
     808:	0d000000 	stceq	0, cr0, [r0, #-0]
     80c:	19000005 	stmdbne	r0, {r0, r2}
     810:	000084c8 	andeq	r8, r0, r8, asr #9
     814:	000002e6 	andeq	r0, r0, r6, ror #5
     818:	00000200 	andeq	r0, r0, r0, lsl #4
     81c:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
     820:	19002d08 	stmdbne	r0, {r3, r8, sl, fp, sp}
     824:	000084d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     828:	000000b8 	strheq	r0, [r0], -r8
     82c:	00000213 	andeq	r0, r0, r3, lsl r2
     830:	01500117 	cmpeq	r0, r7, lsl r1
     834:	ec16003a 	ldc	0, cr0, [r6], {58}	; 0x3a
     838:	b8000084 	stmdalt	r0, {r2, r7}
     83c:	17000000 	strne	r0, [r0, -r0]
     840:	3a015001 	bcc	5484c <__bss_end+0x4884c>
     844:	f0180000 			; <UNDEFINED> instruction: 0xf0180000
     848:	20000084 	andcs	r0, r0, r4, lsl #1
     84c:	4f000000 	svcmi	0x00000000
     850:	0d000002 	stceq	0, cr0, [r0, #-8]
     854:	006d756e 	rsbeq	r7, sp, lr, ror #10
     858:	00705b01 	rsbseq	r5, r0, r1, lsl #22
     85c:	05200000 	streq	r0, [r0, #-0]!
     860:	0c160000 	ldceq	0, cr0, [r6], {-0}
     864:	b8000085 	stmdalt	r0, {r0, r2, r7}
     868:	17000000 	strne	r0, [r0, -r0]
     86c:	3a015001 	bcc	54878 <__bss_end+0x48878>
     870:	50180000 	andspl	r0, r8, r0
     874:	30000085 	andcc	r0, r0, r5, lsl #1
     878:	75000000 	strvc	r0, [r0, #-0]
     87c:	0b000002 	bleq	88c <__start-0x7774>
     880:	00000366 	andeq	r0, r0, r6, ror #6
     884:	012a6e01 	teqeq	sl, r1, lsl #28
     888:	053f0000 	ldreq	r0, [pc, #-0]!	; 890 <__start-0x7770>
     88c:	700e0000 	andvc	r0, lr, r0
     890:	e6000085 	str	r0, [r0], -r5, lsl #1
     894:	00000002 	andeq	r0, r0, r2
     898:	00858018 	addeq	r8, r5, r8, lsl r0
     89c:	00001800 	andeq	r1, r0, r0, lsl #16
     8a0:	00029b00 	andeq	r9, r2, r0, lsl #22
     8a4:	03860b00 	orreq	r0, r6, #0, 22
     8a8:	77010000 	strvc	r0, [r1, -r0]
     8ac:	0000003e 	andeq	r0, r0, lr, lsr r0
     8b0:	0000055f 	andeq	r0, r0, pc, asr r5
     8b4:	0085940e 	addeq	r9, r5, lr, lsl #8
     8b8:	0002e600 	andeq	lr, r2, r0, lsl #12
     8bc:	4c0e0000 	stcmi	0, cr0, [lr], {-0}
     8c0:	e6000084 	str	r0, [r0], -r4, lsl #1
     8c4:	16000002 	strne	r0, [r0], -r2
     8c8:	000085a0 	andeq	r8, r0, r0, lsr #11
     8cc:	000002e6 	andeq	r0, r0, r6, ror #5
     8d0:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
     8d4:	00002508 	andeq	r2, r0, r8, lsl #10
     8d8:	02bb040f 	adcseq	r0, fp, #251658240	; 0xf000000
     8dc:	301a0000 	andscc	r0, sl, r0
     8e0:	10000000 	andne	r0, r0, r0
     8e4:	00000030 	andeq	r0, r0, r0, lsr r0
     8e8:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     8ec:	00014011 	andeq	r4, r1, r1, lsl r0
     8f0:	14001000 	strne	r1, [r0], #-0
     8f4:	0000034c 	andeq	r0, r0, ip, asr #6
     8f8:	02e11801 	rsceq	r1, r1, #65536	; 0x10000
     8fc:	03050000 	movweq	r0, #20480	; 0x5000
     900:	0000a000 	andeq	sl, r0, r0
     904:	0002c01a 	andeq	ip, r2, sl, lsl r0
     908:	03341b00 	teqeq	r4, #0, 22
     90c:	23050000 	movwcs	r0, #20480	; 0x5000
     910:	0000571c 	andeq	r5, r0, ip, lsl r7
     914:	53000000 	movwpl	r0, #0
     918:	04000001 	streq	r0, [r0], #-1
     91c:	00045800 	andeq	r5, r4, r0, lsl #16
     920:	87010400 	strhi	r0, [r1, -r0, lsl #8]
     924:	01000000 	mrseq	r0, (UNDEF: 0)
     928:	0000038b 	andeq	r0, r0, fp, lsl #7
     92c:	00000028 	andeq	r0, r0, r8, lsr #32
     930:	000085cc 	andeq	r8, r0, ip, asr #11
     934:	000000c0 	andeq	r0, r0, r0, asr #1
     938:	000002bd 			; <UNDEFINED> instruction: 0x000002bd
     93c:	17080102 	strne	r0, [r8, -r2, lsl #2]
     940:	02000001 	andeq	r0, r0, #1
     944:	01550502 	cmpeq	r5, r2, lsl #10
     948:	04030000 	streq	r0, [r3], #-0
     94c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     950:	05080200 	streq	r0, [r8, #-512]	; 0x200
     954:	00000000 	andeq	r0, r0, r0
     958:	00010604 	andeq	r0, r1, r4, lsl #12
     95c:	4c160200 	lfmmi	f0, 4, [r6], {-0}
     960:	02000000 	andeq	r0, r0, #0
     964:	010e0801 	tsteq	lr, r1, lsl #16
     968:	02020000 	andeq	r0, r2, #0
     96c:	00012807 	andeq	r2, r1, r7, lsl #16
     970:	016d0400 	cmneq	sp, r0, lsl #8
     974:	1a020000 	bne	8097c <__bss_end+0x7497c>
     978:	00000065 	andeq	r0, r0, r5, rrx
     97c:	5e070402 	cdppl	4, 0, cr0, cr7, cr2, {0}
     980:	02000000 	andeq	r0, r0, #0
     984:	00540708 	subseq	r0, r4, r8, lsl #14
     988:	44050000 	strmi	r0, [r5], #-0
     98c:	01000002 	tsteq	r0, r2
     990:	0085cc25 	addeq	ip, r5, r5, lsr #24
     994:	00006000 	andeq	r6, r0, r0
     998:	e59c0100 	ldr	r0, [ip, #256]	; 0x100
     99c:	06000000 	streq	r0, [r0], -r0
     9a0:	000085ec 	andeq	r8, r0, ip, ror #11
     9a4:	0000012e 	andeq	r0, r0, lr, lsr #2
     9a8:	000000a0 	andeq	r0, r0, r0, lsr #1
     9ac:	01510107 	cmpeq	r1, r7, lsl #2
     9b0:	50010730 	andpl	r0, r1, r0, lsr r7
     9b4:	06003f01 	streq	r3, [r0], -r1, lsl #30
     9b8:	000085f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
     9bc:	0000012e 	andeq	r0, r0, lr, lsr #2
     9c0:	000000b8 	strheq	r0, [r0], -r8
     9c4:	01510107 	cmpeq	r1, r7, lsl #2
     9c8:	50010730 	andpl	r0, r1, r0, lsr r7
     9cc:	06003e01 	streq	r3, [r0], -r1, lsl #28
     9d0:	00008604 	andeq	r8, r0, r4, lsl #12
     9d4:	00000144 	andeq	r0, r0, r4, asr #2
     9d8:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     9dc:	01510107 	cmpeq	r1, r7, lsl #2
     9e0:	50010732 	andpl	r0, r1, r2, lsr r7
     9e4:	08003f01 	stmdaeq	r0, {r0, r8, r9, sl, fp, ip, sp}
     9e8:	00008610 	andeq	r8, r0, r0, lsl r6
     9ec:	00000144 	andeq	r0, r0, r4, asr #2
     9f0:	01510107 	cmpeq	r1, r7, lsl #2
     9f4:	50010732 	andpl	r0, r1, r2, lsr r7
     9f8:	00003e01 	andeq	r3, r0, r1, lsl #28
     9fc:	00039d09 	andeq	r9, r3, r9, lsl #26
     a00:	2c3f0100 	ldfcss	f0, [pc], #-0	; a08 <__start-0x75f8>
     a04:	14000086 	strne	r0, [r0], #-134	; 0x86
     a08:	01000000 	mrseq	r0, (UNDEF: 0)
     a0c:	0334059c 	teqeq	r4, #156, 10	; 0x27000000
     a10:	4b010000 	blmi	40a18 <__bss_end+0x34a18>
     a14:	00008640 	andeq	r8, r0, r0, asr #12
     a18:	00000024 	andeq	r0, r0, r4, lsr #32
     a1c:	01199c01 	tsteq	r9, r1, lsl #24
     a20:	860a0000 	strhi	r0, [sl], -r0
     a24:	01000003 	tsteq	r0, r3
     a28:	0000414b 	andeq	r4, r0, fp, asr #2
     a2c:	00500100 	subseq	r0, r0, r0, lsl #2
     a30:	00037d0b 	andeq	r7, r3, fp, lsl #26
     a34:	41580100 	cmpmi	r8, r0, lsl #2
     a38:	64000000 	strvs	r0, [r0], #-0
     a3c:	28000086 	stmdacs	r0, {r1, r2, r7}
     a40:	01000000 	mrseq	r0, (UNDEF: 0)
     a44:	015f0c9c 			; <UNDEFINED> instruction: 0x015f0c9c
     a48:	4b030000 	blmi	c0a50 <__bss_end+0xb4a50>
     a4c:	00000144 	andeq	r0, r0, r4, asr #2
     a50:	0000410d 	andeq	r4, r0, sp, lsl #2
     a54:	00410d00 	subeq	r0, r1, r0, lsl #26
     a58:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     a5c:	00000149 	andeq	r0, r0, r9, asr #2
     a60:	410d3703 	tstmi	sp, r3, lsl #14
     a64:	0d000000 	stceq	0, cr0, [r0, #-0]
     a68:	00000041 	andeq	r0, r0, r1, asr #32
     a6c:	020c0000 	andeq	r0, ip, #0
     a70:	00040000 	andeq	r0, r4, r0
     a74:	00000539 	andeq	r0, r0, r9, lsr r5
     a78:	00870104 	addeq	r0, r7, r4, lsl #2
     a7c:	a8010000 	stmdage	r1, {}	; <UNPREDICTABLE>
     a80:	28000003 	stmdacs	r0, {r0, r1}
     a84:	8c000000 	stchi	0, cr0, [r0], {-0}
     a88:	d4000086 	strle	r0, [r0], #-134	; 0x86
     a8c:	46000001 	strmi	r0, [r0], -r1
     a90:	02000003 	andeq	r0, r0, #3
     a94:	01170801 	tsteq	r7, r1, lsl #16
     a98:	02020000 	andeq	r0, r2, #0
     a9c:	00015505 	andeq	r5, r1, r5, lsl #10
     aa0:	05040300 	streq	r0, [r4, #-768]	; 0x300
     aa4:	00746e69 	rsbseq	r6, r4, r9, ror #28
     aa8:	00050802 	andeq	r0, r5, r2, lsl #16
     aac:	04000000 	streq	r0, [r0], #-0
     ab0:	00000106 	andeq	r0, r0, r6, lsl #2
     ab4:	004c1602 	subeq	r1, ip, r2, lsl #12
     ab8:	01020000 	mrseq	r0, (UNDEF: 2)
     abc:	00010e08 	andeq	r0, r1, r8, lsl #28
     ac0:	02cf0400 	sbceq	r0, pc, #0, 8
     ac4:	18020000 	stmdane	r2, {}	; <UNPREDICTABLE>
     ac8:	0000005e 	andeq	r0, r0, lr, asr r0
     acc:	28070202 	stmdacs	r7, {r1, r9}
     ad0:	04000001 	streq	r0, [r0], #-1
     ad4:	0000016d 	andeq	r0, r0, sp, ror #2
     ad8:	00701a02 	rsbseq	r1, r0, r2, lsl #20
     adc:	04020000 	streq	r0, [r2], #-0
     ae0:	00005e07 	andeq	r5, r0, r7, lsl #28
     ae4:	07080200 	streq	r0, [r8, -r0, lsl #4]
     ae8:	00000054 	andeq	r0, r0, r4, asr r0
     aec:	0003d505 	andeq	sp, r3, r5, lsl #10
     af0:	8c290100 	stfhis	f0, [r9], #-0
     af4:	48000086 	stmdami	r0, {r1, r2, r7}
     af8:	01000000 	mrseq	r0, (UNDEF: 0)
     afc:	0000ff9c 	muleq	r0, ip, pc	; <UNPREDICTABLE>
     b00:	6c630600 	stclvs	6, cr0, [r3], #-0
     b04:	2901006b 	stmdbcs	r1, {r0, r1, r3, r5, r6}
     b08:	00000053 	andeq	r0, r0, r3, asr r0
     b0c:	00000573 	andeq	r0, r0, r3, ror r5
     b10:	0086a007 	addeq	sl, r6, r7
     b14:	0001e700 	andeq	lr, r1, r0, lsl #14
     b18:	0000ba00 	andeq	fp, r0, r0, lsl #20
     b1c:	51010800 	tstpl	r1, r0, lsl #16
     b20:	01083001 	tsteq	r8, r1
     b24:	00320150 	eorseq	r0, r2, r0, asr r1
     b28:	0086ac07 	addeq	sl, r6, r7, lsl #24
     b2c:	0001e700 	andeq	lr, r1, r0, lsl #14
     b30:	0000d200 	andeq	sp, r0, r0, lsl #4
     b34:	51010800 	tstpl	r1, r0, lsl #16
     b38:	01083001 	tsteq	r8, r1
     b3c:	00330150 	eorseq	r0, r3, r0, asr r1
     b40:	0086b807 	addeq	fp, r6, r7, lsl #16
     b44:	0001fd00 	andeq	pc, r1, r0, lsl #26
     b48:	0000ea00 	andeq	lr, r0, r0, lsl #20
     b4c:	51010800 	tstpl	r1, r0, lsl #16
     b50:	01083401 	tsteq	r8, r1, lsl #8
     b54:	00320150 	eorseq	r0, r2, r0, asr r1
     b58:	0086c409 	addeq	ip, r6, r9, lsl #8
     b5c:	0001fd00 	andeq	pc, r1, r0, lsl #26
     b60:	51010800 	tstpl	r1, r0, lsl #16
     b64:	01083401 	tsteq	r8, r1, lsl #8
     b68:	00330150 	eorseq	r0, r3, r0, asr r1
     b6c:	03e50a00 	mvneq	r0, #0, 20
     b70:	3e010000 	cdpcc	0, 0, cr0, cr1, cr0, {0}
     b74:	00000041 	andeq	r0, r0, r1, asr #32
     b78:	000086d4 	ldrdeq	r8, [r0], -r4
     b7c:	000000c8 	andeq	r0, r0, r8, asr #1
     b80:	01719c01 	cmneq	r1, r1, lsl #24
     b84:	62060000 	andvs	r0, r6, #0
     b88:	01006675 	tsteq	r0, r5, ror r6
     b8c:	0001713e 	andeq	r7, r1, lr, lsr r1
     b90:	00059400 	andeq	r9, r5, r0, lsl #8
     b94:	656c0600 	strbvs	r0, [ip, #-1536]!	; 0x600
     b98:	3e01006e 	cdpcc	0, 0, cr0, cr1, cr14, {3}
     b9c:	00000053 	andeq	r0, r0, r3, asr r0
     ba0:	000005db 	ldrdeq	r0, [r0], -fp
     ba4:	0003b90b 	andeq	fp, r3, fp, lsl #18
     ba8:	413e0100 	teqmi	lr, r0, lsl #2
     bac:	07000000 	streq	r0, [r0, -r0]
     bb0:	0c000006 	stceq	0, cr0, [r0], {6}
     bb4:	50010069 	andpl	r0, r1, r9, rrx
     bb8:	00000053 	andeq	r0, r0, r3, asr r0
     bbc:	00000633 	andeq	r0, r0, r3, lsr r6
     bc0:	0003f60d 	andeq	pc, r3, sp, lsl #12
     bc4:	53630100 	cmnpl	r3, #0, 2
     bc8:	6d000000 	stcvs	0, cr0, [r0, #-0]
     bcc:	0d000006 	stceq	0, cr0, [r0, #-24]	; 0xffffffe8
     bd0:	000003ce 	andeq	r0, r0, lr, asr #7
     bd4:	00536601 	subseq	r6, r3, r1, lsl #12
     bd8:	068e0000 	streq	r0, [lr], r0
     bdc:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     be0:	00004104 	andeq	r4, r0, r4, lsl #2
     be4:	03be0a00 			; <UNDEFINED> instruction: 0x03be0a00
     be8:	73010000 	movwvc	r0, #4096	; 0x1000
     bec:	00000041 	andeq	r0, r0, r1, asr #32
     bf0:	0000879c 	muleq	r0, ip, r7
     bf4:	000000c4 	andeq	r0, r0, r4, asr #1
     bf8:	01e79c01 	mvneq	r9, r1, lsl #24
     bfc:	62060000 	andvs	r0, r6, #0
     c00:	01006675 	tsteq	r0, r5, ror r6
     c04:	00017173 	andeq	r7, r1, r3, ror r1
     c08:	0006a100 	andeq	sl, r6, r0, lsl #2
     c0c:	656c0f00 	strbvs	r0, [ip, #-3840]!	; 0xf00
     c10:	7301006e 	movwvc	r0, #4206	; 0x106e
     c14:	00000053 	andeq	r0, r0, r3, asr r0
     c18:	b90b5101 	stmdblt	fp, {r0, r8, ip, lr}
     c1c:	01000003 	tsteq	r0, r3
     c20:	00004173 	andeq	r4, r0, r3, ror r1
     c24:	0006db00 	andeq	sp, r6, r0, lsl #22
     c28:	00690c00 	rsbeq	r0, r9, r0, lsl #24
     c2c:	00538b01 	subseq	r8, r3, r1, lsl #22
     c30:	07070000 	streq	r0, [r7, -r0]
     c34:	f60d0000 			; <UNDEFINED> instruction: 0xf60d0000
     c38:	01000003 	tsteq	r0, r3
     c3c:	00005398 	muleq	r0, r8, r3
     c40:	00072b00 	andeq	r2, r7, r0, lsl #22
     c44:	03ce0d00 	biceq	r0, lr, #0, 26
     c48:	9b010000 	blls	40c50 <__bss_end+0x34c50>
     c4c:	00000053 	andeq	r0, r0, r3, asr r0
     c50:	0000074c 	andeq	r0, r0, ip, asr #14
     c54:	015f1000 	cmpeq	pc, r0
     c58:	4b030000 	blmi	c0c60 <__bss_end+0xb4c60>
     c5c:	000001fd 	strdeq	r0, [r0], -sp
     c60:	00004111 	andeq	r4, r0, r1, lsl r1
     c64:	00411100 	subeq	r1, r1, r0, lsl #2
     c68:	12000000 	andne	r0, r0, #0
     c6c:	00000149 	andeq	r0, r0, r9, asr #2
     c70:	41113703 	tstmi	r1, r3, lsl #14
     c74:	11000000 	mrsne	r0, (UNDEF: 0)
     c78:	00000041 	andeq	r0, r0, r1, asr #32
     c7c:	00c10000 	sbceq	r0, r1, r0
     c80:	00040000 	andeq	r0, r4, r0
     c84:	00000649 	andeq	r0, r0, r9, asr #12
     c88:	00870104 	addeq	r0, r7, r4, lsl #2
     c8c:	fd010000 	stc2	0, cr0, [r1, #-0]
     c90:	28000003 	stmdacs	r0, {r0, r1}
     c94:	60000000 	andvs	r0, r0, r0
     c98:	70000088 	andvc	r0, r0, r8, lsl #1
     c9c:	12000000 	andne	r0, r0, #0
     ca0:	02000004 	andeq	r0, r0, #4
     ca4:	01170801 	tsteq	r7, r1, lsl #16
     ca8:	02020000 	andeq	r0, r2, #0
     cac:	00015505 	andeq	r5, r1, r5, lsl #10
     cb0:	05040300 	streq	r0, [r4, #-768]	; 0x300
     cb4:	00746e69 	rsbseq	r6, r4, r9, ror #28
     cb8:	00050802 	andeq	r0, r5, r2, lsl #16
     cbc:	02000000 	andeq	r0, r0, #0
     cc0:	010e0801 	tsteq	lr, r1, lsl #16
     cc4:	02020000 	andeq	r0, r2, #0
     cc8:	00012807 	andeq	r2, r1, r7, lsl #16
     ccc:	016d0400 	cmneq	sp, r0, lsl #8
     cd0:	1a020000 	bne	80cd8 <__bss_end+0x74cd8>
     cd4:	0000005a 	andeq	r0, r0, sl, asr r0
     cd8:	5e070402 	cdppl	4, 0, cr0, cr7, cr2, {0}
     cdc:	02000000 	andeq	r0, r0, #0
     ce0:	00540708 	subseq	r0, r4, r8, lsl #14
     ce4:	15050000 	strne	r0, [r5, #-0]
     ce8:	01000004 	tsteq	r0, r4
     cec:	0088602f 	addeq	r6, r8, pc, lsr #32
     cf0:	00003400 	andeq	r3, r0, r0, lsl #8
     cf4:	8d9c0100 	ldfhis	f0, [ip]
     cf8:	06000000 	streq	r0, [r0], -r0
     cfc:	00000410 	andeq	r0, r0, r0, lsl r4
     d00:	00332f01 	eorseq	r2, r3, r1, lsl #30
     d04:	075f0000 	ldrbeq	r0, [pc, -r0]
     d08:	07000000 	streq	r0, [r0, -r0]
     d0c:	00000432 	andeq	r0, r0, r2, lsr r4
     d10:	88944001 	ldmhi	r4, {r0, lr}
     d14:	00140000 	andseq	r0, r4, r0
     d18:	9c010000 	stcls	0, cr0, [r1], {-0}
     d1c:	00042108 	andeq	r2, r4, r8, lsl #2
     d20:	334e0100 	movtcc	r0, #57600	; 0xe100
     d24:	a8000000 	stmdage	r0, {}	; <UNPREDICTABLE>
     d28:	14000088 	strne	r0, [r0], #-136	; 0x88
     d2c:	01000000 	mrseq	r0, (UNDEF: 0)
     d30:	01ca079c 			; <UNDEFINED> instruction: 0x01ca079c
     d34:	58010000 	stmdapl	r1, {}	; <UNPREDICTABLE>
     d38:	000088bc 			; <UNDEFINED> instruction: 0x000088bc
     d3c:	00000014 	andeq	r0, r0, r4, lsl r0
     d40:	cc009c01 	stcgt	12, cr9, [r0], {1}
     d44:	04000001 	streq	r0, [r0], #-1
     d48:	0006db00 	andeq	sp, r6, r0, lsl #22
     d4c:	87010400 	strhi	r0, [r1, -r0, lsl #8]
     d50:	01000000 	mrseq	r0, (UNDEF: 0)
     d54:	00000456 	andeq	r0, r0, r6, asr r4
     d58:	00000028 	andeq	r0, r0, r8, lsr #32
     d5c:	000088d0 	ldrdeq	r8, [r0], -r0
     d60:	0000009c 	muleq	r0, ip, r0
     d64:	0000047f 	andeq	r0, r0, pc, ror r4
     d68:	17080102 	strne	r0, [r8, -r2, lsl #2]
     d6c:	02000001 	andeq	r0, r0, #1
     d70:	01550502 	cmpeq	r5, r2, lsl #10
     d74:	04030000 	streq	r0, [r3], #-0
     d78:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     d7c:	05080200 	streq	r0, [r8, #-512]	; 0x200
     d80:	00000000 	andeq	r0, r0, r0
     d84:	00010604 	andeq	r0, r1, r4, lsl #12
     d88:	4c160200 	lfmmi	f0, 4, [r6], {-0}
     d8c:	02000000 	andeq	r0, r0, #0
     d90:	010e0801 	tsteq	lr, r1, lsl #16
     d94:	cf040000 	svcgt	0x00040000
     d98:	02000002 	andeq	r0, r0, #2
     d9c:	00005e18 	andeq	r5, r0, r8, lsl lr
     da0:	07020200 	streq	r0, [r2, -r0, lsl #4]
     da4:	00000128 	andeq	r0, r0, r8, lsr #2
     da8:	5e070402 	cdppl	4, 0, cr0, cr7, cr2, {0}
     dac:	02000000 	andeq	r0, r0, #0
     db0:	00540708 	subseq	r0, r4, r8, lsl #14
     db4:	01050000 	mrseq	r0, (UNDEF: 5)
     db8:	01000002 	tsteq	r0, r2
     dbc:	0088d013 	addeq	sp, r8, r3, lsl r0
     dc0:	00001000 	andeq	r1, r0, r0
     dc4:	9a9c0100 	bls	fe7011cc <__user_program+0xfe4011cc>
     dc8:	06000000 	streq	r0, [r0], -r0
     dcc:	000088dc 	ldrdeq	r8, [r0], -ip
     dd0:	0000017e 	andeq	r0, r0, lr, ror r1
     dd4:	03500107 	cmpeq	r0, #-1073741823	; 0xc0000001
     dd8:	0005dc0a 	andeq	sp, r5, sl, lsl #24
     ddc:	02e60800 	rsceq	r0, r6, #0, 16
     de0:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
     de4:	00000053 	andeq	r0, r0, r3, asr r0
     de8:	000088e0 	andeq	r8, r0, r0, ror #17
     dec:	0000008c 	andeq	r0, r0, ip, lsl #1
     df0:	01679c01 	cmneq	r7, r1, lsl #24
     df4:	6b090000 	blvs	240dfc <__end+0x113dfc>
     df8:	01000004 	tsteq	r0, r4
     dfc:	0000411e 	andeq	r4, r0, lr, lsl r1
     e00:	00078b00 	andeq	r8, r7, r0, lsl #22
     e04:	04440a00 	strbeq	r0, [r4], #-2560	; 0xa00
     e08:	20010000 	andcs	r0, r1, r0
     e0c:	00000041 	andeq	r0, r0, r1, asr #32
     e10:	000007ac 	andeq	r0, r0, ip, lsr #15
     e14:	6e656c0b 	cdpvs	12, 6, cr6, cr5, cr11, {0}
     e18:	53320100 	teqpl	r2, #0, 2
     e1c:	cb000000 	blgt	e24 <__start-0x71dc>
     e20:	0c000007 	stceq	0, cr0, [r0], {7}
     e24:	00667562 	rsbeq	r7, r6, r2, ror #10
     e28:	01673301 	cmneq	r7, r1, lsl #6
     e2c:	91020000 	mrsls	r0, (UNDEF: 2)
     e30:	044f0a74 	strbeq	r0, [pc], #-2676	; e38 <__start-0x71c8>
     e34:	43010000 	movwmi	r0, #4096	; 0x1000
     e38:	00000053 	andeq	r0, r0, r3, asr r0
     e3c:	000007f7 	strdeq	r0, [r0], -r7
     e40:	00043d0a 	andeq	r3, r4, sl, lsl #26
     e44:	53440100 	movtpl	r0, #16640	; 0x4100
     e48:	11000000 	mrsne	r0, (UNDEF: 0)
     e4c:	0d000008 	stceq	0, cr0, [r0, #-32]	; 0xffffffe0
     e50:	00008928 	andeq	r8, r0, r8, lsr #18
     e54:	0000018f 	andeq	r0, r0, pc, lsl #3
     e58:	0000012b 	andeq	r0, r0, fp, lsr #2
     e5c:	02520107 	subseq	r0, r2, #-1073741823	; 0xc0000001
     e60:	01074908 	tsteq	r7, r8, lsl #18
     e64:	07330151 			; <UNDEFINED> instruction: 0x07330151
     e68:	91025001 	tstls	r2, r1
     e6c:	400d006c 	andmi	r0, sp, ip, rrx
     e70:	8f000089 	svchi	0x00000089
     e74:	4b000001 	blmi	e80 <__start-0x7180>
     e78:	07000001 	streq	r0, [r0, -r1]
     e7c:	08025201 	stmdaeq	r2, {r0, r9, ip, lr}
     e80:	51010749 	tstpl	r1, r9, asr #14
     e84:	07007402 	streq	r7, [r0, -r2, lsl #8]
     e88:	91025001 	tstls	r2, r1
     e8c:	5006006c 	andpl	r0, r6, ip, rrx
     e90:	b4000089 	strlt	r0, [r0], #-137	; 0x89
     e94:	07000001 	streq	r0, [r0, -r1]
     e98:	08025201 	stmdaeq	r2, {r0, r9, ip, lr}
     e9c:	51010749 	tstpl	r1, r9, asr #14
     ea0:	01073201 	tsteq	r7, r1, lsl #4
     ea4:	6c910250 	lfmvs	f0, 4, [r1], {80}	; 0x50
     ea8:	410e0000 	mrsmi	r0, (UNDEF: 14)
     eac:	77000000 	strvc	r0, [r0, -r0]
     eb0:	0f000001 	svceq	0x00000001
     eb4:	00000177 	andeq	r0, r0, r7, ror r1
     eb8:	04020002 	streq	r0, [r2], #-2
     ebc:	00036f07 	andeq	r6, r3, r7, lsl #30
     ec0:	03d51000 	bicseq	r1, r5, #0
     ec4:	1c030000 	stcne	0, cr0, [r3], {-0}
     ec8:	0000018f 	andeq	r0, r0, pc, lsl #3
     ecc:	00005311 	andeq	r5, r0, r1, lsl r3
     ed0:	e5120000 	ldr	r0, [r2, #-0]
     ed4:	03000003 	movweq	r0, #3
     ed8:	00004125 	andeq	r4, r0, r5, lsr #2
     edc:	0001ae00 	andeq	sl, r1, r0, lsl #28
     ee0:	01ae1100 			; <UNDEFINED> instruction: 0x01ae1100
     ee4:	53110000 	tstpl	r1, #0
     ee8:	11000000 	mrsne	r0, (UNDEF: 0)
     eec:	00000041 	andeq	r0, r0, r1, asr #32
     ef0:	41041300 	mrsmi	r1, LR_abt
     ef4:	14000000 	strne	r0, [r0], #-0
     ef8:	000003be 			; <UNDEFINED> instruction: 0x000003be
     efc:	00412e03 	subeq	r2, r1, r3, lsl #28
     f00:	ae110000 	cdpge	0, 1, cr0, cr1, cr0, {0}
     f04:	11000001 	tstne	r0, r1
     f08:	00000053 	andeq	r0, r0, r3, asr r0
     f0c:	00004111 	andeq	r4, r0, r1, lsl r1
     f10:	e0000000 	and	r0, r0, r0
     f14:	04000003 	streq	r0, [r0], #-3
     f18:	00080500 	andeq	r0, r8, r0, lsl #10
     f1c:	87010400 	strhi	r0, [r1, -r0, lsl #8]
     f20:	01000000 	mrseq	r0, (UNDEF: 0)
     f24:	00000473 	andeq	r0, r0, r3, ror r4
     f28:	00000028 	andeq	r0, r0, r8, lsr #32
     f2c:	0000896c 	andeq	r8, r0, ip, ror #18
     f30:	000001ac 	andeq	r0, r0, ip, lsr #3
     f34:	00000512 	andeq	r0, r0, r2, lsl r5
     f38:	17080102 	strne	r0, [r8, -r2, lsl #2]
     f3c:	02000001 	andeq	r0, r0, #1
     f40:	01550502 	cmpeq	r5, r2, lsl #10
     f44:	04030000 	streq	r0, [r3], #-0
     f48:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     f4c:	05080200 	streq	r0, [r8, #-512]	; 0x200
     f50:	00000000 	andeq	r0, r0, r0
     f54:	00010604 	andeq	r0, r1, r4, lsl #12
     f58:	4c160200 	lfmmi	f0, 4, [r6], {-0}
     f5c:	02000000 	andeq	r0, r0, #0
     f60:	010e0801 	tsteq	lr, r1, lsl #16
     f64:	cf040000 	svcgt	0x00040000
     f68:	02000002 	andeq	r0, r0, #2
     f6c:	00005e18 	andeq	r5, r0, r8, lsl lr
     f70:	07020200 	streq	r0, [r2, -r0, lsl #4]
     f74:	00000128 	andeq	r0, r0, r8, lsr #2
     f78:	5e070402 	cdppl	4, 0, cr0, cr7, cr2, {0}
     f7c:	02000000 	andeq	r0, r0, #0
     f80:	00540708 	subseq	r0, r4, r8, lsl #14
     f84:	c2050000 	andgt	r0, r5, #0
     f88:	01000002 	tsteq	r0, r2
     f8c:	00896c2a 	addeq	r6, r9, sl, lsr #24
     f90:	00001800 	andeq	r1, r0, r0, lsl #16
     f94:	b29c0100 	addslt	r0, ip, #0, 2
     f98:	06000000 	streq	r0, [r0], -r0
     f9c:	000004aa 	andeq	r0, r0, sl, lsr #9
     fa0:	00332a01 	eorseq	r2, r3, r1, lsl #20
     fa4:	082b0000 	stmdaeq	fp!, {}	; <UNPREDICTABLE>
     fa8:	80070000 	andhi	r0, r7, r0
     fac:	87000089 	strhi	r0, [r0, -r9, lsl #1]
     fb0:	08000003 	stmdaeq	r0, {r0, r1}
     fb4:	f3035101 	vrhadd.u8	d5, d3, d1
     fb8:	01085001 	tsteq	r8, r1
     fbc:	1c030550 	cfstr32ne	mvfx0, [r3], {80}	; 0x50
     fc0:	000000a0 	andeq	r0, r0, r0, lsr #1
     fc4:	02a70900 	adceq	r0, r7, #0, 18
     fc8:	3d010000 	stccc	0, cr0, [r1, #-0]
     fcc:	00000033 	andeq	r0, r0, r3, lsr r0
     fd0:	00008984 	andeq	r8, r0, r4, lsl #19
     fd4:	00000048 	andeq	r0, r0, r8, asr #32
     fd8:	010f9c01 	tsteq	pc, r1, lsl #24
     fdc:	ba060000 	blt	180fe4 <__end+0x53fe4>
     fe0:	01000004 	tsteq	r0, r4
     fe4:	0000333d 	andeq	r3, r0, sp, lsr r3
     fe8:	00085700 	andeq	r5, r8, r0, lsl #14
     fec:	74700a00 	ldrbtvc	r0, [r0], #-2560	; 0xa00
     ff0:	3d010072 	stccc	0, cr0, [r1, #-456]	; 0xfffffe38
     ff4:	0000010f 	andeq	r0, r0, pc, lsl #2
     ff8:	000008aa 	andeq	r0, r0, sl, lsr #17
     ffc:	6e656c0a 	cdpvs	12, 6, cr6, cr5, cr10, {0}
    1000:	333d0100 	teqcc	sp, #0, 2
    1004:	d6000000 	strle	r0, [r0], -r0
    1008:	0b000008 	bleq	1030 <__start-0x6fd0>
    100c:	45010069 	strmi	r0, [r1, #-105]	; 0x69
    1010:	00000033 	andeq	r0, r0, r3, lsr r0
    1014:	000008ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1018:	0089ac0c 	addeq	sl, r9, ip, lsl #24
    101c:	0003a800 	andeq	sl, r3, r0, lsl #16
    1020:	040d0000 	streq	r0, [sp], #-0
    1024:	00000025 	andeq	r0, r0, r5, lsr #32
    1028:	0001de09 	andeq	sp, r1, r9, lsl #28
    102c:	33550100 	cmpcc	r5, #0, 2
    1030:	cc000000 	stcgt	0, cr0, [r0], {-0}
    1034:	a0000089 	andge	r0, r0, r9, lsl #1
    1038:	01000000 	mrseq	r0, (UNDEF: 0)
    103c:	0001a49c 	muleq	r1, ip, r4
    1040:	04ba0600 	ldrteq	r0, [sl], #1536	; 0x600
    1044:	55010000 	strpl	r0, [r1, #-0]
    1048:	00000033 	andeq	r0, r0, r3, lsr r0
    104c:	00000953 	andeq	r0, r0, r3, asr r9
    1050:	7274700a 	rsbsvc	r7, r4, #10
    1054:	0f550100 	svceq	0x00550100
    1058:	8d000001 	stchi	0, cr0, [r0, #-4]
    105c:	0a000009 	beq	1088 <__start-0x6f78>
    1060:	006e656c 	rsbeq	r6, lr, ip, ror #10
    1064:	00335501 	eorseq	r5, r3, r1, lsl #10
    1068:	09c10000 	stmibeq	r1, {}^	; <UNPREDICTABLE>
    106c:	8e0e0000 	cdphi	0, 0, cr0, cr14, cr0, {0}
    1070:	01000004 	tsteq	r0, r4
    1074:	00003357 	andeq	r3, r0, r7, asr r3
    1078:	860f0000 	strhi	r0, [pc], -r0
    107c:	01000003 	tsteq	r0, r3
    1080:	00002558 	andeq	r2, r0, r8, asr r5
    1084:	0009f500 	andeq	pc, r9, r0, lsl #10
    1088:	89ec0c00 	stmibhi	ip!, {sl, fp}^
    108c:	03b90000 			; <UNDEFINED> instruction: 0x03b90000
    1090:	2c100000 	ldccs	0, cr0, [r0], {-0}
    1094:	a800008a 	stmdage	r0, {r1, r3, r7}
    1098:	93000003 	movwls	r0, #3
    109c:	08000001 	stmdaeq	r0, {r0}
    10a0:	74025001 	strvc	r5, [r2], #-1
    10a4:	44070000 	strmi	r0, [r7], #-0
    10a8:	a800008a 	stmdage	r0, {r1, r3, r7}
    10ac:	08000003 	stmdaeq	r0, {r0, r1}
    10b0:	74025001 	strvc	r5, [r2], #-1
    10b4:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    10b8:	000002ef 	andeq	r0, r0, pc, ror #5
    10bc:	00339601 	eorseq	r9, r3, r1, lsl #12
    10c0:	8a6c0000 	bhi	1b010c8 <__user_program+0x18010c8>
    10c4:	00240000 	eoreq	r0, r4, r0
    10c8:	9c010000 	stcls	0, cr0, [r1], {-0}
    10cc:	00000209 	andeq	r0, r0, r9, lsl #4
    10d0:	00041006 	andeq	r1, r4, r6
    10d4:	33960100 	orrscc	r0, r6, #0, 2
    10d8:	1e000000 	cdpne	0, 0, cr0, cr0, cr0, {0}
    10dc:	0600000a 	streq	r0, [r0], -sl
    10e0:	0000046b 	andeq	r0, r0, fp, ror #8
    10e4:	00419601 	subeq	r9, r1, r1, lsl #12
    10e8:	0a3f0000 	beq	fc10f0 <__user_program+0xcc10f0>
    10ec:	b1060000 	mrslt	r0, (UNDEF: 6)
    10f0:	01000004 	tsteq	r0, r4
    10f4:	00021496 	muleq	r2, r6, r4
    10f8:	000a6000 	andeq	r6, sl, r0
    10fc:	8a781000 	bhi	1e05104 <__user_program+0x1b05104>
    1100:	03c40000 	biceq	r0, r4, #0
    1104:	01ff0000 	mvnseq	r0, r0
    1108:	01080000 	mrseq	r0, (UNDEF: 8)
    110c:	01f30350 	mvnseq	r0, r0, asr r3
    1110:	880c0050 	stmdahi	ip, {r4, r6}
    1114:	d500008a 	strle	r0, [r0, #-138]	; 0x8a
    1118:	00000003 	andeq	r0, r0, r3
    111c:	00021411 	andeq	r1, r2, r1, lsl r4
    1120:	00531200 	subseq	r1, r3, r0, lsl #4
    1124:	0d000000 	stceq	0, cr0, [r0, #-0]
    1128:	00020904 	andeq	r0, r2, r4, lsl #18
    112c:	025c1300 	subseq	r1, ip, #0, 6
    1130:	a4010000 	strge	r0, [r1], #-0
    1134:	00000033 	andeq	r0, r0, r3, lsr r0
    1138:	00008a90 	muleq	r0, r0, sl
    113c:	00000010 	andeq	r0, r0, r0, lsl r0
    1140:	023d9c01 	eorseq	r9, sp, #256	; 0x100
    1144:	980c0000 	stmdals	ip, {}	; <UNPREDICTABLE>
    1148:	dc00008a 	stcle	0, cr0, [r0], {138}	; 0x8a
    114c:	00000003 	andeq	r0, r0, r3
    1150:	0002b509 	andeq	fp, r2, r9, lsl #10
    1154:	89ae0100 	stmibhi	lr!, {r8}
    1158:	a0000002 	andge	r0, r0, r2
    115c:	5800008a 	stmdapl	r0, {r1, r3, r7}
    1160:	01000000 	mrseq	r0, (UNDEF: 0)
    1164:	0002899c 	muleq	r2, ip, r9
    1168:	04890600 	streq	r0, [r9], #1536	; 0x600
    116c:	ae010000 	cdpge	0, 0, cr0, cr1, cr0, {0}
    1170:	00000033 	andeq	r0, r0, r3, lsr r0
    1174:	00000a7e 	andeq	r0, r0, lr, ror sl
    1178:	00049414 	andeq	r9, r4, r4, lsl r4
    117c:	25af0100 	strcs	r0, [pc, #256]!	; 1284 <__start-0x6d7c>
    1180:	14000000 	strne	r0, [r0], #-0
    1184:	0000049f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
    1188:	0025b001 	eoreq	fp, r5, r1
    118c:	bf150000 	svclt	0x00150000
    1190:	01000004 	tsteq	r0, r4
    1194:	00010fb1 			; <UNDEFINED> instruction: 0x00010fb1
    1198:	00530100 	subseq	r0, r3, r0, lsl #2
    119c:	a8090416 	stmdage	r9, {r1, r2, r4, sl}
    11a0:	01000001 	tsteq	r0, r1
    11a4:	000033c3 	andeq	r3, r0, r3, asr #7
    11a8:	008af800 	addeq	pc, sl, r0, lsl #16
    11ac:	00000800 	andeq	r0, r0, r0, lsl #16
    11b0:	b49c0100 	ldrlt	r0, [ip], #256	; 0x100
    11b4:	06000002 	streq	r0, [r0], -r2
    11b8:	000004ba 			; <UNDEFINED> instruction: 0x000004ba
    11bc:	0033c301 	eorseq	ip, r3, r1, lsl #6
    11c0:	0a9f0000 	beq	fe7c11c8 <__user_program+0xfe4c11c8>
    11c4:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    11c8:	0000024e 	andeq	r0, r0, lr, asr #4
    11cc:	0033c701 	eorseq	ip, r3, r1, lsl #14
    11d0:	8b000000 	blhi	11d8 <__start-0x6e28>
    11d4:	00080000 	andeq	r0, r8, r0
    11d8:	9c010000 	stcls	0, cr0, [r1], {-0}
    11dc:	000002e9 	andeq	r0, r0, r9, ror #5
    11e0:	0004ba06 	andeq	fp, r4, r6, lsl #20
    11e4:	33c70100 	biccc	r0, r7, #0, 2
    11e8:	c0000000 	andgt	r0, r0, r0
    11ec:	1700000a 	strne	r0, [r0, -sl]
    11f0:	01007473 	tsteq	r0, r3, ror r4
    11f4:	000289c7 	andeq	r8, r2, r7, asr #19
    11f8:	00510100 	subseq	r0, r1, r0, lsl #2
    11fc:	00028c09 	andeq	r8, r2, r9, lsl #24
    1200:	33cb0100 	biccc	r0, fp, #0, 2
    1204:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1208:	0800008b 	stmdaeq	r0, {r0, r1, r3, r7}
    120c:	01000000 	mrseq	r0, (UNDEF: 0)
    1210:	0003129c 	muleq	r3, ip, r2
    1214:	04ba0600 	ldrteq	r0, [sl], #1536	; 0x600
    1218:	cb010000 	blgt	41220 <__bss_end+0x35220>
    121c:	00000033 	andeq	r0, r0, r3, lsr r0
    1220:	00000ae1 	andeq	r0, r0, r1, ror #21
    1224:	02d80900 	sbcseq	r0, r8, #0, 18
    1228:	cf010000 	svcgt	0x00010000
    122c:	00000033 	andeq	r0, r0, r3, lsr r0
    1230:	00008b10 	andeq	r8, r0, r0, lsl fp
    1234:	00000008 	andeq	r0, r0, r8
    1238:	03559c01 	cmpeq	r5, #256	; 0x100
    123c:	ba060000 	blt	181244 <__end+0x54244>
    1240:	01000004 	tsteq	r0, r4
    1244:	000033cf 	andeq	r3, r0, pc, asr #7
    1248:	000b0200 	andeq	r0, fp, r0, lsl #4
    124c:	74701700 	ldrbtvc	r1, [r0], #-1792	; 0x700
    1250:	cf010072 	svcgt	0x00010072
    1254:	00000033 	andeq	r0, r0, r3, lsr r0
    1258:	64175101 	ldrvs	r5, [r7], #-257	; 0x101
    125c:	01007269 	tsteq	r0, r9, ror #4
    1260:	000033cf 	andeq	r3, r0, pc, asr #7
    1264:	00520100 	subseq	r0, r2, r0, lsl #2
    1268:	0004c418 	andeq	ip, r4, r8, lsl r4
    126c:	0f220100 	svceq	0x00220100
    1270:	05000001 	streq	r0, [r0, #-1]
    1274:	00b00003 	adcseq	r0, r0, r3
    1278:	020a1400 	andeq	r1, sl, #0, 8
    127c:	8b010000 	blhi	41284 <__bss_end+0x35284>
    1280:	00000214 	andeq	r0, r0, r4, lsl r2
    1284:	00049414 	andeq	r9, r4, r4, lsl r4
    1288:	25af0100 	strcs	r0, [pc, #256]!	; 1390 <__start-0x6c70>
    128c:	14000000 	strne	r0, [r0], #-0
    1290:	0000049f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
    1294:	0025b001 	eoreq	fp, r5, r1
    1298:	5f190000 	svcpl	0x00190000
    129c:	06000003 	streq	r0, [r0], -r3
    12a0:	00003313 	andeq	r3, r0, r3, lsl r3
    12a4:	00039d00 	andeq	r9, r3, r0, lsl #26
    12a8:	039d1200 	orrseq	r1, sp, #0, 4
    12ac:	001a0000 	andseq	r0, sl, r0
    12b0:	03a3040d 			; <UNDEFINED> instruction: 0x03a3040d
    12b4:	251b0000 	ldrcs	r0, [fp, #-0]
    12b8:	1c000000 	stcne	0, cr0, [r0], {-0}
    12bc:	00000334 	andeq	r0, r0, r4, lsr r3
    12c0:	03b92303 			; <UNDEFINED> instruction: 0x03b92303
    12c4:	41120000 	tstmi	r2, r0
    12c8:	00000000 	andeq	r0, r0, r0
    12cc:	00037d1d 	andeq	r7, r3, sp, lsl sp
    12d0:	412a0300 	teqmi	sl, r0, lsl #6
    12d4:	1c000000 	stcne	0, cr0, [r0], {-0}
    12d8:	00000415 	andeq	r0, r0, r5, lsl r4
    12dc:	03d51304 	bicseq	r1, r5, #4, 6	; 0x10000000
    12e0:	33120000 	tstcc	r2, #0
    12e4:	00000000 	andeq	r0, r0, r0
    12e8:	0002321e 	andeq	r3, r2, lr, lsl r2
    12ec:	1e2b0500 	cfsh64ne	mvdx0, mvdx11, #0
    12f0:	00000432 	andeq	r0, r0, r2, lsr r4
    12f4:	51001804 	tstpl	r0, r4, lsl #16
    12f8:	02000000 	andeq	r0, r0, #0
    12fc:	0009be00 	andeq	fp, r9, r0, lsl #28
    1300:	17010400 	strne	r0, [r1, -r0, lsl #8]
    1304:	00000006 	andeq	r0, r0, r6
    1308:	54000080 	strpl	r0, [r0], #-128	; 0x80
    130c:	33000080 	movwcc	r0, #128	; 0x80
    1310:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
    1314:	732f6b62 	teqvc	pc, #100352	; 0x18800
    1318:	622f6372 	eorvs	r6, pc, #-939524095	; 0xc8000001
    131c:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
    1320:	682f0053 	stmdavs	pc!, {r0, r1, r4, r6}	; <UNPREDICTABLE>
    1324:	2f656d6f 	svccs	0x00656d6f
    1328:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
    132c:	332f3934 	teqcc	pc, #52, 18	; 0xd0000
    1330:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
    1334:	632f3631 	teqvs	pc, #51380224	; 0x3100000
    1338:	0065646f 	rsbeq	r6, r5, pc, ror #8
    133c:	20554e47 	subscs	r4, r5, r7, asr #28
    1340:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    1344:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    1348:	80010030 	andhi	r0, r1, r0, lsr r0
    134c:	00000050 	andeq	r0, r0, r0, asr r0
    1350:	09d20002 	ldmibeq	r2, {r1}^
    1354:	01040000 	mrseq	r0, (UNDEF: 4)
    1358:	0000066f 	andeq	r0, r0, pc, ror #12
    135c:	00008b18 	andeq	r8, r0, r8, lsl fp
    1360:	00008b5c 	andeq	r8, r0, ip, asr fp
    1364:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
    1368:	2f6b6269 	svccs	0x006b6269
    136c:	2f637273 	svccs	0x00637273
    1370:	2e6d7261 	cdpcs	2, 6, cr7, cr13, cr1, {3}
    1374:	682f0053 	stmdavs	pc!, {r0, r1, r4, r6}	; <UNPREDICTABLE>
    1378:	2f656d6f 	svccs	0x00656d6f
    137c:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
    1380:	332f3934 	teqcc	pc, #52, 18	; 0xd0000
    1384:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
    1388:	632f3631 	teqvs	pc, #51380224	; 0x3100000
    138c:	0065646f 	rsbeq	r6, r5, pc, ror #8
    1390:	20554e47 	subscs	r4, r5, r7, asr #28
    1394:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    1398:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
    139c:	80010030 	andhi	r0, r1, r0, lsr r0
    13a0:	00000056 	andeq	r0, r0, r6, asr r0
    13a4:	09e60002 	stmibeq	r6!, {r1}^
    13a8:	01040000 	mrseq	r0, (UNDEF: 4)
    13ac:	000006c0 	andeq	r0, r0, r0, asr #13
    13b0:	00008b5c 	andeq	r8, r0, ip, asr fp
    13b4:	00008c5c 	andeq	r8, r0, ip, asr ip
    13b8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    13bc:	732f6c65 	teqvc	pc, #25856	; 0x6500
    13c0:	732f6372 	teqvc	pc, #-939524095	; 0xc8000001
    13c4:	72657075 	rsbvc	r7, r5, #117	; 0x75
    13c8:	6f736976 	svcvs	0x00736976
    13cc:	00532e72 	subseq	r2, r3, r2, ror lr
    13d0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 131c <__start-0x6ce4>
    13d4:	63652f65 	cmnvs	r5, #404	; 0x194
    13d8:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
    13dc:	3934332f 	ldmdbcc	r4!, {r0, r1, r2, r3, r5, r8, r9, ip, sp}
    13e0:	3631662d 	ldrtcc	r6, [r1], -sp, lsr #12
    13e4:	646f632f 	strbtvs	r6, [pc], #-815	; 13ec <__start-0x6c14>
    13e8:	4e470065 	cdpmi	0, 4, cr0, cr7, cr5, {3}
    13ec:	53412055 	movtpl	r2, #4181	; 0x1055
    13f0:	322e3220 	eorcc	r3, lr, #32, 4
    13f4:	00302e34 	eorseq	r2, r0, r4, lsr lr
    13f8:	Address 0x000013f8 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1930ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a187c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	01828906 	orreq	r8, r2, r6, lsl #18
  54:	31011101 	tstcc	r1, r1, lsl #2
  58:	00130113 	andseq	r0, r3, r3, lsl r1
  5c:	828a0700 	addhi	r0, sl, #0, 14
  60:	18020001 	stmdane	r2, {r0}
  64:	00184291 	mulseq	r8, r1, r2
  68:	82890800 	addhi	r0, r9, #0, 16
  6c:	01110101 	tsteq	r1, r1, lsl #2
  70:	00001331 	andeq	r1, r0, r1, lsr r3
  74:	3f012e09 	svccc	0x00012e09
  78:	3a0e0319 	bcc	380ce4 <__user_program+0x80ce4>
  7c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
  80:	01193c19 	tsteq	r9, r9, lsl ip
  84:	0a000013 	beq	d8 <__start-0x7f28>
  88:	13490005 	movtne	r0, #36869	; 0x9005
  8c:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
  90:	03193f01 	tsteq	r9, #1, 30
  94:	3b0b3a0e 	blcc	2ce8d4 <__end+0x1a18d4>
  98:	3c19270b 	ldccc	7, cr2, [r9], {11}
  9c:	00000019 	andeq	r0, r0, r9, lsl r0
  a0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
  a4:	030b130e 	movweq	r1, #45838	; 0xb30e
  a8:	110e1b0e 	tstne	lr, lr, lsl #22
  ac:	10061201 	andne	r1, r6, r1, lsl #4
  b0:	02000017 	andeq	r0, r0, #23
  b4:	0b0b0024 	bleq	2c014c <__end+0x19314c>
  b8:	0e030b3e 	vmoveq.16	d3[0], r0
  bc:	24030000 	strcs	r0, [r3], #-0
  c0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  c4:	0008030b 	andeq	r0, r8, fp, lsl #6
  c8:	00160400 	andseq	r0, r6, r0, lsl #8
  cc:	0b3a0e03 	bleq	e838e0 <__user_program+0xb838e0>
  d0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  d4:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  d8:	03193f01 	tsteq	r9, #1, 30
  dc:	3b0b3a0e 	blcc	2ce91c <__end+0x1a191c>
  e0:	1119270b 	tstne	r9, fp, lsl #14
  e4:	40061201 	andmi	r1, r6, r1, lsl #4
  e8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  ec:	00001301 	andeq	r1, r0, r1, lsl #6
  f0:	03000506 	movweq	r0, #1286	; 0x506
  f4:	3b0b3a08 	blcc	2ce91c <__end+0x1a191c>
  f8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  fc:	07000017 	smladeq	r0, r7, r0, r0
 100:	08030005 	stmdaeq	r3, {r0, r2}
 104:	0b3b0b3a 	bleq	ec2df4 <__user_program+0xbc2df4>
 108:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 10c:	34080000 	strcc	r0, [r8], #-0
 110:	3a080300 	bcc	200d18 <__end+0xd3d18>
 114:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 118:	00170213 	andseq	r0, r7, r3, lsl r2
 11c:	00340900 	eorseq	r0, r4, r0, lsl #18
 120:	0b3a0e03 	bleq	e83934 <__user_program+0xb83934>
 124:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 128:	00001702 	andeq	r1, r0, r2, lsl #14
 12c:	0300050a 	movweq	r0, #1290	; 0x50a
 130:	3b0b3a0e 	blcc	2ce970 <__end+0x1a1970>
 134:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 138:	0b000017 	bleq	19c <__start-0x7e64>
 13c:	01018289 	smlabbeq	r1, r9, r2, r8
 140:	13310111 	teqne	r1, #1073741828	; 0x40000004
 144:	00001301 	andeq	r1, r0, r1, lsl #6
 148:	01828a0c 	orreq	r8, r2, ip, lsl #20
 14c:	91180200 	tstls	r8, r0, lsl #4
 150:	00001842 	andeq	r1, r0, r2, asr #16
 154:	0182890d 	orreq	r8, r2, sp, lsl #18
 158:	31011101 	tstcc	r1, r1, lsl #2
 15c:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 160:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 164:	0b3b0b3a 	bleq	ec2e54 <__user_program+0xbc2e54>
 168:	061c1349 	ldreq	r1, [ip], -r9, asr #6
 16c:	260f0000 	strcs	r0, [pc], -r0
 170:	00134900 	andseq	r4, r3, r0, lsl #18
 174:	000f1000 	andeq	r1, pc, r0
 178:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 17c:	35110000 	ldrcc	r0, [r1, #-0]
 180:	00134900 	andseq	r4, r3, r0, lsl #18
 184:	012e1200 	teqeq	lr, r0, lsl #4
 188:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 18c:	0b3b0b3a 	bleq	ec2e7c <__user_program+0xbc2e7c>
 190:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 194:	05130000 	ldreq	r0, [r3, #-0]
 198:	00134900 	andseq	r4, r3, r0, lsl #18
 19c:	11010000 	mrsne	r0, (UNDEF: 1)
 1a0:	130e2501 	movwne	r2, #58625	; 0xe501
 1a4:	1b0e030b 	blne	380dd8 <__user_program+0x80dd8>
 1a8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 1ac:	00171006 	andseq	r1, r7, r6
 1b0:	00240200 	eoreq	r0, r4, r0, lsl #4
 1b4:	0b3e0b0b 	bleq	f82de8 <__user_program+0xc82de8>
 1b8:	00000e03 	andeq	r0, r0, r3, lsl #28
 1bc:	0b002403 	bleq	91d0 <__clzsi2+0xa8>
 1c0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 1c4:	04000008 	streq	r0, [r0], #-8
 1c8:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 1cc:	0b3b0b3a 	bleq	ec2ebc <__user_program+0xbc2ebc>
 1d0:	00001349 	andeq	r1, r0, r9, asr #6
 1d4:	3f012e05 	svccc	0x00012e05
 1d8:	3a0e0319 	bcc	380e44 <__user_program+0x80e44>
 1dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1e0:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 1e4:	97184006 	ldrls	r4, [r8, -r6]
 1e8:	13011942 	movwne	r1, #6466	; 0x1942
 1ec:	89060000 	stmdbhi	r6, {}	; <UNPREDICTABLE>
 1f0:	11000182 	smlabbne	r0, r2, r1, r0
 1f4:	00133101 	andseq	r3, r3, r1, lsl #2
 1f8:	82890700 	addhi	r0, r9, #0, 14
 1fc:	01110101 	tsteq	r1, r1, lsl #2
 200:	13011331 	movwne	r1, #4913	; 0x1331
 204:	8a080000 	bhi	20020c <__end+0xd320c>
 208:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 20c:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 210:	89090000 	stmdbhi	r9, {}	; <UNPREDICTABLE>
 214:	11000182 	smlabbne	r0, r2, r1, r0
 218:	18429301 	stmdane	r2, {r0, r8, r9, ip, pc}^
 21c:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 220:	03193f01 	tsteq	r9, #1, 30
 224:	3b0b3a0e 	blcc	2cea64 <__end+0x1a1a64>
 228:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 22c:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 230:	97184006 	ldrls	r4, [r8, -r6]
 234:	13011942 	movwne	r1, #6466	; 0x1942
 238:	050b0000 	streq	r0, [fp, #-0]
 23c:	3a0e0300 	bcc	380e44 <__user_program+0x80e44>
 240:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 244:	00170213 	andseq	r0, r7, r3, lsl r2
 248:	000f0c00 	andeq	r0, pc, r0, lsl #24
 24c:	00000b0b 	andeq	r0, r0, fp, lsl #22
 250:	0b000f0d 	bleq	3e8c <__start-0x4174>
 254:	0013490b 	andseq	r4, r3, fp, lsl #18
 258:	01150e00 	tsteq	r5, r0, lsl #28
 25c:	13011927 	movwne	r1, #6439	; 0x1927
 260:	050f0000 	streq	r0, [pc, #-0]	; 268 <__start-0x7d98>
 264:	00134900 	andseq	r4, r3, r0, lsl #18
 268:	00341000 	eorseq	r1, r4, r0
 26c:	0b3a0e03 	bleq	e83a80 <__user_program+0xb83a80>
 270:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 274:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 278:	2e110000 	cdpcs	0, 1, cr0, cr1, cr0, {0}
 27c:	03193f00 	tsteq	r9, #0, 30
 280:	3b0b3a0e 	blcc	2ceac0 <__end+0x1a1ac0>
 284:	3c19270b 	ldccc	7, cr2, [r9], {11}
 288:	12000019 	andne	r0, r0, #25
 28c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 290:	0b3a0e03 	bleq	e83aa4 <__user_program+0xb83aa4>
 294:	193c0b3b 	ldmdbne	ip!, {r0, r1, r3, r4, r5, r8, r9, fp}
 298:	00001301 	andeq	r1, r0, r1, lsl #6
 29c:	00001813 	andeq	r1, r0, r3, lsl r8
 2a0:	012e1400 	teqeq	lr, r0, lsl #8
 2a4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 2a8:	0b3b0b3a 	bleq	ec2f98 <__user_program+0xbc2f98>
 2ac:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 2b0:	00001301 	andeq	r1, r0, r1, lsl #6
 2b4:	3f012e15 	svccc	0x00012e15
 2b8:	3a0e0319 	bcc	380f24 <__user_program+0x80f24>
 2bc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2c0:	3c134919 	ldccc	9, cr4, [r3], {25}
 2c4:	00130119 	andseq	r0, r3, r9, lsl r1
 2c8:	012e1600 	teqeq	lr, r0, lsl #12
 2cc:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 2d0:	0b3b0b3a 	bleq	ec2fc0 <__user_program+0xbc2fc0>
 2d4:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 2d8:	00001301 	andeq	r1, r0, r1, lsl #6
 2dc:	3f012e17 	svccc	0x00012e17
 2e0:	3a0e0319 	bcc	380f4c <__user_program+0x80f4c>
 2e4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2e8:	00193c13 	andseq	r3, r9, r3, lsl ip
 2ec:	11010000 	mrsne	r0, (UNDEF: 1)
 2f0:	130e2501 	movwne	r2, #58625	; 0xe501
 2f4:	1b0e030b 	blne	380f28 <__user_program+0x80f28>
 2f8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 2fc:	00171006 	andseq	r1, r7, r6
 300:	00160200 	andseq	r0, r6, r0, lsl #4
 304:	0b3a0e03 	bleq	e83b18 <__user_program+0xb83b18>
 308:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 30c:	24030000 	strcs	r0, [r3], #-0
 310:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 314:	000e030b 	andeq	r0, lr, fp, lsl #6
 318:	00240400 	eoreq	r0, r4, r0, lsl #8
 31c:	0b3e0b0b 	bleq	f82f50 <__user_program+0xc82f50>
 320:	00000803 	andeq	r0, r0, r3, lsl #16
 324:	03011305 	movweq	r1, #4869	; 0x1305
 328:	3a0b0b0e 	bcc	2c2f68 <__end+0x195f68>
 32c:	010b3b0b 	tsteq	fp, fp, lsl #22
 330:	06000013 			; <UNDEFINED> instruction: 0x06000013
 334:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 338:	0b381349 	bleq	e05064 <__user_program+0xb05064>
 33c:	00001934 	andeq	r1, r0, r4, lsr r9
 340:	0b000f07 	bleq	3f64 <__start-0x409c>
 344:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 348:	0e03012e 	adfeqsp	f0, f3, #0.5
 34c:	0b3b0b3a 	bleq	ec303c <__user_program+0xbc303c>
 350:	01111927 	tsteq	r1, r7, lsr #18
 354:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 358:	01194296 			; <UNDEFINED> instruction: 0x01194296
 35c:	09000013 	stmdbeq	r0, {r0, r1, r4}
 360:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 364:	0b3b0b3a 	bleq	ec3054 <__user_program+0xbc3054>
 368:	17021349 	strne	r1, [r2, -r9, asr #6]
 36c:	050a0000 	streq	r0, [sl, #-0]
 370:	3a080300 	bcc	200f78 <__end+0xd3f78>
 374:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 378:	00170213 	andseq	r0, r7, r3, lsl r2
 37c:	00340b00 	eorseq	r0, r4, r0, lsl #22
 380:	0b3a0e03 	bleq	e83b94 <__user_program+0xb83b94>
 384:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 388:	00001702 	andeq	r1, r0, r2, lsl #14
 38c:	0300340c 	movweq	r3, #1036	; 0x40c
 390:	3b0b3a08 	blcc	2cebb8 <__end+0x1a1bb8>
 394:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 398:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 39c:	08030034 	stmdaeq	r3, {r2, r4, r5}
 3a0:	0b3b0b3a 	bleq	ec3090 <__user_program+0xbc3090>
 3a4:	17021349 	strne	r1, [r2, -r9, asr #6]
 3a8:	890e0000 	stmdbhi	lr, {}	; <UNPREDICTABLE>
 3ac:	11000182 	smlabbne	r0, r2, r1, r0
 3b0:	00133101 	andseq	r3, r3, r1, lsl #2
 3b4:	000f0f00 	andeq	r0, pc, r0, lsl #30
 3b8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 3bc:	01100000 	tsteq	r0, r0
 3c0:	01134901 	tsteq	r3, r1, lsl #18
 3c4:	11000013 	tstne	r0, r3, lsl r0
 3c8:	13490021 	movtne	r0, #36897	; 0x9021
 3cc:	00000b2f 	andeq	r0, r0, pc, lsr #22
 3d0:	3f012e12 	svccc	0x00012e12
 3d4:	3a0e0319 	bcc	381040 <__user_program+0x81040>
 3d8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3dc:	11134919 	tstne	r3, r9, lsl r9
 3e0:	40061201 	andmi	r1, r6, r1, lsl #4
 3e4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 3e8:	00001301 	andeq	r1, r0, r1, lsl #6
 3ec:	00001813 	andeq	r1, r0, r3, lsl r8
 3f0:	00341400 	eorseq	r1, r4, r0, lsl #8
 3f4:	0b3a0e03 	bleq	e83c08 <__user_program+0xb83c08>
 3f8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3fc:	00001802 	andeq	r1, r0, r2, lsl #16
 400:	55010b15 	strpl	r0, [r1, #-2837]	; 0xb15
 404:	00130117 	andseq	r0, r3, r7, lsl r1
 408:	82891600 	addhi	r1, r9, #0, 12
 40c:	01110101 	tsteq	r1, r1, lsl #2
 410:	00001331 	andeq	r1, r0, r1, lsr r3
 414:	01828a17 	orreq	r8, r2, r7, lsl sl
 418:	91180200 	tstls	r8, r0, lsl #4
 41c:	00001842 	andeq	r1, r0, r2, asr #16
 420:	11010b18 	tstne	r1, r8, lsl fp
 424:	01061201 	tsteq	r6, r1, lsl #4
 428:	19000013 	stmdbne	r0, {r0, r1, r4}
 42c:	01018289 	smlabbeq	r1, r9, r2, r8
 430:	13310111 	teqne	r1, #1073741828	; 0x40000004
 434:	00001301 	andeq	r1, r0, r1, lsl #6
 438:	4900261a 	stmdbmi	r0, {r1, r3, r4, r9, sl, sp}
 43c:	1b000013 	blne	490 <__start-0x7b70>
 440:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 444:	0b3a0e03 	bleq	e83c58 <__user_program+0xb83c58>
 448:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 44c:	0000193c 	andeq	r1, r0, ip, lsr r9
 450:	4900051c 	stmdbmi	r0, {r2, r3, r4, r8, sl}
 454:	00000013 	andeq	r0, r0, r3, lsl r0
 458:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 45c:	030b130e 	movweq	r1, #45838	; 0xb30e
 460:	110e1b0e 	tstne	lr, lr, lsl #22
 464:	10061201 	andne	r1, r6, r1, lsl #4
 468:	02000017 	andeq	r0, r0, #23
 46c:	0b0b0024 	bleq	2c0504 <__end+0x193504>
 470:	0e030b3e 	vmoveq.16	d3[0], r0
 474:	24030000 	strcs	r0, [r3], #-0
 478:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 47c:	0008030b 	andeq	r0, r8, fp, lsl #6
 480:	00160400 	andseq	r0, r6, r0, lsl #8
 484:	0b3a0e03 	bleq	e83c98 <__user_program+0xb83c98>
 488:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 48c:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 490:	03193f01 	tsteq	r9, #1, 30
 494:	3b0b3a0e 	blcc	2cecd4 <__end+0x1a1cd4>
 498:	1119270b 	tstne	r9, fp, lsl #14
 49c:	40061201 	andmi	r1, r6, r1, lsl #4
 4a0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 4a4:	00001301 	andeq	r1, r0, r1, lsl #6
 4a8:	01828906 	orreq	r8, r2, r6, lsl #18
 4ac:	31011101 	tstcc	r1, r1, lsl #2
 4b0:	00130113 	andseq	r0, r3, r3, lsl r1
 4b4:	828a0700 	addhi	r0, sl, #0, 14
 4b8:	18020001 	stmdane	r2, {r0}
 4bc:	00184291 	mulseq	r8, r1, r2
 4c0:	82890800 	addhi	r0, r9, #0, 16
 4c4:	01110101 	tsteq	r1, r1, lsl #2
 4c8:	00001331 	andeq	r1, r0, r1, lsr r3
 4cc:	3f002e09 	svccc	0x00002e09
 4d0:	3a0e0319 	bcc	38113c <__user_program+0x8113c>
 4d4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4d8:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 4dc:	97184006 	ldrls	r4, [r8, -r6]
 4e0:	00001942 	andeq	r1, r0, r2, asr #18
 4e4:	0300050a 	movweq	r0, #1290	; 0x50a
 4e8:	3b0b3a0e 	blcc	2ced28 <__end+0x1a1d28>
 4ec:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4f0:	0b000018 	bleq	558 <__start-0x7aa8>
 4f4:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 4f8:	0b3a0e03 	bleq	e83d0c <__user_program+0xb83d0c>
 4fc:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 500:	01111349 	tsteq	r1, r9, asr #6
 504:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 508:	00194297 	mulseq	r9, r7, r2
 50c:	012e0c00 	teqeq	lr, r0, lsl #24
 510:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 514:	0b3b0b3a 	bleq	ec3204 <__user_program+0xbc3204>
 518:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 51c:	00001301 	andeq	r1, r0, r1, lsl #6
 520:	4900050d 	stmdbmi	r0, {r0, r2, r3, r8, sl}
 524:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 528:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 52c:	0b3a0e03 	bleq	e83d40 <__user_program+0xb83d40>
 530:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 534:	0000193c 	andeq	r1, r0, ip, lsr r9
 538:	01110100 	tsteq	r1, r0, lsl #2
 53c:	0b130e25 	bleq	4c3dd8 <__user_program+0x1c3dd8>
 540:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 544:	06120111 			; <UNDEFINED> instruction: 0x06120111
 548:	00001710 	andeq	r1, r0, r0, lsl r7
 54c:	0b002402 	bleq	955c <__clzsi2+0x434>
 550:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 554:	0300000e 	movweq	r0, #14
 558:	0b0b0024 	bleq	2c05f0 <__end+0x1935f0>
 55c:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 560:	16040000 	strne	r0, [r4], -r0
 564:	3a0e0300 	bcc	38116c <__user_program+0x8116c>
 568:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 56c:	05000013 	streq	r0, [r0, #-19]
 570:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 574:	0b3a0e03 	bleq	e83d88 <__user_program+0xb83d88>
 578:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 57c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 580:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 584:	00130119 	andseq	r0, r3, r9, lsl r1
 588:	00050600 	andeq	r0, r5, r0, lsl #12
 58c:	0b3a0803 	bleq	e825a0 <__user_program+0xb825a0>
 590:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 594:	00001702 	andeq	r1, r0, r2, lsl #14
 598:	01828907 	orreq	r8, r2, r7, lsl #18
 59c:	31011101 	tstcc	r1, r1, lsl #2
 5a0:	00130113 	andseq	r0, r3, r3, lsl r1
 5a4:	828a0800 	addhi	r0, sl, #0, 16
 5a8:	18020001 	stmdane	r2, {r0}
 5ac:	00184291 	mulseq	r8, r1, r2
 5b0:	82890900 	addhi	r0, r9, #0, 18
 5b4:	01110101 	tsteq	r1, r1, lsl #2
 5b8:	00001331 	andeq	r1, r0, r1, lsr r3
 5bc:	3f012e0a 	svccc	0x00012e0a
 5c0:	3a0e0319 	bcc	38122c <__user_program+0x8122c>
 5c4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 5c8:	11134919 	tstne	r3, r9, lsl r9
 5cc:	40061201 	andmi	r1, r6, r1, lsl #4
 5d0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 5d4:	00001301 	andeq	r1, r0, r1, lsl #6
 5d8:	0300050b 	movweq	r0, #1291	; 0x50b
 5dc:	3b0b3a0e 	blcc	2cee1c <__end+0x1a1e1c>
 5e0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 5e4:	0c000017 	stceq	0, cr0, [r0], {23}
 5e8:	08030034 	stmdaeq	r3, {r2, r4, r5}
 5ec:	0b3b0b3a 	bleq	ec32dc <__user_program+0xbc32dc>
 5f0:	17021349 	strne	r1, [r2, -r9, asr #6]
 5f4:	340d0000 	strcc	r0, [sp], #-0
 5f8:	3a0e0300 	bcc	381200 <__user_program+0x81200>
 5fc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 600:	00170213 	andseq	r0, r7, r3, lsl r2
 604:	000f0e00 	andeq	r0, pc, r0, lsl #28
 608:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 60c:	050f0000 	streq	r0, [pc, #-0]	; 614 <__start-0x79ec>
 610:	3a080300 	bcc	201218 <__end+0xd4218>
 614:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 618:	00180213 	andseq	r0, r8, r3, lsl r2
 61c:	012e1000 	teqeq	lr, r0
 620:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 624:	0b3b0b3a 	bleq	ec3314 <__user_program+0xbc3314>
 628:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 62c:	00001301 	andeq	r1, r0, r1, lsl #6
 630:	49000511 	stmdbmi	r0, {r0, r4, r8, sl}
 634:	12000013 	andne	r0, r0, #19
 638:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 63c:	0b3a0e03 	bleq	e83e50 <__user_program+0xb83e50>
 640:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 644:	0000193c 	andeq	r1, r0, ip, lsr r9
 648:	01110100 	tsteq	r1, r0, lsl #2
 64c:	0b130e25 	bleq	4c3ee8 <__user_program+0x1c3ee8>
 650:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 654:	06120111 			; <UNDEFINED> instruction: 0x06120111
 658:	00001710 	andeq	r1, r0, r0, lsl r7
 65c:	0b002402 	bleq	966c <__clzsi2+0x544>
 660:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 664:	0300000e 	movweq	r0, #14
 668:	0b0b0024 	bleq	2c0700 <__end+0x193700>
 66c:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 670:	16040000 	strne	r0, [r4], -r0
 674:	3a0e0300 	bcc	38127c <__user_program+0x8127c>
 678:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 67c:	05000013 	streq	r0, [r0, #-19]
 680:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 684:	0b3a0e03 	bleq	e83e98 <__user_program+0xb83e98>
 688:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 68c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 690:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 694:	00130119 	andseq	r0, r3, r9, lsl r1
 698:	00050600 	andeq	r0, r5, r0, lsl #12
 69c:	0b3a0e03 	bleq	e83eb0 <__user_program+0xb83eb0>
 6a0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 6a4:	00001702 	andeq	r1, r0, r2, lsl #14
 6a8:	3f002e07 	svccc	0x00002e07
 6ac:	3a0e0319 	bcc	381318 <__user_program+0x81318>
 6b0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 6b4:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 6b8:	97184006 	ldrls	r4, [r8, -r6]
 6bc:	00001942 	andeq	r1, r0, r2, asr #18
 6c0:	3f002e08 	svccc	0x00002e08
 6c4:	3a0e0319 	bcc	381330 <__user_program+0x81330>
 6c8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 6cc:	11134919 	tstne	r3, r9, lsl r9
 6d0:	40061201 	andmi	r1, r6, r1, lsl #4
 6d4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 6d8:	01000000 	mrseq	r0, (UNDEF: 0)
 6dc:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 6e0:	0e030b13 	vmoveq.32	d3[0], r0
 6e4:	01110e1b 	tsteq	r1, fp, lsl lr
 6e8:	17100612 			; <UNDEFINED> instruction: 0x17100612
 6ec:	24020000 	strcs	r0, [r2], #-0
 6f0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 6f4:	000e030b 	andeq	r0, lr, fp, lsl #6
 6f8:	00240300 	eoreq	r0, r4, r0, lsl #6
 6fc:	0b3e0b0b 	bleq	f83330 <__user_program+0xc83330>
 700:	00000803 	andeq	r0, r0, r3, lsl #16
 704:	03001604 	movweq	r1, #1540	; 0x604
 708:	3b0b3a0e 	blcc	2cef48 <__end+0x1a1f48>
 70c:	0013490b 	andseq	r4, r3, fp, lsl #18
 710:	012e0500 	teqeq	lr, r0, lsl #10
 714:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 718:	0b3b0b3a 	bleq	ec3408 <__user_program+0xbc3408>
 71c:	01111927 	tsteq	r1, r7, lsr #18
 720:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 724:	01194297 			; <UNDEFINED> instruction: 0x01194297
 728:	06000013 			; <UNDEFINED> instruction: 0x06000013
 72c:	01018289 	smlabbeq	r1, r9, r2, r8
 730:	13310111 	teqne	r1, #1073741828	; 0x40000004
 734:	8a070000 	bhi	1c073c <__end+0x9373c>
 738:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 73c:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 740:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 744:	03193f01 	tsteq	r9, #1, 30
 748:	3b0b3a0e 	blcc	2cef88 <__end+0x1a1f88>
 74c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 750:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 754:	97184006 	ldrls	r4, [r8, -r6]
 758:	13011942 	movwne	r1, #6466	; 0x1942
 75c:	05090000 	streq	r0, [r9, #-0]
 760:	3a0e0300 	bcc	381368 <__user_program+0x81368>
 764:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 768:	00170213 	andseq	r0, r7, r3, lsl r2
 76c:	00340a00 	eorseq	r0, r4, r0, lsl #20
 770:	0b3a0e03 	bleq	e83f84 <__user_program+0xb83f84>
 774:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 778:	00001702 	andeq	r1, r0, r2, lsl #14
 77c:	0300340b 	movweq	r3, #1035	; 0x40b
 780:	3b0b3a08 	blcc	2cefa8 <__end+0x1a1fa8>
 784:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 788:	0c000017 	stceq	0, cr0, [r0], {23}
 78c:	08030034 	stmdaeq	r3, {r2, r4, r5}
 790:	0b3b0b3a 	bleq	ec3480 <__user_program+0xbc3480>
 794:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 798:	890d0000 	stmdbhi	sp, {}	; <UNPREDICTABLE>
 79c:	11010182 	smlabbne	r1, r2, r1, r0
 7a0:	01133101 	tsteq	r3, r1, lsl #2
 7a4:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 7a8:	13490101 	movtne	r0, #37121	; 0x9101
 7ac:	00001301 	andeq	r1, r0, r1, lsl #6
 7b0:	4900210f 	stmdbmi	r0, {r0, r1, r2, r3, r8, sp}
 7b4:	000b2f13 	andeq	r2, fp, r3, lsl pc
 7b8:	012e1000 	teqeq	lr, r0
 7bc:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 7c0:	0b3b0b3a 	bleq	ec34b0 <__user_program+0xbc34b0>
 7c4:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 7c8:	00001301 	andeq	r1, r0, r1, lsl #6
 7cc:	49000511 	stmdbmi	r0, {r0, r4, r8, sl}
 7d0:	12000013 	andne	r0, r0, #19
 7d4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 7d8:	0b3a0e03 	bleq	e83fec <__user_program+0xb83fec>
 7dc:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 7e0:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 7e4:	00001301 	andeq	r1, r0, r1, lsl #6
 7e8:	0b000f13 	bleq	443c <__start-0x3bc4>
 7ec:	0013490b 	andseq	r4, r3, fp, lsl #18
 7f0:	012e1400 	teqeq	lr, r0, lsl #8
 7f4:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 7f8:	0b3b0b3a 	bleq	ec34e8 <__user_program+0xbc34e8>
 7fc:	13491927 	movtne	r1, #39207	; 0x9927
 800:	0000193c 	andeq	r1, r0, ip, lsr r9
 804:	01110100 	tsteq	r1, r0, lsl #2
 808:	0b130e25 	bleq	4c40a4 <__user_program+0x1c40a4>
 80c:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 810:	06120111 			; <UNDEFINED> instruction: 0x06120111
 814:	00001710 	andeq	r1, r0, r0, lsl r7
 818:	0b002402 	bleq	9828 <__clzsi2+0x700>
 81c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 820:	0300000e 	movweq	r0, #14
 824:	0b0b0024 	bleq	2c08bc <__end+0x1938bc>
 828:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 82c:	16040000 	strne	r0, [r4], -r0
 830:	3a0e0300 	bcc	381438 <__user_program+0x81438>
 834:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 838:	05000013 	streq	r0, [r0, #-19]
 83c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 840:	0b3a0e03 	bleq	e84054 <__user_program+0xb84054>
 844:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 848:	06120111 			; <UNDEFINED> instruction: 0x06120111
 84c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 850:	00130119 	andseq	r0, r3, r9, lsl r1
 854:	00050600 	andeq	r0, r5, r0, lsl #12
 858:	0b3a0e03 	bleq	e8406c <__user_program+0xb8406c>
 85c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 860:	00001702 	andeq	r1, r0, r2, lsl #14
 864:	01828907 	orreq	r8, r2, r7, lsl #18
 868:	31011101 	tstcc	r1, r1, lsl #2
 86c:	08000013 	stmdaeq	r0, {r0, r1, r4}
 870:	0001828a 	andeq	r8, r1, sl, lsl #5
 874:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 878:	09000018 	stmdbeq	r0, {r3, r4}
 87c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 880:	0b3a0e03 	bleq	e84094 <__user_program+0xb84094>
 884:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 888:	01111349 	tsteq	r1, r9, asr #6
 88c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 890:	01194297 			; <UNDEFINED> instruction: 0x01194297
 894:	0a000013 	beq	8e8 <__start-0x7718>
 898:	08030005 	stmdaeq	r3, {r0, r2}
 89c:	0b3b0b3a 	bleq	ec358c <__user_program+0xbc358c>
 8a0:	17021349 	strne	r1, [r2, -r9, asr #6]
 8a4:	340b0000 	strcc	r0, [fp], #-0
 8a8:	3a080300 	bcc	2014b0 <__end+0xd44b0>
 8ac:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8b0:	00170213 	andseq	r0, r7, r3, lsl r2
 8b4:	82890c00 	addhi	r0, r9, #0, 24
 8b8:	01110001 	tsteq	r1, r1
 8bc:	00001331 	andeq	r1, r0, r1, lsr r3
 8c0:	0b000f0d 	bleq	44fc <__start-0x3b04>
 8c4:	0013490b 	andseq	r4, r3, fp, lsl #18
 8c8:	00340e00 	eorseq	r0, r4, r0, lsl #28
 8cc:	0b3a0e03 	bleq	e840e0 <__user_program+0xb840e0>
 8d0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 8d4:	00000b1c 	andeq	r0, r0, ip, lsl fp
 8d8:	0300340f 	movweq	r3, #1039	; 0x40f
 8dc:	3b0b3a0e 	blcc	2cf11c <__end+0x1a211c>
 8e0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 8e4:	10000017 	andne	r0, r0, r7, lsl r0
 8e8:	01018289 	smlabbeq	r1, r9, r2, r8
 8ec:	13310111 	teqne	r1, #1073741828	; 0x40000004
 8f0:	00001301 	andeq	r1, r0, r1, lsl #6
 8f4:	27011511 	smladcs	r1, r1, r5, r1
 8f8:	00130119 	andseq	r0, r3, r9, lsl r1
 8fc:	00051200 	andeq	r1, r5, r0, lsl #4
 900:	00001349 	andeq	r1, r0, r9, asr #6
 904:	3f012e13 	svccc	0x00012e13
 908:	3a0e0319 	bcc	381574 <__user_program+0x81574>
 90c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 910:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 914:	97184006 	ldrls	r4, [r8, -r6]
 918:	13011942 	movwne	r1, #6466	; 0x1942
 91c:	34140000 	ldrcc	r0, [r4], #-0
 920:	3a0e0300 	bcc	381528 <__user_program+0x81528>
 924:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 928:	3c193f13 	ldccc	15, cr3, [r9], {19}
 92c:	15000019 	strne	r0, [r0, #-25]
 930:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 934:	0b3b0b3a 	bleq	ec3624 <__user_program+0xbc3624>
 938:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 93c:	0f160000 	svceq	0x00160000
 940:	000b0b00 	andeq	r0, fp, r0, lsl #22
 944:	00051700 	andeq	r1, r5, r0, lsl #14
 948:	0b3a0803 	bleq	e8295c <__user_program+0xb8295c>
 94c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 950:	00001802 	andeq	r1, r0, r2, lsl #16
 954:	03003418 	movweq	r3, #1048	; 0x418
 958:	3b0b3a0e 	blcc	2cf198 <__end+0x1a2198>
 95c:	3f13490b 	svccc	0x0013490b
 960:	00180219 	andseq	r0, r8, r9, lsl r2
 964:	012e1900 	teqeq	lr, r0, lsl #18
 968:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 96c:	0b3b0b3a 	bleq	ec365c <__user_program+0xbc365c>
 970:	13491927 	movtne	r1, #39207	; 0x9927
 974:	1301193c 	movwne	r1, #6460	; 0x193c
 978:	181a0000 	ldmdane	sl, {}	; <UNPREDICTABLE>
 97c:	1b000000 	blne	984 <__start-0x767c>
 980:	13490026 	movtne	r0, #36902	; 0x9026
 984:	2e1c0000 	cdpcs	0, 1, cr0, cr12, cr0, {0}
 988:	03193f01 	tsteq	r9, #1, 30
 98c:	3b0b3a0e 	blcc	2cf1cc <__end+0x1a21cc>
 990:	3c19270b 	ldccc	7, cr2, [r9], {11}
 994:	00130119 	andseq	r0, r3, r9, lsl r1
 998:	002e1d00 	eoreq	r1, lr, r0, lsl #26
 99c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 9a0:	0b3b0b3a 	bleq	ec3690 <__user_program+0xbc3690>
 9a4:	13491927 	movtne	r1, #39207	; 0x9927
 9a8:	0000193c 	andeq	r1, r0, ip, lsr r9
 9ac:	3f002e1e 	svccc	0x00002e1e
 9b0:	3a0e0319 	bcc	38161c <__user_program+0x8161c>
 9b4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 9b8:	00193c19 	andseq	r3, r9, r9, lsl ip
 9bc:	11010000 	mrsne	r0, (UNDEF: 1)
 9c0:	11061000 	mrsne	r1, (UNDEF: 6)
 9c4:	03011201 	movweq	r1, #4609	; 0x1201
 9c8:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 9cc:	00051308 	andeq	r1, r5, r8, lsl #6
 9d0:	11010000 	mrsne	r0, (UNDEF: 1)
 9d4:	11061000 	mrsne	r1, (UNDEF: 6)
 9d8:	03011201 	movweq	r1, #4609	; 0x1201
 9dc:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 9e0:	00051308 	andeq	r1, r5, r8, lsl #6
 9e4:	11010000 	mrsne	r0, (UNDEF: 1)
 9e8:	11061000 	mrsne	r1, (UNDEF: 6)
 9ec:	03011201 	movweq	r1, #4609	; 0x1201
 9f0:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 9f4:	00051308 	andeq	r1, r5, r8, lsl #6
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000060 	andeq	r0, r0, r0, rrx
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01790002 	cmneq	r9, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000080b4 	strheq	r8, [r0], -r4
  34:	00000160 	andeq	r0, r0, r0, ror #2
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	032e0002 	teqeq	lr, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008214 	andeq	r8, r0, r4, lsl r2
  54:	00000120 	andeq	r0, r0, r0, lsr #2
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	06230002 	strteq	r0, [r3], -r2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008334 	andeq	r8, r0, r4, lsr r3
  74:	00000298 	muleq	r0, r8, r2
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	09170002 	ldmdbeq	r7, {r1}
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000085cc 	andeq	r8, r0, ip, asr #11
  94:	000000c0 	andeq	r0, r0, r0, asr #1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	0a6e0002 	beq	1b800b4 <__user_program+0x18800b4>
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	0000868c 	andeq	r8, r0, ip, lsl #13
  b4:	000001d4 	ldrdeq	r0, [r0], -r4
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0c7e0002 	ldcleq	0, cr0, [lr], #-8
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008860 	andeq	r8, r0, r0, ror #16
  d4:	00000070 	andeq	r0, r0, r0, ror r0
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0d430002 	stcleq	0, cr0, [r3, #-8]
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	000088d0 	ldrdeq	r8, [r0], -r0
  f4:	0000009c 	muleq	r0, ip, r0
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	0f130002 	svceq	0x00130002
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	0000896c 	andeq	r8, r0, ip, ror #18
 114:	000001ac 	andeq	r0, r0, ip, lsr #3
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	12f70002 	rscsne	r0, r7, #2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008000 	andeq	r8, r0, r0
 134:	00000054 	andeq	r0, r0, r4, asr r0
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	134c0002 	movtne	r0, #49154	; 0xc002
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	00008b18 	andeq	r8, r0, r8, lsl fp
 154:	00000044 	andeq	r0, r0, r4, asr #32
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	13a00002 	movne	r0, #2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00008b5c 	andeq	r8, r0, ip, asr fp
 174:	00000100 	andeq	r0, r0, r0, lsl #2
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000006f 	andeq	r0, r0, pc, rrx
   4:	00500002 	subseq	r0, r0, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	33010000 	movwcc	r0, #4096	; 0x1000
  1c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  20:	732f6b62 	teqvc	pc, #100352	; 0x18800
  24:	33006372 	movwcc	r6, #882	; 0x372
  28:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  2c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
  30:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  34:	00006564 	andeq	r6, r0, r4, ror #10
  38:	7364656c 	cmnvc	r4, #108, 10	; 0x1b000000
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	70670000 	rsbvc	r0, r7, r0
  44:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
  48:	00000200 	andeq	r0, r0, r0, lsl #4
  4c:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
  50:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
  54:	00020068 	andeq	r0, r2, r8, rrx
  58:	05000000 	streq	r0, [r0, #-0]
  5c:	00805402 	addeq	r5, r0, r2, lsl #8
  60:	01160300 	tsteq	r6, r0, lsl #6
  64:	2f86672f 	svccs	0x0086672f
  68:	2f6a2f6a 	svccs	0x006a2f6a
  6c:	06022f6a 	streq	r2, [r2], -sl, ror #30
  70:	82010100 	andhi	r0, r1, #0, 2
  74:	02000000 	andeq	r0, r0, #0
  78:	00004f00 	andeq	r4, r0, r0, lsl #30
  7c:	fb010200 	blx	40886 <__bss_end+0x34886>
  80:	01000d0e 	tsteq	r0, lr, lsl #26
  84:	00010101 	andeq	r0, r1, r1, lsl #2
  88:	00010000 	andeq	r0, r1, r0
  8c:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
  90:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
  94:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
  98:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
  9c:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
  a0:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
  a4:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
  a8:	67000065 	strvs	r0, [r0, -r5, rrx]
  ac:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
  b0:	00010063 	andeq	r0, r1, r3, rrx
  b4:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
  b8:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
  bc:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
  c0:	72610000 	rsbvc	r0, r1, #0
  c4:	00682e6d 	rsbeq	r2, r8, sp, ror #28
  c8:	00000002 	andeq	r0, r0, r2
  cc:	b4020500 	strlt	r0, [r2], #-1280	; 0x500
  d0:	03000080 	movweq	r0, #128	; 0x80
  d4:	130100d4 	movwne	r0, #4308	; 0x10d4
  d8:	8384a06a 	orrhi	sl, r4, #106	; 0x6a
  dc:	134e2f4b 	movtne	r2, #61259	; 0xef4b
  e0:	bfd84b4d 	svclt	0x00d84b4d
  e4:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  e8:	4f6513bf 	svcmi	0x006513bf
  ec:	bb4b4b67 	bllt	12d2e90 <__user_program+0xfd2e90>
  f0:	4b9f684b 	blmi	fe7da224 <__user_program+0xfe4da224>
  f4:	01000602 	tsteq	r0, r2, lsl #12
  f8:	0000dc01 	andeq	sp, r0, r1, lsl #24
  fc:	9f000200 	svcls	0x00000200
 100:	02000000 	andeq	r0, r0, #0
 104:	0d0efb01 	vstreq	d15, [lr, #-4]
 108:	01010100 	mrseq	r0, (UNDEF: 17)
 10c:	00000001 	andeq	r0, r0, r1
 110:	01000001 	tsteq	r0, r1
 114:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 118:	732f6c65 	teqvc	pc, #25856	; 0x6500
 11c:	33006372 	movwcc	r6, #882	; 0x372
 120:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 124:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 128:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 12c:	6b006564 	blvs	196c4 <__bss_end+0xd6c4>
 130:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 134:	6e692f6c 	cdpvs	15, 6, cr2, cr9, cr12, {3}
 138:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 13c:	6b000065 	blvs	2d8 <__start-0x7d28>
 140:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 144:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 148:	6b000001 	blvs	154 <__start-0x7eac>
 14c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 150:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 154:	00000200 	andeq	r0, r0, r0, lsl #4
 158:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 15c:	0300682e 	movweq	r6, #2094	; 0x82e
 160:	64610000 	strbtvs	r0, [r1], #-0
 164:	31303173 	teqcc	r0, r3, ror r1
 168:	00682e35 	rsbeq	r2, r8, r5, lsr lr
 16c:	61000003 	tstvs	r0, r3
 170:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
 174:	00000200 	andeq	r0, r0, r0, lsl #4
 178:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 17c:	00682e72 	rsbeq	r2, r8, r2, ror lr
 180:	73000003 	movwvc	r0, #3
 184:	61637379 	smcvs	14137	; 0x3739
 188:	2e736c6c 	cdpcs	12, 7, cr6, cr3, cr12, {3}
 18c:	00030068 	andeq	r0, r3, r8, rrx
 190:	70757300 	rsbsvc	r7, r5, r0, lsl #6
 194:	69767265 	ldmdbvs	r6!, {r0, r2, r5, r6, r9, ip, sp, lr}^
 198:	2e726f73 	mrccs	15, 3, r6, cr2, cr3, {3}
 19c:	00030068 	andeq	r0, r3, r8, rrx
 1a0:	05000000 	streq	r0, [r0, #-0]
 1a4:	00821402 	addeq	r1, r2, r2, lsl #8
 1a8:	011d0300 	tsteq	sp, r0, lsl #6
 1ac:	2f2f2f2f 	svccs	0x002f2f2f
 1b0:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 1b4:	0c033101 	stfeqs	f3, [r3], {1}
 1b8:	03bb2f2e 			; <UNDEFINED> instruction: 0x03bb2f2e
 1bc:	084b4a0e 	stmdaeq	fp, {r1, r2, r3, r9, fp, lr}^
 1c0:	69a16993 	stmibvs	r1!, {r0, r1, r4, r7, r8, fp, sp, lr}
 1c4:	a1a16985 			; <UNDEFINED> instruction: 0xa1a16985
 1c8:	034a1b03 	movteq	r1, #43779	; 0xab03
 1cc:	a1302e66 	teqge	r0, r6, ror #28
 1d0:	2f4a1503 	svccs	0x004a1503
 1d4:	01000202 	tsteq	r0, r2, lsl #4
 1d8:	0000e001 	andeq	lr, r0, r1
 1dc:	7b000200 	blvc	9e4 <__start-0x761c>
 1e0:	02000000 	andeq	r0, r0, #0
 1e4:	0d0efb01 	vstreq	d15, [lr, #-4]
 1e8:	01010100 	mrseq	r0, (UNDEF: 17)
 1ec:	00000001 	andeq	r0, r0, r1
 1f0:	01000001 	tsteq	r0, r1
 1f4:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1f8:	732f6c65 	teqvc	pc, #25856	; 0x6500
 1fc:	33006372 	movwcc	r6, #882	; 0x372
 200:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 204:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 208:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 20c:	6b006564 	blvs	197a4 <__bss_end+0xd7a4>
 210:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 214:	6e692f6c 	cdpvs	15, 6, cr2, cr9, cr12, {3}
 218:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 21c:	70000065 	andvc	r0, r0, r5, rrx
 220:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 224:	00632e6b 	rsbeq	r2, r3, fp, ror #28
 228:	6b000001 	blvs	234 <__start-0x7dcc>
 22c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 230:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 234:	00000200 	andeq	r0, r0, r0, lsl #4
 238:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 23c:	2e677261 	cdpcs	2, 6, cr7, cr7, cr1, {3}
 240:	00020068 	andeq	r0, r2, r8, rrx
 244:	75623c00 	strbvc	r3, [r2, #-3072]!	; 0xc00
 248:	2d746c69 	ldclcs	12, cr6, [r4, #-420]!	; 0xfffffe5c
 24c:	003e6e69 	eorseq	r6, lr, r9, ror #28
 250:	75000000 	strvc	r0, [r0, #-0]
 254:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 258:	00030068 	andeq	r0, r3, r8, rrx
 25c:	05000000 	streq	r0, [r0, #-0]
 260:	00833402 	addeq	r3, r3, r2, lsl #8
 264:	01200300 	teqeq	r0, r0, lsl #6
 268:	009c4d88 	addseq	r4, ip, r8, lsl #27
 26c:	4c010402 	cfstrsmi	mvf0, [r1], {2}
 270:	01040200 	mrseq	r0, R12_usr
 274:	04020033 	streq	r0, [r2], #-51	; 0x33
 278:	00590801 	subseq	r0, r9, r1, lsl #16
 27c:	d7010402 	strle	r0, [r1, -r2, lsl #8]
 280:	9b6a4b4d 	blls	1a92fbc <__user_program+0x1792fbc>
 284:	6949872d 	stmdbvs	r9, {r0, r2, r3, r5, r8, r9, sl, pc}^
 288:	2003854d 	andcs	r8, r3, sp, asr #10
 28c:	5c03514a 	stfpls	f5, [r3], {74}	; 0x4a
 290:	4b4b302e 	blmi	12cc350 <__user_program+0xfcc350>
 294:	152c0232 	strne	r0, [ip, #-562]!	; 0x232
 298:	a04b4b83 	subge	r4, fp, r3, lsl #23
 29c:	328367a4 	addcc	r6, r3, #164, 14	; 0x2900000
 2a0:	67338367 	ldrvs	r8, [r3, -r7, ror #6]!
 2a4:	67833283 	strvs	r3, [r3, r3, lsl #5]
 2a8:	4b678a2d 	blmi	19e2b64 <__user_program+0x16e2b64>
 2ac:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 2b0:	2e7fbf03 	cdpcs	15, 7, cr11, cr15, cr3, {0}
 2b4:	6600c603 	strvs	ip, [r0], -r3, lsl #12
 2b8:	01000802 	tsteq	r0, r2, lsl #16
 2bc:	00008501 	andeq	r8, r0, r1, lsl #10
 2c0:	4f000200 	svcmi	0x00000200
 2c4:	02000000 	andeq	r0, r0, #0
 2c8:	0d0efb01 	vstreq	d15, [lr, #-4]
 2cc:	01010100 	mrseq	r0, (UNDEF: 17)
 2d0:	00000001 	andeq	r0, r0, r1
 2d4:	01000001 	tsteq	r0, r1
 2d8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2dc:	732f6c65 	teqvc	pc, #25856	; 0x6500
 2e0:	33006372 	movwcc	r6, #882	; 0x372
 2e4:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 2e8:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 2ec:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 2f0:	00006564 	andeq	r6, r0, r4, ror #10
 2f4:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2f8:	0100632e 	tsteq	r0, lr, lsr #6
 2fc:	736b0000 	cmnvc	fp, #0
 300:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 304:	00682e74 	rsbeq	r2, r8, r4, ror lr
 308:	67000002 	strvs	r0, [r0, -r2]
 30c:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 310:	00020068 	andeq	r0, r2, r8, rrx
 314:	05000000 	streq	r0, [r0, #-0]
 318:	0085cc02 	addeq	ip, r5, r2, lsl #24
 31c:	01250300 	teqeq	r5, r0, lsl #6
 320:	69678530 	stmdbvs	r7!, {r4, r5, r8, sl, pc}^
 324:	4d4d6967 	stclmi	9, cr6, [sp, #-412]	; 0xfffffe64
 328:	0903156d 	stmdbeq	r3, {r0, r2, r3, r5, r6, r8, sl, ip}
 32c:	0200149e 	andeq	r1, r0, #-1644167168	; 0x9e000000
 330:	4a060104 	bmi	180748 <__end+0x53748>
 334:	148a6906 	strne	r6, [sl], #2310	; 0x906
 338:	01040200 	mrseq	r0, R12_usr
 33c:	68064a06 	stmdavs	r6, {r1, r2, r9, fp, lr}
 340:	00040267 	andeq	r0, r4, r7, ror #4
 344:	00c80101 	sbceq	r0, r8, r1, lsl #2
 348:	00020000 	andeq	r0, r2, r0
 34c:	0000004e 	andeq	r0, r0, lr, asr #32
 350:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 354:	0101000d 	tsteq	r1, sp
 358:	00000101 	andeq	r0, r0, r1, lsl #2
 35c:	00000100 	andeq	r0, r0, r0, lsl #2
 360:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 364:	2f6c656e 	svccs	0x006c656e
 368:	00637273 	rsbeq	r7, r3, r3, ror r2
 36c:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 370:	2f6b6269 	svccs	0x006b6269
 374:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 378:	00656475 	rsbeq	r6, r5, r5, ror r4
 37c:	63326900 	teqvs	r2, #0, 18
 380:	0100632e 	tsteq	r0, lr, lsr #6
 384:	736b0000 	cmnvc	fp, #0
 388:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 38c:	00682e74 	rsbeq	r2, r8, r4, ror lr
 390:	67000002 	strvs	r0, [r0, -r2]
 394:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 398:	00020068 	andeq	r0, r2, r8, rrx
 39c:	05000000 	streq	r0, [r0, #-0]
 3a0:	00868c02 	addeq	r8, r6, r2, lsl #24
 3a4:	01290300 	teqeq	r9, r0, lsl #6
 3a8:	6769674c 	strbvs	r6, [r9, -ip, asr #14]!
 3ac:	820b0369 	andhi	r0, fp, #-1543503871	; 0xa4000001
 3b0:	69a48514 	stmibvs	r4!, {r2, r4, r8, sl, pc}
 3b4:	0200a032 	andeq	sl, r0, #50	; 0x32
 3b8:	4a060304 	bmi	180fd0 <__end+0x53fd0>
 3bc:	03040200 	movweq	r0, #16896	; 0x4200
 3c0:	85504806 	ldrbhi	r4, [r0, #-2054]	; 0x806
 3c4:	01040200 	mrseq	r0, R12_usr
 3c8:	69064a06 	stmdbvs	r6, {r1, r2, r9, fp, lr}
 3cc:	4c2f4da1 	stcmi	13, cr4, [pc], #-644	; 150 <__start-0x7eb0>
 3d0:	5d034c2f 	stcpl	12, cr4, [r3, #-188]	; 0xffffff44
 3d4:	2e24034a 	cdpcs	3, 2, cr0, cr4, cr10, {2}
 3d8:	142e0a03 	strtne	r0, [lr], #-2563	; 0xa03
 3dc:	3169a485 	cmncc	r9, r5, lsl #9
 3e0:	0402004d 	streq	r0, [r2], #-77	; 0x4d
 3e4:	004a0601 	subeq	r0, sl, r1, lsl #12
 3e8:	06010402 	streq	r0, [r1], -r2, lsl #8
 3ec:	00666c03 	rsbeq	r6, r6, r3, lsl #24
 3f0:	03010402 	movweq	r0, #5122	; 0x1402
 3f4:	00a02e18 	adceq	r2, r0, r8, lsl lr
 3f8:	06030402 	streq	r0, [r3], -r2, lsl #8
 3fc:	0402004a 	streq	r0, [r2], #-74	; 0x4a
 400:	50480603 	subpl	r0, r8, r3, lsl #12
 404:	4c2f4da1 	stcmi	13, cr4, [pc], #-644	; 188 <__start-0x7e78>
 408:	5d034c2f 	stcpl	12, cr4, [r3, #-188]	; 0xffffff44
 40c:	0004024a 	andeq	r0, r4, sl, asr #4
 410:	00690101 	rsbeq	r0, r9, r1, lsl #2
 414:	00020000 	andeq	r0, r2, r0
 418:	00000046 	andeq	r0, r0, r6, asr #32
 41c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 420:	0101000d 	tsteq	r1, sp
 424:	00000101 	andeq	r0, r0, r1, lsl #2
 428:	00000100 	andeq	r0, r0, r0, lsl #2
 42c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 430:	2f6c656e 	svccs	0x006c656e
 434:	00637273 	rsbeq	r7, r3, r3, ror r2
 438:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 43c:	2f6b6269 	svccs	0x006b6269
 440:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 444:	00656475 	rsbeq	r6, r5, r5, ror r4
 448:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 44c:	632e7265 	teqvs	lr, #1342177286	; 0x50000006
 450:	00000100 	andeq	r0, r0, r0, lsl #2
 454:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 458:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 45c:	00020068 	andeq	r0, r2, r8, rrx
 460:	05000000 	streq	r0, [r0, #-0]
 464:	00886002 	addeq	r6, r8, r2
 468:	012f0300 	teqeq	pc, r0, lsl #6
 46c:	034d854c 	movteq	r8, #54604	; 0xd54c
 470:	03159e09 	tsteq	r5, #9, 28	; 0x90
 474:	67149e0b 	ldrvs	r9, [r4, -fp, lsl #28]
 478:	0a021351 	beq	851c4 <__bss_end+0x791c4>
 47c:	8f010100 	svchi	0x00010100
 480:	02000000 	andeq	r0, r0, #0
 484:	00006000 	andeq	r6, r0, r0
 488:	fb010200 	blx	40c92 <__bss_end+0x34c92>
 48c:	01000d0e 	tsteq	r0, lr, lsl #26
 490:	00010101 	andeq	r0, r1, r1, lsl #2
 494:	00010000 	andeq	r0, r1, r0
 498:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 49c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 4a0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 4a4:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 4a8:	6b62696c 	blvs	189aa60 <__user_program+0x159aa60>
 4ac:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 4b0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 4b4:	72656b00 	rsbvc	r6, r5, #0, 22
 4b8:	2f6c656e 	svccs	0x006c656e
 4bc:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 4c0:	00656475 	rsbeq	r6, r5, r5, ror r4
 4c4:	73646100 	cmnvc	r4, #0, 2
 4c8:	35313031 	ldrcc	r3, [r1, #-49]!	; 0x31
 4cc:	0100632e 	tsteq	r0, lr, lsr #6
 4d0:	736b0000 	cmnvc	fp, #0
 4d4:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 4d8:	00682e74 	rsbeq	r2, r8, r4, ror lr
 4dc:	69000002 	stmdbvs	r0, {r1}
 4e0:	682e6332 	stmdavs	lr!, {r1, r4, r5, r8, r9, sp, lr}
 4e4:	00000300 	andeq	r0, r0, r0, lsl #6
 4e8:	02050000 	andeq	r0, r5, #0
 4ec:	000088d0 	ldrdeq	r8, [r0], -r0
 4f0:	2f011303 	svccs	0x00011303
 4f4:	4e660a03 	vmulmi.f32	s1, s12, s6
 4f8:	2e7a036c 	cdpcs	3, 7, cr0, cr10, cr12, {3}
 4fc:	2e0e034d 	cdpcs	3, 0, cr0, cr14, cr13, {2}
 500:	864b2f4b 	strbhi	r2, [fp], -fp, asr #30
 504:	0387864b 	orreq	r8, r7, #78643200	; 0x4b00000
 508:	18038269 	stmdane	r3, {r0, r3, r5, r6, r9, pc}
 50c:	0004022e 	andeq	r0, r4, lr, lsr #4
 510:	01010101 	tsteq	r1, r1, lsl #2
 514:	00020000 	andeq	r0, r2, r0
 518:	00000082 	andeq	r0, r0, r2, lsl #1
 51c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 520:	0101000d 	tsteq	r1, sp
 524:	00000101 	andeq	r0, r0, r1, lsl #2
 528:	00000100 	andeq	r0, r0, r0, lsl #2
 52c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 530:	2f6c656e 	svccs	0x006c656e
 534:	00637273 	rsbeq	r7, r3, r3, ror r2
 538:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 53c:	2f6b6269 	svccs	0x006b6269
 540:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 544:	00656475 	rsbeq	r6, r5, r5, ror r4
 548:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 54c:	692f6c65 	stmdbvs	pc!, {r0, r2, r5, r6, sl, fp, sp, lr}	; <UNPREDICTABLE>
 550:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 554:	00006564 	andeq	r6, r0, r4, ror #10
 558:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 55c:	736c6c61 	cmnvc	ip, #24832	; 0x6100
 560:	0100632e 	tsteq	r0, lr, lsr #6
 564:	736b0000 	cmnvc	fp, #0
 568:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 56c:	00682e74 	rsbeq	r2, r8, r4, ror lr
 570:	75000002 	strvc	r0, [r0, #-2]
 574:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 578:	00030068 	andeq	r0, r3, r8, rrx
 57c:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 580:	682e7265 	stmdavs	lr!, {r0, r2, r5, r6, r9, ip, sp, lr}
 584:	00000300 	andeq	r0, r0, r0, lsl #6
 588:	2e6d7261 	cdpcs	2, 6, cr7, cr13, cr1, {3}
 58c:	00020068 	andeq	r0, r2, r8, rrx
 590:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 594:	2e6b746e 	cdpcs	4, 6, cr7, cr11, cr14, {3}
 598:	00030068 	andeq	r0, r3, r8, rrx
 59c:	05000000 	streq	r0, [r0, #-0]
 5a0:	00896c02 	addeq	r6, r9, r2, lsl #24
 5a4:	012a0300 	teqeq	sl, r0, lsl #6
 5a8:	0402004c 	streq	r0, [r2], #-76	; 0x4c
 5ac:	0e036901 	cdpeq	9, 0, cr6, cr3, cr1, {0}
 5b0:	0200142e 	andeq	r1, r0, #771751936	; 0x2e000000
 5b4:	03500104 	cmpeq	r0, #4, 2
 5b8:	02004a78 	andeq	r4, r0, #120, 20	; 0x78000
 5bc:	0a030304 	beq	c11d4 <__bss_end+0xb51d4>
 5c0:	04020082 	streq	r0, [r2], #-130	; 0x82
 5c4:	034f4803 	movteq	r4, #63491	; 0xf803
 5c8:	09034a77 	stmdbeq	r3, {r0, r1, r2, r4, r5, r6, r9, fp, lr}
 5cc:	4a0b034a 	bmi	2c12fc <__end+0x1942fc>
 5d0:	2c034517 	cfstr32cs	mvfx4, [r3], {23}
 5d4:	4a620366 	bmi	1881374 <__user_program+0x1581374>
 5d8:	0811034d 	ldmdaeq	r1, {r0, r2, r3, r6, r8, r9}
 5dc:	4b2f4c90 	blmi	bd3824 <__user_program+0x8d3824>
 5e0:	032f4c31 	teqeq	pc, #12544	; 0x3100
 5e4:	25032e60 	strcs	r2, [r3, #-3680]	; 0xe60
 5e8:	4a56034a 	bmi	1581318 <__user_program+0x1281318>
 5ec:	032e2b03 	teqeq	lr, #3072	; 0xc00
 5f0:	1e032e62 	cdpne	14, 0, cr2, cr3, cr2, {3}
 5f4:	2e0f032e 	cdpcs	3, 0, cr0, cr15, cr14, {1}
 5f8:	30672f4b 	rsbcc	r2, r7, fp, asr #30
 5fc:	2f4a0903 	svccs	0x004a0903
 600:	84175030 	ldrhi	r5, [r7], #-48	; 0x30
 604:	678867a1 	strvs	r6, [r8, r1, lsr #15]
 608:	14303429 	ldrtne	r3, [r0], #-1065	; 0x429
 60c:	144c144c 	strbne	r1, [ip], #-1100	; 0x44c
 610:	0402144c 	streq	r1, [r2], #-1100	; 0x44c
 614:	54010100 	strpl	r0, [r1], #-256	; 0x100
 618:	02000000 	andeq	r0, r0, #0
 61c:	00002900 	andeq	r2, r0, r0, lsl #18
 620:	fb010200 	blx	40e2a <__bss_end+0x34e2a>
 624:	01000d0e 	tsteq	r0, lr, lsl #26
 628:	00010101 	andeq	r0, r1, r1, lsl #2
 62c:	00010000 	andeq	r0, r1, r0
 630:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
 634:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 638:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 63c:	62000063 	andvs	r0, r0, #99	; 0x63
 640:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
 644:	00010053 	andeq	r0, r1, r3, asr r0
 648:	05000000 	streq	r0, [r0, #-0]
 64c:	00800002 	addeq	r0, r0, r2
 650:	011b0300 	tsteq	fp, r0, lsl #6
 654:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 658:	2f2f2f2f 	svccs	0x002f2f2f
 65c:	2f312f2f 	svccs	0x00312f2f
 660:	2f33312f 	svccs	0x0033312f
 664:	312e6903 	teqcc	lr, r3, lsl #18
 668:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 66c:	4d010100 	stfmis	f0, [r1, #-0]
 670:	02000000 	andeq	r0, r0, #0
 674:	00002800 	andeq	r2, r0, r0, lsl #16
 678:	fb010200 	blx	40e82 <__bss_end+0x34e82>
 67c:	01000d0e 	tsteq	r0, lr, lsl #26
 680:	00010101 	andeq	r0, r1, r1, lsl #2
 684:	00010000 	andeq	r0, r1, r0
 688:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
 68c:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 690:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 694:	61000063 	tstvs	r0, r3, rrx
 698:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 69c:	00000100 	andeq	r0, r0, r0, lsl #2
 6a0:	02050000 	andeq	r0, r5, #0
 6a4:	00008b18 	andeq	r8, r0, r8, lsl fp
 6a8:	2f011003 	svccs	0x00011003
 6ac:	332f332f 	teqcc	pc, #-1140850688	; 0xbc000000
 6b0:	2f2f332f 	svccs	0x002f332f
 6b4:	2f332f2f 	svccs	0x00332f2f
 6b8:	022f2f2f 	eoreq	r2, pc, #47, 30	; 0xbc
 6bc:	01010002 	tsteq	r1, r2
 6c0:	00000086 	andeq	r0, r0, r6, lsl #1
 6c4:	002e0002 	eoreq	r0, lr, r2
 6c8:	01020000 	mrseq	r0, (UNDEF: 2)
 6cc:	000d0efb 	strdeq	r0, [sp], -fp
 6d0:	01010101 	tsteq	r1, r1, lsl #2
 6d4:	01000000 	mrseq	r0, (UNDEF: 0)
 6d8:	6b010000 	blvs	406e0 <__bss_end+0x346e0>
 6dc:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 6e0:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 6e4:	73000063 	movwvc	r0, #99	; 0x63
 6e8:	72657075 	rsbvc	r7, r5, #117	; 0x75
 6ec:	6f736976 	svcvs	0x00736976
 6f0:	00532e72 	subseq	r2, r3, r2, ror lr
 6f4:	00000001 	andeq	r0, r0, r1
 6f8:	5c020500 	cfstr32pl	mvfx0, [r2], {-0}
 6fc:	0300008b 	movweq	r0, #139	; 0x8b
 700:	2f2f0115 	svccs	0x002f0115
 704:	2f2f2f2f 	svccs	0x002f2f2f
 708:	f215032f 	vcgt.s16	d0, d5, d31
 70c:	2f2f2f2f 	svccs	0x002f2f2f
 710:	2f2f2f2f 	svccs	0x002f2f2f
 714:	2f2f2f36 	svccs	0x002f2f36
 718:	312f2f2f 	teqcc	pc, pc, lsr #30
 71c:	32313030 	eorscc	r3, r1, #48	; 0x30
 720:	2f2f2f2f 	svccs	0x002f2f2f
 724:	2f2f312f 	svccs	0x002f312f
 728:	312f2f2f 	teqcc	pc, pc, lsr #30
 72c:	31313136 	teqcc	r1, r6, lsr r1
 730:	302e0903 	eorcc	r0, lr, r3, lsl #18
 734:	2f302f2f 	svccs	0x00302f2f
 738:	7fab032f 	svcvc	0x00ab032f
 73c:	2703322e 	strcs	r3, [r3, -lr, lsr #4]
 740:	2e29032e 	cdpcs	3, 2, cr0, cr9, cr14, {1}
 744:	0002022f 	andeq	r0, r2, pc, lsr #4
 748:	Address 0x00000748 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	656c0074 	strbvs	r0, [ip, #-116]!	; 0x74
  10:	6c635f64 	stclvs	15, cr5, [r3], #-400	; 0xfffffe70
  14:	72675f72 	rsbvc	r5, r7, #456	; 0x1c8
  18:	006e6565 	rsbeq	r6, lr, r5, ror #10
  1c:	5f64656c 	svcpl	0x0064656c
  20:	5f746573 	svcpl	0x00746573
  24:	00646572 	rsbeq	r6, r4, r2, ror r5
  28:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff74 <__user_program+0xffcfff74>
  2c:	63652f65 	cmnvs	r5, #404	; 0x194
  30:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
  34:	3934332f 	ldmdbcc	r4!, {r0, r1, r2, r3, r5, r8, r9, ip, sp}
  38:	3631662d 	ldrtcc	r6, [r1], -sp, lsr #12
  3c:	646f632f 	strbtvs	r6, [pc], #-815	; 44 <__start-0x7fbc>
  40:	70670065 	rsbvc	r0, r7, r5, rrx
  44:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  48:	6c007465 	cfstrsvs	mvf7, [r0], {101}	; 0x65
  4c:	695f6465 	ldmdbvs	pc, {r0, r2, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
  50:	0074696e 	rsbseq	r6, r4, lr, ror #18
  54:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
  58:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
  5c:	6e752067 	cdpvs	0, 7, cr2, cr5, cr7, {3}
  60:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
  64:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
  68:	6700746e 	strvs	r7, [r0, -lr, ror #8]
  6c:	5f6f6970 	svcpl	0x006f6970
  70:	00726c63 	rsbseq	r6, r2, r3, ror #24
  74:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
  78:	2f6b6269 	svccs	0x006b6269
  7c:	2f637273 	svccs	0x00637273
  80:	7364656c 	cmnvc	r4, #108, 10	; 0x1b000000
  84:	4700632e 	strmi	r6, [r0, -lr, lsr #6]
  88:	4320554e 	teqmi	r0, #327155712	; 0x13800000
  8c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  90:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  94:	30353130 	eorscc	r3, r5, r0, lsr r1
  98:	20393235 	eorscs	r3, r9, r5, lsr r2
  9c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  a0:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  a4:	415b2029 	cmpmi	fp, r9, lsr #32
  a8:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff35e <__user_program+0xffcff35e>
  ac:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  b0:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  b4:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  b8:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  bc:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  c0:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  c4:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  c8:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  cc:	205d3838 	subscs	r3, sp, r8, lsr r8
  d0:	6c666d2d 	stclvs	13, cr6, [r6], #-180	; 0xffffff4c
  d4:	2d74616f 	ldfcse	f6, [r4, #-444]!	; 0xfffffe44
  d8:	3d696261 	sfmcc	f6, 2, [r9, #-388]!	; 0xfffffe7c
  dc:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xf73
  e0:	616d2d20 	cmnvs	sp, r0, lsr #26
  e4:	3d686372 	stclcc	3, cr6, [r8, #-456]!	; 0xfffffe38
  e8:	766d7261 	strbtvc	r7, [sp], -r1, ror #4
  ec:	20612d37 	rsbcs	r2, r1, r7, lsr sp
  f0:	2d20672d 	stccs	7, cr6, [r0, #-180]!	; 0xffffff4c
  f4:	2d20314f 	stfcss	f3, [r0, #-316]!	; 0xfffffec4
  f8:	65726666 	ldrbvs	r6, [r2, #-1638]!	; 0x666
  fc:	61747365 	cmnvs	r4, r5, ror #6
 100:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 104:	69750067 	ldmdbvs	r5!, {r0, r1, r2, r5, r6}^
 108:	5f38746e 	svcpl	0x0038746e
 10c:	6e750074 	mrcvs	0, 3, r0, cr5, cr4, {3}
 110:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
 114:	63206465 	teqvs	r0, #1694498816	; 0x65000000
 118:	00726168 	rsbseq	r6, r2, r8, ror #2
 11c:	5f64656c 	svcpl	0x0064656c
 120:	5f726c63 	svcpl	0x00726c63
 124:	00646572 	rsbeq	r6, r4, r2, ror r5
 128:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 12c:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
 130:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
 134:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
 138:	6c00746e 	cfstrsvs	mvf7, [r0], {110}	; 0x6e
 13c:	735f6465 	cmpvc	pc, #1694498816	; 0x65000000
 140:	675f7465 	ldrbvs	r7, [pc, -r5, ror #8]
 144:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 148:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
 14c:	6f635f6f 	svcvs	0x00635f6f
 150:	6769666e 	strbvs	r6, [r9, -lr, ror #12]!
 154:	6f687300 	svcvs	0x00687300
 158:	69207472 	stmdbvs	r0!, {r1, r4, r5, r6, sl, ip, sp, lr}
 15c:	6700746e 	strvs	r7, [r0, -lr, ror #8]
 160:	5f6f6970 	svcpl	0x006f6970
 164:	5f746573 	svcpl	0x00746573
 168:	6c6c7570 	cfstr64vs	mvdx7, [ip], #-448	; 0xfffffe40
 16c:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 170:	5f323374 	svcpl	0x00323374
 174:	65640074 	strbvs	r0, [r4, #-116]!	; 0x74
 178:	5f79616c 	svcpl	0x0079616c
 17c:	6c637963 	stclvs	9, cr7, [r3], #-396	; 0xfffffe74
 180:	73007365 	movwvc	r7, #869	; 0x365
 184:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0x174
 188:	66666f00 	strbtvs	r6, [r6], -r0, lsl #30
 18c:	00746573 	rsbseq	r6, r4, r3, ror r5
 190:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 194:	2f6b6269 	svccs	0x006b6269
 198:	2f637273 	svccs	0x00637273
 19c:	6f697067 	svcvs	0x00697067
 1a0:	6700632e 	strvs	r6, [r0, -lr, lsr #6]
 1a4:	006f6970 	rsbeq	r6, pc, r0, ror r9	; <UNPREDICTABLE>
 1a8:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 1ac:	5f6c6c61 	svcpl	0x006c6c61
 1b0:	736f6c63 	cmnvc	pc, #25344	; 0x6300
 1b4:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 1b8:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 1bc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1c0:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
 1c4:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
 1c8:	69740063 	ldmdbvs	r4!, {r0, r1, r5, r6}^
 1cc:	5f72656d 	svcpl	0x0072656d
 1d0:	61656c63 	cmnvs	r5, r3, ror #24
 1d4:	65705f72 	ldrbvs	r5, [r0, #-3954]!	; 0xf72
 1d8:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 1dc:	79730067 	ldmdbvc	r3!, {r0, r1, r2, r5, r6}^
 1e0:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 1e4:	65725f6c 	ldrbvs	r5, [r2, #-3948]!	; 0xf6c
 1e8:	73006461 	movwvc	r6, #1121	; 0x461
 1ec:	6e5f6977 	mrcvs	9, 2, r6, cr15, cr7, {3}
 1f0:	73006d75 	movwvc	r6, #3445	; 0xd75
 1f4:	635f6977 	cmpvs	pc, #1949696	; 0x1dc000
 1f8:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
 1fc:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
 200:	63646100 	cmnvs	r4, #0, 2
 204:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 208:	61730074 	cmnvs	r3, r4, ror r0
 20c:	656c706d 	strbvs	r7, [ip, #-109]!	; 0x6d
 210:	006e665f 	rsbeq	r6, lr, pc, asr r6
 214:	5f717269 	svcpl	0x00717269
 218:	61685f63 	cmnvs	r8, r3, ror #30
 21c:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0x46e
 220:	6e650072 	mcrvs	0, 3, r0, cr5, cr2, {3}
 224:	5f726574 	svcpl	0x00726574
 228:	72657375 	rsbvc	r7, r5, #-738197503	; 0xd4000001
 22c:	646f6d5f 	strbtvs	r6, [pc], #-3423	; 234 <__start-0x7dcc>
 230:	6e650065 	cdpvs	0, 6, cr0, cr5, cr5, {3}
 234:	656c6261 	strbvs	r6, [ip, #-609]!	; 0x261
 238:	746e695f 	strbtvc	r6, [lr], #-2399	; 0x95f
 23c:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0x265
 240:	00737470 	rsbseq	r7, r3, r0, ror r4
 244:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 248:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 24c:	79730074 	ldmdbvc	r3!, {r2, r4, r5, r6}^
 250:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 254:	73665f6c 	cmnvc	r6, #108, 30	; 0x1b0
 258:	00746174 	rsbseq	r6, r4, r4, ror r1
 25c:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 260:	5f6c6c61 	svcpl	0x006c6c61
 264:	706d6173 	rsbvc	r6, sp, r3, ror r1
 268:	615f656c 	cmpvs	pc, ip, ror #10
 26c:	735f6364 	cmpvc	pc, #100, 6	; 0x90000001
 270:	00706f74 	rsbseq	r6, r0, r4, ror pc
 274:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xe69
 278:	5f6c6c61 	svcpl	0x006c6c61
 27c:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xe69
 280:	70757272 	rsbsvc	r7, r5, r2, ror r2
 284:	61745f74 	cmnvs	r4, r4, ror pc
 288:	00656c62 	rsbeq	r6, r5, r2, ror #24
 28c:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 290:	5f6c6c61 	svcpl	0x006c6c61
 294:	74617369 	strbtvc	r7, [r1], #-873	; 0x369
 298:	6b007974 	blvs	1e870 <__bss_end+0x12870>
 29c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 2a0:	616d5f6c 	cmnvs	sp, ip, ror #30
 2a4:	73006e69 	movwvc	r6, #3689	; 0xe69
 2a8:	61637379 	smcvs	14137	; 0x3739
 2ac:	775f6c6c 	ldrbvc	r6, [pc, -ip, ror #24]
 2b0:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0x972
 2b4:	73797300 	cmnvc	r9, #0, 6
 2b8:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 2bc:	7262735f 	rsbvc	r7, r2, #2080374785	; 0x7c000001
 2c0:	7973006b 	ldmdbvc	r3!, {r0, r1, r3, r5, r6}^
 2c4:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 2c8:	78655f6c 	stmdavc	r5!, {r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
 2cc:	75007469 	strvc	r7, [r0, #-1129]	; 0x469
 2d0:	31746e69 	cmncc	r4, r9, ror #28
 2d4:	00745f36 	rsbseq	r5, r4, r6, lsr pc
 2d8:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 2dc:	5f6c6c61 	svcpl	0x006c6c61
 2e0:	6565736c 	strbvs	r7, [r5, #-876]!	; 0x36c
 2e4:	6461006b 	strbtvs	r0, [r1], #-107	; 0x6b
 2e8:	65725f63 	ldrbvs	r5, [r2, #-3939]!	; 0xf63
 2ec:	73006461 	movwvc	r6, #1121	; 0x461
 2f0:	61637379 	smcvs	14137	; 0x3739
 2f4:	735f6c6c 	cmpvc	pc, #108, 24	; 0x6c00
 2f8:	6c706d61 	ldclvs	13, cr6, [r0], #-388	; 0xfffffe7c
 2fc:	64615f65 	strbtvs	r5, [r1], #-3941	; 0xf65
 300:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xf63
 304:	00747261 	rsbseq	r7, r4, r1, ror #4
 308:	73677261 	cmnvc	r7, #268435462	; 0x10000006
 30c:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 310:	5f343674 	svcpl	0x00343674
 314:	656b0074 	strbvs	r0, [fp, #-116]!	; 0x74
 318:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 31c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 320:	6972702f 	ldmdbvs	r2!, {r0, r1, r2, r3, r5, ip, sp, lr}^
 324:	2e6b746e 	cdpcs	4, 6, cr7, cr11, cr14, {3}
 328:	5f5f0063 	svcpl	0x005f0063
 32c:	6c5f6176 	ldfvse	f6, [pc], {118}	; 0x76
 330:	00747369 	rsbseq	r7, r4, r9, ror #6
 334:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 338:	7475705f 	ldrbtvc	r7, [r5], #-95	; 0x5f
 33c:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 340:	72700065 	rsbsvc	r0, r0, #101	; 0x65
 344:	6e746e69 	cdpvs	14, 7, cr6, cr4, cr9, {3}
 348:	006b6d75 	rsbeq	r6, fp, r5, ror sp
 34c:	69676964 	stmdbvs	r7!, {r2, r5, r6, r8, fp, sp, lr}^
 350:	70007374 	andvc	r7, r0, r4, ror r3
 354:	69666572 	stmdbvs	r6!, {r1, r4, r5, r6, r8, sl, sp, lr}^
 358:	61620078 	smcvs	8200	; 0x2008
 35c:	70006573 	andvc	r6, r0, r3, ror r5
 360:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 364:	7962006b 	stmdbvc	r2!, {r0, r1, r3, r5, r6}^
 368:	705f6574 	subsvc	r6, pc, r4, ror r5	; <UNPREDICTABLE>
 36c:	73007274 	movwvc	r7, #628	; 0x274
 370:	74657a69 	strbtvc	r7, [r5], #-2665	; 0xa69
 374:	00657079 	rsbeq	r7, r5, r9, ror r0
 378:	70615f5f 	rsbvc	r5, r1, pc, asr pc
 37c:	72617500 	rsbvc	r7, r1, #0, 10
 380:	65675f74 	strbvs	r5, [r7, #-3956]!	; 0xf74
 384:	79625f74 	stmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 388:	6b006574 	blvs	19960 <__bss_end+0xd960>
 38c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 390:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 394:	61752f63 	cmnvs	r5, r3, ror #30
 398:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 39c:	72617500 	rsbvc	r7, r1, #0, 10
 3a0:	6c635f74 	stclvs	15, cr5, [r3], #-464	; 0xfffffe30
 3a4:	0065736f 	rsbeq	r7, r5, pc, ror #6
 3a8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 3ac:	732f6c65 	teqvc	pc, #25856	; 0x6500
 3b0:	692f6372 	stmdbvs	pc!, {r1, r4, r5, r6, r8, r9, sp, lr}	; <UNPREDICTABLE>
 3b4:	632e6332 	teqvs	lr, #-939524096	; 0xc8000000
 3b8:	64646100 	strbtvs	r6, [r4], #-256	; 0x100
 3bc:	32690072 	rsbcc	r0, r9, #114	; 0x72
 3c0:	616d5f63 	cmnvs	sp, r3, ror #30
 3c4:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 3c8:	6165725f 	cmnvs	r5, pc, asr r2
 3cc:	65740064 	ldrbvs	r0, [r4, #-100]!	; 0x64
 3d0:	635f706d 	cmpvs	pc, #109	; 0x6d
 3d4:	63326900 	teqvs	r2, #0, 18
 3d8:	73616d5f 	cmnvc	r1, #6080	; 0x17c0
 3dc:	5f726574 	svcpl	0x00726574
 3e0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 3e4:	63326900 	teqvs	r2, #0, 18
 3e8:	73616d5f 	cmnvc	r1, #6080	; 0x17c0
 3ec:	5f726574 	svcpl	0x00726574
 3f0:	74697277 	strbtvc	r7, [r9], #-631	; 0x277
 3f4:	65740065 	ldrbvs	r0, [r4, #-101]!	; 0x65
 3f8:	735f706d 	cmpvc	pc, #109	; 0x6d
 3fc:	72656b00 	rsbvc	r6, r5, #0, 22
 400:	2f6c656e 	svccs	0x006c656e
 404:	2f637273 	svccs	0x00637273
 408:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 40c:	00632e72 	rsbeq	r2, r3, r2, ror lr
 410:	71657266 	cmnvc	r5, r6, ror #4
 414:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 418:	735f7265 	cmpvc	pc, #1342177286	; 0x50000006
 41c:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 420:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 424:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 428:	65705f73 	ldrbvs	r5, [r0, #-3955]!	; 0xf73
 42c:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 430:	69740067 	ldmdbvs	r4!, {r0, r1, r2, r5, r6}^
 434:	5f72656d 	svcpl	0x0072656d
 438:	706f7473 	rsbvc	r7, pc, r3, ror r4	; <UNPREDICTABLE>
 43c:	66756200 	ldrbtvs	r6, [r5], -r0, lsl #4
 440:	0042534c 	subeq	r5, r2, ip, asr #6
 444:	5f42534d 	svcpl	0x0042534d
 448:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
 44c:	62006769 	andvs	r6, r0, #27525120	; 0x1a40000
 450:	534d6675 	movtpl	r6, #54901	; 0xd675
 454:	656b0042 	strbvs	r0, [fp, #-66]!	; 0x42
 458:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 45c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 460:	7364612f 	cmnvc	r4, #-1073741813	; 0xc000000b
 464:	35313031 	ldrcc	r3, [r1, #-49]!	; 0x31
 468:	6300632e 	movwvs	r6, #814	; 0x32e
 46c:	6e6e6168 	powvsez	f6, f6, #0.0
 470:	6b006c65 	blvs	1b60c <__bss_end+0xf60c>
 474:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 478:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 47c:	79732f63 	ldmdbvc	r3!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 480:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 484:	632e736c 	teqvs	lr, #108, 6	; 0xb0000001
 488:	636e6900 	cmnvs	lr, #0, 18
 48c:	6f630072 	svcvs	0x00630072
 490:	00746e75 	rsbseq	r6, r4, r5, ror lr
 494:	65685f5f 	strbvs	r5, [r8, #-3935]!	; 0xf5f
 498:	6c5f7061 	mrrcvs	0, 6, r7, pc, cr1	; <UNPREDICTABLE>
 49c:	5f00776f 	svcpl	0x0000776f
 4a0:	6165685f 	cmnvs	r5, pc, asr r8
 4a4:	6f745f70 	svcvs	0x00745f70
 4a8:	74730070 	ldrbtvc	r0, [r3], #-112	; 0x70
 4ac:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
 4b0:	6c616300 	stclvs	3, cr6, [r1], #-0
 4b4:	6361626c 	cmnvs	r1, #108, 4	; 0xc0000006
 4b8:	6966006b 	stmdbvs	r6!, {r0, r1, r3, r5, r6}^
 4bc:	7000656c 	andvc	r6, r0, ip, ror #10
 4c0:	5f766572 	svcpl	0x00766572
 4c4:	70616568 	rsbvc	r6, r1, r8, ror #10
 4c8:	646e655f 	strbtvs	r6, [lr], #-1375	; 0x55f
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__user_program+0xdd0d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  30:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  34:	30353130 	eorscc	r3, r5, r0, lsr r1
  38:	20393235 	eorscs	r3, r9, r5, lsr r2
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <__user_program+0xffcff2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  6c:	005d3838 	subseq	r3, sp, r8, lsr r8

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end+0x3a038>
  28:	22011e01 	andcs	r1, r1, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000014 	andeq	r0, r0, r4, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000020 	andeq	r0, r0, r0, lsr #32
  20:	83080e42 	movwhi	r0, #36418	; 0x8e42
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	00000014 	andeq	r0, r0, r4, lsl r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008074 	andeq	r8, r0, r4, ror r0
  34:	00000010 	andeq	r0, r0, r0, lsl r0
  38:	83080e42 	movwhi	r0, #36418	; 0x8e42
  3c:	00018e02 	andeq	r8, r1, r2, lsl #28
  40:	00000014 	andeq	r0, r0, r4, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008084 	andeq	r8, r0, r4, lsl #1
  4c:	00000010 	andeq	r0, r0, r0, lsl r0
  50:	83080e42 	movwhi	r0, #36418	; 0x8e42
  54:	00018e02 	andeq	r8, r1, r2, lsl #28
  58:	00000014 	andeq	r0, r0, r4, lsl r0
  5c:	00000000 	andeq	r0, r0, r0
  60:	00008094 	muleq	r0, r4, r0
  64:	00000010 	andeq	r0, r0, r0, lsl r0
  68:	83080e42 	movwhi	r0, #36418	; 0x8e42
  6c:	00018e02 	andeq	r8, r1, r2, lsl #28
  70:	00000014 	andeq	r0, r0, r4, lsl r0
  74:	00000000 	andeq	r0, r0, r0
  78:	000080a4 	andeq	r8, r0, r4, lsr #1
  7c:	00000010 	andeq	r0, r0, r0, lsl r0
  80:	83080e42 	movwhi	r0, #36418	; 0x8e42
  84:	00018e02 	andeq	r8, r1, r2, lsl #28
  88:	0000000c 	andeq	r0, r0, ip
  8c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  90:	7c020001 	stcvc	0, cr0, [r2], {1}
  94:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  98:	0000000c 	andeq	r0, r0, ip
  9c:	00000088 	andeq	r0, r0, r8, lsl #1
  a0:	000080b4 	strheq	r8, [r0], -r4
  a4:	00000054 	andeq	r0, r0, r4, asr r0
  a8:	0000000c 	andeq	r0, r0, ip
  ac:	00000088 	andeq	r0, r0, r8, lsl #1
  b0:	00008108 	andeq	r8, r0, r8, lsl #2
  b4:	00000044 	andeq	r0, r0, r4, asr #32
  b8:	0000000c 	andeq	r0, r0, ip
  bc:	00000088 	andeq	r0, r0, r8, lsl #1
  c0:	0000814c 	andeq	r8, r0, ip, asr #2
  c4:	00000044 	andeq	r0, r0, r4, asr #32
  c8:	00000018 	andeq	r0, r0, r8, lsl r0
  cc:	00000088 	andeq	r0, r0, r8, lsl #1
  d0:	00008190 	muleq	r0, r0, r1
  d4:	00000084 	andeq	r0, r0, r4, lsl #1
  d8:	83100e48 	tsthi	r0, #72, 28	; 0x480
  dc:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  e0:	00018e02 	andeq	r8, r1, r2, lsl #28
  e4:	0000000c 	andeq	r0, r0, ip
  e8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  ec:	7c020001 	stcvc	0, cr0, [r2], {1}
  f0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  f4:	00000014 	andeq	r0, r0, r4, lsl r0
  f8:	000000e4 	andeq	r0, r0, r4, ror #1
  fc:	00008214 	andeq	r8, r0, r4, lsl r2
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	83080e42 	movwhi	r0, #36418	; 0x8e42
 108:	00018e02 	andeq	r8, r1, r2, lsl #28
 10c:	00000014 	andeq	r0, r0, r4, lsl r0
 110:	000000e4 	andeq	r0, r0, r4, ror #1
 114:	00008230 	andeq	r8, r0, r0, lsr r2
 118:	00000024 	andeq	r0, r0, r4, lsr #32
 11c:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 120:	00018e02 	andeq	r8, r1, r2, lsl #28
 124:	00000014 	andeq	r0, r0, r4, lsl r0
 128:	000000e4 	andeq	r0, r0, r4, ror #1
 12c:	00008254 	andeq	r8, r0, r4, asr r2
 130:	000000e0 	andeq	r0, r0, r0, ror #1
 134:	83080e42 	movwhi	r0, #36418	; 0x8e42
 138:	00018e02 	andeq	r8, r1, r2, lsl #28
 13c:	0000000c 	andeq	r0, r0, ip
 140:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 144:	7c020001 	stcvc	0, cr0, [r2], {1}
 148:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 14c:	00000028 	andeq	r0, r0, r8, lsr #32
 150:	0000013c 	andeq	r0, r0, ip, lsr r1
 154:	00008334 	andeq	r8, r0, r4, lsr r3
 158:	000000e0 	andeq	r0, r0, r0, ror #1
 15c:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 160:	86078508 	strhi	r8, [r7], -r8, lsl #10
 164:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 168:	8a038904 	bhi	e2580 <__bss_end+0xd6580>
 16c:	42018e02 	andmi	r8, r1, #2, 28
 170:	6a02280e 	bvs	8a1b0 <__bss_end+0x7e1b0>
 174:	0000200e 	andeq	r2, r0, lr
 178:	00000040 	andeq	r0, r0, r0, asr #32
 17c:	0000013c 	andeq	r0, r0, ip, lsr r1
 180:	00008414 	andeq	r8, r0, r4, lsl r4
 184:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 188:	80100e42 	andshi	r0, r0, r2, asr #28
 18c:	82038104 	andhi	r8, r3, #4, 2
 190:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
 194:	0a84280e 	beq	fe10a1d4 <__user_program+0xfde0a1d4>
 198:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
 19c:	06880787 	streq	r0, [r8], r7, lsl #15
 1a0:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
 1a4:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
 1a8:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
 1ac:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 1b0:	c342100e 	movtgt	r1, #8206	; 0x200e
 1b4:	0ec0c1c2 	acseqdm	f4, f2
 1b8:	00000000 	andeq	r0, r0, r0
 1bc:	0000000c 	andeq	r0, r0, ip
 1c0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1c4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1c8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1cc:	00000014 	andeq	r0, r0, r4, lsl r0
 1d0:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
 1d4:	000085cc 	andeq	r8, r0, ip, asr #11
 1d8:	00000060 	andeq	r0, r0, r0, rrx
 1dc:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 1e0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1e4:	0000000c 	andeq	r0, r0, ip
 1e8:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
 1ec:	0000862c 	andeq	r8, r0, ip, lsr #12
 1f0:	00000014 	andeq	r0, r0, r4, lsl r0
 1f4:	0000000c 	andeq	r0, r0, ip
 1f8:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
 1fc:	00008640 	andeq	r8, r0, r0, asr #12
 200:	00000024 	andeq	r0, r0, r4, lsr #32
 204:	0000000c 	andeq	r0, r0, ip
 208:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
 20c:	00008664 	andeq	r8, r0, r4, ror #12
 210:	00000028 	andeq	r0, r0, r8, lsr #32
 214:	0000000c 	andeq	r0, r0, ip
 218:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 21c:	7c020001 	stcvc	0, cr0, [r2], {1}
 220:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 224:	00000014 	andeq	r0, r0, r4, lsl r0
 228:	00000214 	andeq	r0, r0, r4, lsl r2
 22c:	0000868c 	andeq	r8, r0, ip, lsl #13
 230:	00000048 	andeq	r0, r0, r8, asr #32
 234:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 238:	00018e02 	andeq	r8, r1, r2, lsl #28
 23c:	0000000c 	andeq	r0, r0, ip
 240:	00000214 	andeq	r0, r0, r4, lsl r2
 244:	000086d4 	ldrdeq	r8, [r0], -r4
 248:	000000c8 	andeq	r0, r0, r8, asr #1
 24c:	00000018 	andeq	r0, r0, r8, lsl r0
 250:	00000214 	andeq	r0, r0, r4, lsl r2
 254:	0000879c 	muleq	r0, ip, r7
 258:	000000c4 	andeq	r0, r0, r4, asr #1
 25c:	8e040e6a 	cdphi	14, 0, cr0, cr4, cr10, {3}
 260:	000e7401 	andeq	r7, lr, r1, lsl #8
 264:	000000ce 	andeq	r0, r0, lr, asr #1
 268:	0000000c 	andeq	r0, r0, ip
 26c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 270:	7c020001 	stcvc	0, cr0, [r2], {1}
 274:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 278:	00000014 	andeq	r0, r0, r4, lsl r0
 27c:	00000268 	andeq	r0, r0, r8, ror #4
 280:	00008860 	andeq	r8, r0, r0, ror #16
 284:	00000034 	andeq	r0, r0, r4, lsr r0
 288:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 28c:	00018e02 	andeq	r8, r1, r2, lsl #28
 290:	0000000c 	andeq	r0, r0, ip
 294:	00000268 	andeq	r0, r0, r8, ror #4
 298:	00008894 	muleq	r0, r4, r8
 29c:	00000014 	andeq	r0, r0, r4, lsl r0
 2a0:	0000000c 	andeq	r0, r0, ip
 2a4:	00000268 	andeq	r0, r0, r8, ror #4
 2a8:	000088a8 	andeq	r8, r0, r8, lsr #17
 2ac:	00000014 	andeq	r0, r0, r4, lsl r0
 2b0:	0000000c 	andeq	r0, r0, ip
 2b4:	00000268 	andeq	r0, r0, r8, ror #4
 2b8:	000088bc 			; <UNDEFINED> instruction: 0x000088bc
 2bc:	00000014 	andeq	r0, r0, r4, lsl r0
 2c0:	0000000c 	andeq	r0, r0, ip
 2c4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2c8:	7c020001 	stcvc	0, cr0, [r2], {1}
 2cc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2d0:	00000014 	andeq	r0, r0, r4, lsl r0
 2d4:	000002c0 	andeq	r0, r0, r0, asr #5
 2d8:	000088d0 	ldrdeq	r8, [r0], -r0
 2dc:	00000010 	andeq	r0, r0, r0, lsl r0
 2e0:	83080e42 	movwhi	r0, #36418	; 0x8e42
 2e4:	00018e02 	andeq	r8, r1, r2, lsl #28
 2e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2ec:	000002c0 	andeq	r0, r0, r0, asr #5
 2f0:	000088e0 	andeq	r8, r0, r0, ror #17
 2f4:	0000008c 	andeq	r0, r0, ip, lsl #1
 2f8:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 2fc:	42018e02 	andmi	r8, r1, #2, 28
 300:	4002100e 	andmi	r1, r2, lr
 304:	0000080e 	andeq	r0, r0, lr, lsl #16
 308:	0000000c 	andeq	r0, r0, ip
 30c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 310:	7c020001 	stcvc	0, cr0, [r2], {1}
 314:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 318:	00000014 	andeq	r0, r0, r4, lsl r0
 31c:	00000308 	andeq	r0, r0, r8, lsl #6
 320:	0000896c 	andeq	r8, r0, ip, ror #18
 324:	00000018 	andeq	r0, r0, r8, lsl r0
 328:	83080e42 	movwhi	r0, #36418	; 0x8e42
 32c:	00018e02 	andeq	r8, r1, r2, lsl #28
 330:	00000020 	andeq	r0, r0, r0, lsr #32
 334:	00000308 	andeq	r0, r0, r8, lsl #6
 338:	00008984 	andeq	r8, r0, r4, lsl #19
 33c:	00000048 	andeq	r0, r0, r8, asr #32
 340:	84100e4a 	ldrhi	r0, [r0], #-3658	; 0xe4a
 344:	86038504 	strhi	r8, [r3], -r4, lsl #10
 348:	52018e02 	andpl	r8, r1, #2, 28
 34c:	c5c4000e 	strbgt	r0, [r4, #14]
 350:	0000cec6 	andeq	ip, r0, r6, asr #29
 354:	00000034 	andeq	r0, r0, r4, lsr r0
 358:	00000308 	andeq	r0, r0, r8, lsl #6
 35c:	000089cc 	andeq	r8, r0, ip, asr #19
 360:	000000a0 	andeq	r0, r0, r0, lsr #1
 364:	83180e46 	tsthi	r8, #1120	; 0x460
 368:	85058406 	strhi	r8, [r5, #-1030]	; 0x406
 36c:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 370:	02018e02 	andeq	r8, r1, #2, 28
 374:	c3000e42 	movwgt	r0, #3650	; 0xe42
 378:	c7c6c5c4 	strbgt	ip, [r6, r4, asr #11]
 37c:	180e44ce 	stmdane	lr, {r1, r2, r3, r6, r7, sl, lr}
 380:	05840683 	streq	r0, [r4, #1667]	; 0x683
 384:	03860485 	orreq	r0, r6, #-2063597568	; 0x85000000
 388:	018e0287 	orreq	r0, lr, r7, lsl #5
 38c:	00000014 	andeq	r0, r0, r4, lsl r0
 390:	00000308 	andeq	r0, r0, r8, lsl #6
 394:	00008a6c 	andeq	r8, r0, ip, ror #20
 398:	00000024 	andeq	r0, r0, r4, lsr #32
 39c:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 3a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 3a4:	00000014 	andeq	r0, r0, r4, lsl r0
 3a8:	00000308 	andeq	r0, r0, r8, lsl #6
 3ac:	00008a90 	muleq	r0, r0, sl
 3b0:	00000010 	andeq	r0, r0, r0, lsl r0
 3b4:	83080e42 	movwhi	r0, #36418	; 0x8e42
 3b8:	00018e02 	andeq	r8, r1, r2, lsl #28
 3bc:	0000000c 	andeq	r0, r0, ip
 3c0:	00000308 	andeq	r0, r0, r8, lsl #6
 3c4:	00008aa0 	andeq	r8, r0, r0, lsr #21
 3c8:	00000058 	andeq	r0, r0, r8, asr r0
 3cc:	0000000c 	andeq	r0, r0, ip
 3d0:	00000308 	andeq	r0, r0, r8, lsl #6
 3d4:	00008af8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 3d8:	00000008 	andeq	r0, r0, r8
 3dc:	0000000c 	andeq	r0, r0, ip
 3e0:	00000308 	andeq	r0, r0, r8, lsl #6
 3e4:	00008b00 	andeq	r8, r0, r0, lsl #22
 3e8:	00000008 	andeq	r0, r0, r8
 3ec:	0000000c 	andeq	r0, r0, ip
 3f0:	00000308 	andeq	r0, r0, r8, lsl #6
 3f4:	00008b08 	andeq	r8, r0, r8, lsl #22
 3f8:	00000008 	andeq	r0, r0, r8
 3fc:	0000000c 	andeq	r0, r0, ip
 400:	00000308 	andeq	r0, r0, r8, lsl #6
 404:	00008b10 	andeq	r8, r0, r0, lsl fp
 408:	00000008 	andeq	r0, r0, r8
 40c:	0000000c 	andeq	r0, r0, ip
 410:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 414:	7c010001 	stcvc	0, cr0, [r1], {1}
 418:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 41c:	0000000c 	andeq	r0, r0, ip
 420:	0000040c 	andeq	r0, r0, ip, lsl #8
 424:	00008c5c 	andeq	r8, r0, ip, asr ip
 428:	00000128 	andeq	r0, r0, r8, lsr #2
 42c:	0000000c 	andeq	r0, r0, ip
 430:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 434:	7c010001 	stcvc	0, cr0, [r1], {1}
 438:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 43c:	00000014 	andeq	r0, r0, r4, lsl r0
 440:	0000042c 	andeq	r0, r0, ip, lsr #8
 444:	00008da8 	andeq	r8, r0, r8, lsr #27
 448:	0000003c 	andeq	r0, r0, ip, lsr r0
 44c:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 450:	00000010 	andeq	r0, r0, r0, lsl r0
 454:	0000000c 	andeq	r0, r0, ip
 458:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 45c:	7c020001 	stcvc	0, cr0, [r2], {1}
 460:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 464:	0000002c 	andeq	r0, r0, ip, lsr #32
 468:	00000454 	andeq	r0, r0, r4, asr r4
 46c:	00008de4 	andeq	r8, r0, r4, ror #27
 470:	00000044 	andeq	r0, r0, r4, asr #32
 474:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 478:	86078508 	strhi	r8, [r7], -r8, lsl #10
 47c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 480:	8a038904 	bhi	e2898 <__bss_end+0xd6898>
 484:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 488:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 48c:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 490:	0000000e 	andeq	r0, r0, lr
 494:	00000024 	andeq	r0, r0, r4, lsr #32
 498:	00000454 	andeq	r0, r0, r4, asr r4
 49c:	00008e28 	andeq	r8, r0, r8, lsr #28
 4a0:	00000040 	andeq	r0, r0, r0, asr #32
 4a4:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 4a8:	86058506 	strhi	r8, [r5], -r6, lsl #10
 4ac:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 4b0:	5c018e02 	stcpl	14, cr8, [r1], {2}
 4b4:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 4b8:	000ec4c5 	andeq	ip, lr, r5, asr #9
 4bc:	0000000c 	andeq	r0, r0, ip
 4c0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 4c4:	7c020001 	stcvc	0, cr0, [r2], {1}
 4c8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 4cc:	00000034 	andeq	r0, r0, r4, lsr r0
 4d0:	000004bc 			; <UNDEFINED> instruction: 0x000004bc
 4d4:	00008e68 	andeq	r8, r0, r8, ror #28
 4d8:	00000178 	andeq	r0, r0, r8, ror r1
 4dc:	83280e44 	teqhi	r8, #68, 28	; 0x440
 4e0:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 4e4:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 4e8:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 4ec:	8b038a04 	blhi	e2d04 <__bss_end+0xd6d04>
 4f0:	02018e02 	andeq	r8, r1, #2, 28
 4f4:	cbce0aa6 	blgt	ff382f94 <__user_program+0xff082f94>
 4f8:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 4fc:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 500:	0b42000e 	bleq	1080540 <__user_program+0xd80540>
 504:	0000000c 	andeq	r0, r0, ip
 508:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 50c:	7c020001 	stcvc	0, cr0, [r2], {1}
 510:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 514:	0000002c 	andeq	r0, r0, ip, lsr #32
 518:	00000504 	andeq	r0, r0, r4, lsl #10
 51c:	00008fe0 	andeq	r8, r0, r0, ror #31
 520:	00000120 	andeq	r0, r0, r0, lsr #2
 524:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 528:	86078508 	strhi	r8, [r7], -r8, lsl #10
 52c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 530:	8a038904 	bhi	e2948 <__bss_end+0xd6948>
 534:	02018e02 	andeq	r8, r1, #2, 28
 538:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 53c:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 540:	00000ec4 	andeq	r0, r0, r4, asr #29

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000038 	andeq	r0, r0, r8, lsr r0
   8:	38500001 	ldmdacc	r0, {r0}^
   c:	54000000 	strpl	r0, [r0], #-0
  10:	04000000 	streq	r0, [r0], #-0
  14:	5001f300 	andpl	pc, r1, r0, lsl #6
  18:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  1c:	00000000 	andeq	r0, r0, r0
  20:	00000c00 	andeq	r0, r0, r0, lsl #24
  24:	00003800 	andeq	r3, r0, r0, lsl #16
  28:	70000e00 	andvc	r0, r0, r0, lsl #28
  2c:	3a25f700 	bcc	97dc34 <__user_program+0x67dc34>
  30:	f71b25f7 			; <UNDEFINED> instruction: 0xf71b25f7
  34:	1aff0800 	bne	fffc203c <__user_program+0xffcc203c>
  38:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
  3c:	00005400 	andeq	r5, r0, r0, lsl #8
  40:	f3000f00 	vpmax.f32	d0, d0, d0
  44:	25f75001 	ldrbcs	r5, [r7, #1]!
  48:	1b25f73a 	blne	97dd38 <__user_program+0x67dd38>
  4c:	ff0800f7 			; <UNDEFINED> instruction: 0xff0800f7
  50:	00009f1a 	andeq	r9, r0, sl, lsl pc
  54:	00000000 	andeq	r0, r0, r0
  58:	00300000 	eorseq	r0, r0, r0
  5c:	004c0000 	subeq	r0, ip, r0
  60:	00010000 	andeq	r0, r1, r0
  64:	00004c52 	andeq	r4, r0, r2, asr ip
  68:	00005400 	andeq	r5, r0, r0, lsl #8
  6c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
  78:	00000040 	andeq	r0, r0, r0, asr #32
  7c:	0000004c 	andeq	r0, r0, ip, asr #32
  80:	00500001 	subseq	r0, r0, r1
  84:	00000000 	andeq	r0, r0, r0
  88:	54000000 	strpl	r0, [r0], #-0
  8c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
  90:	01000000 	mrseq	r0, (UNDEF: 0)
  94:	00685000 	rsbeq	r5, r8, r0
  98:	00800000 	addeq	r0, r0, r0
  9c:	00040000 	andeq	r0, r4, r0
  a0:	9f5001f3 	svcls	0x005001f3
  a4:	00000080 	andeq	r0, r0, r0, lsl #1
  a8:	00000088 	andeq	r0, r0, r8, lsl #1
  ac:	88500001 	ldmdahi	r0, {r0}^
  b0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
  b4:	04000000 	streq	r0, [r0], #-0
  b8:	5001f300 	andpl	pc, r1, r0, lsl #6
  bc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  c0:	00000000 	andeq	r0, r0, r0
  c4:	00009800 	andeq	r9, r0, r0, lsl #16
  c8:	0000ac00 	andeq	sl, r0, r0, lsl #24
  cc:	50000100 	andpl	r0, r0, r0, lsl #2
  d0:	000000ac 	andeq	r0, r0, ip, lsr #1
  d4:	000000c4 	andeq	r0, r0, r4, asr #1
  d8:	01f30004 	mvnseq	r0, r4
  dc:	00c49f50 	sbceq	r9, r4, r0, asr pc
  e0:	00cc0000 	sbceq	r0, ip, r0
  e4:	00010000 	andeq	r0, r1, r0
  e8:	0000cc50 	andeq	ip, r0, r0, asr ip
  ec:	0000dc00 	andeq	sp, r0, r0, lsl #24
  f0:	f3000400 	vshl.u8	d0, d0, d0
  f4:	009f5001 	addseq	r5, pc, r1
  f8:	00000000 	andeq	r0, r0, r0
  fc:	dc000000 	stcle	0, cr0, [r0], {-0}
 100:	00000000 	andeq	r0, r0, r0
 104:	01000001 	tsteq	r0, r1
 108:	01005000 	mrseq	r5, (UNDEF: 0)
 10c:	01600000 	cmneq	r0, r0
 110:	00040000 	andeq	r0, r4, r0
 114:	9f5001f3 	svcls	0x005001f3
	...
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00000103 	andeq	r0, r0, r3, lsl #2
 128:	03510001 	cmpeq	r1, #1
 12c:	60000001 	andvs	r0, r0, r1
 130:	04000001 	streq	r0, [r0], #-1
 134:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 138:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 13c:	00000000 	andeq	r0, r0, r0
 140:	00004000 	andeq	r4, r0, r0
 144:	00008000 	andeq	r8, r0, r0
 148:	50000100 	andpl	r0, r0, r0, lsl #2
 14c:	00000080 	andeq	r0, r0, r0, lsl #1
 150:	00000088 	andeq	r0, r0, r8, lsl #1
 154:	01f30004 	mvnseq	r0, r4
 158:	00889f50 	addeq	r9, r8, r0, asr pc
 15c:	008c0000 	addeq	r0, ip, r0
 160:	00010000 	andeq	r0, r1, r0
 164:	00008c50 	andeq	r8, r0, r0, asr ip
 168:	00009c00 	andeq	r9, r0, r0, lsl #24
 16c:	f3000400 	vshl.u8	d0, d0, d0
 170:	9c9f5001 	ldcls	0, cr5, [pc], {1}
 174:	a0000000 	andge	r0, r0, r0
 178:	01000000 	mrseq	r0, (UNDEF: 0)
 17c:	00a05000 	adceq	r5, r0, r0
 180:	00a80000 	adceq	r0, r8, r0
 184:	00040000 	andeq	r0, r4, r0
 188:	9f5001f3 	svcls	0x005001f3
 18c:	000000a8 	andeq	r0, r0, r8, lsr #1
 190:	000000ac 	andeq	r0, r0, ip, lsr #1
 194:	ac500001 	mrrcge	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 198:	b8000000 	stmdalt	r0, {}	; <UNPREDICTABLE>
 19c:	04000000 	streq	r0, [r0], #-0
 1a0:	5001f300 	andpl	pc, r1, r0, lsl #6
 1a4:	0000b89f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 1a8:	0000bc00 	andeq	fp, r0, r0, lsl #24
 1ac:	50000100 	andpl	r0, r0, r0, lsl #2
 1b0:	000000bc 	strheq	r0, [r0], -ip
 1b4:	000000c4 	andeq	r0, r0, r4, asr #1
 1b8:	01f30004 	mvnseq	r0, r4
 1bc:	00c49f50 	sbceq	r9, r4, r0, asr pc
 1c0:	00c80000 	sbceq	r0, r8, r0
 1c4:	00010000 	andeq	r0, r1, r0
 1c8:	0000c850 	andeq	ip, r0, r0, asr r8
 1cc:	0000d800 	andeq	sp, r0, r0, lsl #16
 1d0:	f3000400 	vshl.u8	d0, d0, d0
 1d4:	d89f5001 	ldmle	pc, {r0, ip, lr}	; <UNPREDICTABLE>
 1d8:	dc000000 	stcle	0, cr0, [r0], {-0}
 1dc:	01000000 	mrseq	r0, (UNDEF: 0)
 1e0:	00dc5000 	sbcseq	r5, ip, r0
 1e4:	00ec0000 	rsceq	r0, ip, r0
 1e8:	00040000 	andeq	r0, r4, r0
 1ec:	9f5001f3 	svcls	0x005001f3
 1f0:	000000ec 	andeq	r0, r0, ip, ror #1
 1f4:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 1f8:	f0500001 			; <UNDEFINED> instruction: 0xf0500001
 1fc:	fc000000 	stc2	0, cr0, [r0], {-0}
 200:	04000000 	streq	r0, [r0], #-0
 204:	5001f300 	andpl	pc, r1, r0, lsl #6
 208:	0000fc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 20c:	00010000 	andeq	r0, r1, r0
 210:	50000100 	andpl	r0, r0, r0, lsl #2
 214:	00000100 	andeq	r0, r0, r0, lsl #2
 218:	00000110 	andeq	r0, r0, r0, lsl r1
 21c:	01f30004 	mvnseq	r0, r4
 220:	01109f50 	tsteq	r0, r0, asr pc
 224:	01130000 	tsteq	r3, r0
 228:	00010000 	andeq	r0, r1, r0
 22c:	00011350 	andeq	r1, r1, r0, asr r3
 230:	00011800 	andeq	r1, r1, r0, lsl #16
 234:	f3000400 	vshl.u8	d0, d0, d0
 238:	189f5001 	ldmne	pc, {r0, ip, lr}	; <UNPREDICTABLE>
 23c:	1c000001 	stcne	0, cr0, [r0], {1}
 240:	01000001 	tsteq	r0, r1
 244:	011c5000 	tsteq	ip, r0
 248:	01200000 	teqeq	r0, r0
 24c:	00040000 	andeq	r0, r4, r0
 250:	9f5001f3 	svcls	0x005001f3
	...
 25c:	00000040 	andeq	r0, r0, r0, asr #32
 260:	00000083 	andeq	r0, r0, r3, lsl #1
 264:	83510001 	cmphi	r1, #1
 268:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
 26c:	04000000 	streq	r0, [r0], #-0
 270:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 274:	0000889f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 278:	00009000 	andeq	r9, r0, r0
 27c:	51000100 	mrspl	r0, (UNDEF: 16)
 280:	00000090 	muleq	r0, r0, r0
 284:	00000097 	muleq	r0, r7, r0
 288:	97530001 	ldrbls	r0, [r3, -r1]
 28c:	9c000000 	stcls	0, cr0, [r0], {-0}
 290:	04000000 	streq	r0, [r0], #-0
 294:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 298:	00009c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 29c:	0000a300 	andeq	sl, r0, r0, lsl #6
 2a0:	51000100 	mrspl	r0, (UNDEF: 16)
 2a4:	000000a3 	andeq	r0, r0, r3, lsr #1
 2a8:	000000a8 	andeq	r0, r0, r8, lsr #1
 2ac:	01f30004 	mvnseq	r0, r4
 2b0:	00a89f51 	adceq	r9, r8, r1, asr pc
 2b4:	00b00000 	adcseq	r0, r0, r0
 2b8:	00010000 	andeq	r0, r1, r0
 2bc:	0000b051 	andeq	fp, r0, r1, asr r0
 2c0:	0000b300 	andeq	fp, r0, r0, lsl #6
 2c4:	53000100 	movwpl	r0, #256	; 0x100
 2c8:	000000b3 	strheq	r0, [r0], -r3
 2cc:	000000b8 	strheq	r0, [r0], -r8
 2d0:	01f30004 	mvnseq	r0, r4
 2d4:	00b89f51 	adcseq	r9, r8, r1, asr pc
 2d8:	00bf0000 	adcseq	r0, pc, r0
 2dc:	00010000 	andeq	r0, r1, r0
 2e0:	0000bf51 	andeq	fp, r0, r1, asr pc
 2e4:	0000c400 	andeq	ip, r0, r0, lsl #8
 2e8:	f3000400 	vshl.u8	d0, d0, d0
 2ec:	c49f5101 	ldrgt	r5, [pc], #257	; 2f4 <__start-0x7d0c>
 2f0:	cc000000 	stcgt	0, cr0, [r0], {-0}
 2f4:	01000000 	mrseq	r0, (UNDEF: 0)
 2f8:	00cc5100 	sbceq	r5, ip, r0, lsl #2
 2fc:	00d30000 	sbcseq	r0, r3, r0
 300:	00010000 	andeq	r0, r1, r0
 304:	0000d353 	andeq	sp, r0, r3, asr r3
 308:	0000d800 	andeq	sp, r0, r0, lsl #16
 30c:	f3000400 	vshl.u8	d0, d0, d0
 310:	d89f5101 	ldmle	pc, {r0, r8, ip, lr}	; <UNPREDICTABLE>
 314:	e0000000 	and	r0, r0, r0
 318:	01000000 	mrseq	r0, (UNDEF: 0)
 31c:	00e05100 	rsceq	r5, r0, r0, lsl #2
 320:	00e70000 	rsceq	r0, r7, r0
 324:	00010000 	andeq	r0, r1, r0
 328:	0000e753 	andeq	lr, r0, r3, asr r7
 32c:	0000ec00 	andeq	lr, r0, r0, lsl #24
 330:	f3000400 	vshl.u8	d0, d0, d0
 334:	ec9f5101 	ldfs	f5, [pc], {1}
 338:	f3000000 	vhadd.u8	d0, d0, d0
 33c:	01000000 	mrseq	r0, (UNDEF: 0)
 340:	00f35100 	rscseq	r5, r3, r0, lsl #2
 344:	00fc0000 	rscseq	r0, ip, r0
 348:	00040000 	andeq	r0, r4, r0
 34c:	9f5101f3 	svcls	0x005101f3
 350:	000000fc 	strdeq	r0, [r0], -ip
 354:	00000104 	andeq	r0, r0, r4, lsl #2
 358:	04510001 	ldrbeq	r0, [r1], #-1
 35c:	0b000001 	bleq	368 <__start-0x7c98>
 360:	01000001 	tsteq	r0, r1
 364:	010b5300 	mrseq	r5, (UNDEF: 59)
 368:	01100000 	tsteq	r0, r0
 36c:	00040000 	andeq	r0, r4, r0
 370:	9f5101f3 	svcls	0x005101f3
 374:	00000110 	andeq	r0, r0, r0, lsl r1
 378:	00000113 	andeq	r0, r0, r3, lsl r1
 37c:	13510001 	cmpne	r1, #1
 380:	18000001 	stmdane	r0, {r0}
 384:	04000001 	streq	r0, [r0], #-1
 388:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 38c:	0001189f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
 390:	00012000 	andeq	r2, r1, r0
 394:	51000100 	mrspl	r0, (UNDEF: 16)
	...
 3a4:	00000048 	andeq	r0, r0, r8, asr #32
 3a8:	48500001 	ldmdami	r0, {r0}^
 3ac:	e0000000 	and	r0, r0, r0
 3b0:	04000000 	streq	r0, [r0], #-0
 3b4:	5001f300 	andpl	pc, r1, r0, lsl #6
 3b8:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
 3c4:	00004800 	andeq	r4, r0, r0, lsl #16
 3c8:	52000600 	andpl	r0, r0, #0, 12
 3cc:	93530493 	cmpls	r3, #-1828716544	; 0x93000000
 3d0:	00004804 	andeq	r4, r0, r4, lsl #16
 3d4:	00007c00 	andeq	r7, r0, r0, lsl #24
 3d8:	56000600 	strpl	r0, [r0], -r0, lsl #12
 3dc:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
 3e0:	00008004 	andeq	r8, r0, r4
 3e4:	0000e000 	andeq	lr, r0, r0
 3e8:	56000600 	strpl	r0, [r0], -r0, lsl #12
 3ec:	93570493 	cmpls	r7, #-1828716544	; 0x93000000
 3f0:	00000004 	andeq	r0, r0, r4
 3f4:	00000000 	andeq	r0, r0, r0
 3f8:	00001000 	andeq	r1, r0, r0
 3fc:	00004800 	andeq	r4, r0, r0, lsl #16
 400:	30000200 	andcc	r0, r0, r0, lsl #4
 404:	0000909f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 408:	00009c00 	andeq	r9, r0, r0, lsl #24
 40c:	58000100 	stmdapl	r0, {r8}
 410:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 414:	000000b8 	strheq	r0, [r0], -r8
 418:	b8580001 	ldmdalt	r8, {r0}^
 41c:	c4000000 	strgt	r0, [r0], #-0
 420:	03000000 	movweq	r0, #0
 424:	9f7f7800 	svcls	0x007f7800
	...
 430:	00000010 	andeq	r0, r0, r0, lsl r0
 434:	00000038 	andeq	r0, r0, r8, lsr r0
 438:	57910003 	ldrpl	r0, [r1, r3]
 43c:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 440:	00006400 	andeq	r6, r0, r0, lsl #8
 444:	54000100 	strpl	r0, [r0], #-256	; 0x100
 448:	00000064 	andeq	r0, r0, r4, rrx
 44c:	0000009c 	muleq	r0, ip, r0
 450:	01740003 	cmneq	r4, r3
 454:	00009c9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 458:	0000b000 	andeq	fp, r0, r0
 45c:	54000100 	strpl	r0, [r0], #-256	; 0x100
 460:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 464:	000000c4 	andeq	r0, r0, r4, asr #1
 468:	01740003 	cmneq	r4, r3
 46c:	0000c49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
 470:	0000c800 	andeq	ip, r0, r0, lsl #16
 474:	54000100 	strpl	r0, [r0], #-256	; 0x100
 478:	000000c8 	andeq	r0, r0, r8, asr #1
 47c:	000000cc 	andeq	r0, r0, ip, asr #1
 480:	7f740003 	svcvc	0x00740003
 484:	0000cc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 488:	0000e000 	andeq	lr, r0, r0
 48c:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 498:	000000e0 	andeq	r0, r0, r0, ror #1
 49c:	00000108 	andeq	r0, r0, r8, lsl #2
 4a0:	70910002 	addsvc	r0, r1, r2
 4a4:	00000108 	andeq	r0, r0, r8, lsl #2
 4a8:	0000011c 	andeq	r0, r0, ip, lsl r1
 4ac:	1c540001 	mrrcne	0, 0, r0, r4, cr1
 4b0:	7c000001 	stcvc	0, cr0, [r0], {1}
 4b4:	03000002 	movweq	r0, #2
 4b8:	9f017400 	svcls	0x00017400
 4bc:	0000027c 	andeq	r0, r0, ip, ror r2
 4c0:	00000288 	andeq	r0, r0, r8, lsl #5
 4c4:	00540001 	subseq	r0, r4, r1
 4c8:	00000000 	andeq	r0, r0, r0
 4cc:	e8000000 	stmda	r0, {}	; <UNPREDICTABLE>
 4d0:	f4000001 	vst4.8	{d0-d3}, [r0], r1
 4d4:	02000001 	andeq	r0, r0, #1
 4d8:	f4007300 	vst2.8	{d7-d10}, [r0], r0
 4dc:	f7000001 			; <UNDEFINED> instruction: 0xf7000001
 4e0:	01000001 	tsteq	r0, r1
 4e4:	00005200 	andeq	r5, r0, r0, lsl #4
 4e8:	00000000 	andeq	r0, r0, r0
 4ec:	02080000 	andeq	r0, r8, #0
 4f0:	02140000 	andseq	r0, r4, #0
 4f4:	00020000 	andeq	r0, r2, r0
 4f8:	02140073 	andseq	r0, r4, #115	; 0x73
 4fc:	02170000 	andseq	r0, r7, #0
 500:	00010000 	andeq	r0, r1, r0
 504:	00000052 	andeq	r0, r0, r2, asr r0
 508:	00000000 	andeq	r0, r0, r0
 50c:	00018400 	andeq	r8, r1, r0, lsl #8
 510:	0001bc00 	andeq	fp, r1, r0, lsl #24
 514:	55000100 	strpl	r0, [r0, #-256]	; 0x100
	...
 520:	000001c8 	andeq	r0, r0, r8, asr #3
 524:	000001d4 	ldrdeq	r0, [r0], -r4
 528:	00730002 	rsbseq	r0, r3, r2
 52c:	000001d4 	ldrdeq	r0, [r0], -r4
 530:	000001d7 	ldrdeq	r0, [r0], -r7
 534:	00520001 	subseq	r0, r2, r1
 538:	00000000 	andeq	r0, r0, r0
 53c:	2c000000 	stccs	0, cr0, [r0], {-0}
 540:	40000002 	andmi	r0, r0, r2
 544:	01000002 	tsteq	r0, r2
 548:	02405500 	subeq	r5, r0, #0, 10
 54c:	024c0000 	subeq	r0, ip, #0
 550:	00030000 	andeq	r0, r3, r0
 554:	009f7f75 	addseq	r7, pc, r5, ror pc	; <UNPREDICTABLE>
 558:	00000000 	andeq	r0, r0, r0
 55c:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 560:	5f000002 	svcpl	0x00000002
 564:	02000002 	andeq	r0, r0, #2
 568:	00007300 	andeq	r7, r0, r0, lsl #6
	...
 574:	0c000000 	stceq	0, cr0, [r0], {-0}
 578:	01000000 	mrseq	r0, (UNDEF: 0)
 57c:	000c5000 	andeq	r5, ip, r0
 580:	00480000 	subeq	r0, r8, r0
 584:	00040000 	andeq	r0, r4, r0
 588:	9f5001f3 	svcls	0x005001f3
	...
 594:	00000048 	andeq	r0, r0, r8, asr #32
 598:	00000090 	muleq	r0, r0, r0
 59c:	90500001 	subsls	r0, r0, r1
 5a0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
 5a4:	03000000 	movweq	r0, #0
 5a8:	9f017300 	svcls	0x00017300
 5ac:	00000098 	muleq	r0, r8, r0
 5b0:	00000108 	andeq	r0, r0, r8, lsl #2
 5b4:	01f30004 	mvnseq	r0, r4
 5b8:	01089f50 	tsteq	r8, r0, asr pc
 5bc:	010c0000 	mrseq	r0, (UNDEF: 12)
 5c0:	00010000 	andeq	r0, r1, r0
 5c4:	00010c50 	andeq	r0, r1, r0, asr ip
 5c8:	00011000 	andeq	r1, r1, r0
 5cc:	f3000400 	vshl.u8	d0, d0, d0
 5d0:	009f5001 	addseq	r5, pc, r1
 5d4:	00000000 	andeq	r0, r0, r0
 5d8:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 5dc:	8c000000 	stchi	0, cr0, [r0], {-0}
 5e0:	01000000 	mrseq	r0, (UNDEF: 0)
 5e4:	008c5100 	addeq	r5, ip, r0, lsl #2
 5e8:	01080000 	mrseq	r0, (UNDEF: 8)
 5ec:	00040000 	andeq	r0, r4, r0
 5f0:	9f5101f3 	svcls	0x005101f3
 5f4:	00000108 	andeq	r0, r0, r8, lsl #2
 5f8:	00000110 	andeq	r0, r0, r0, lsl r1
 5fc:	00510001 	subseq	r0, r1, r1
 600:	00000000 	andeq	r0, r0, r0
 604:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 608:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
 60c:	01000000 	mrseq	r0, (UNDEF: 0)
 610:	00985200 	addseq	r5, r8, r0, lsl #4
 614:	01080000 	mrseq	r0, (UNDEF: 8)
 618:	00040000 	andeq	r0, r4, r0
 61c:	9f5201f3 	svcls	0x005201f3
 620:	00000108 	andeq	r0, r0, r8, lsl #2
 624:	00000110 	andeq	r0, r0, r0, lsl r1
 628:	00520001 	subseq	r0, r2, r1
 62c:	00000000 	andeq	r0, r0, r0
 630:	7c000000 	stcvc	0, cr0, [r0], {-0}
 634:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
 638:	02000000 	andeq	r0, r0, #0
 63c:	989f3000 	ldmls	pc, {ip, sp}	; <UNPREDICTABLE>
 640:	9c000000 	stcls	0, cr0, [r0], {-0}
 644:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 648:	f3007300 	vcgt.u8	d7, d0, d0
 64c:	1c315001 	ldcne	0, cr5, [r1], #-4
 650:	00a09f1c 	adceq	r9, r0, ip, lsl pc
 654:	00a80000 	adceq	r0, r8, r0
 658:	00090000 	andeq	r0, r9, r0
 65c:	01f30073 	mvnseq	r0, r3, ror r0
 660:	1c1c3150 	ldfnes	f3, [ip], {80}	; 0x50
 664:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 668:	00000000 	andeq	r0, r0, r0
 66c:	0000ec00 	andeq	lr, r0, r0, lsl #24
 670:	0000f800 	andeq	pc, r0, r0, lsl #16
 674:	52000100 	andpl	r0, r0, #0, 2
 678:	000000f8 	strdeq	r0, [r0], -r8
 67c:	00000100 	andeq	r0, r0, r0, lsl #2
 680:	04730004 	ldrbteq	r0, [r3], #-4
 684:	00009f06 	andeq	r9, r0, r6, lsl #30
 688:	00000000 	andeq	r0, r0, r0
 68c:	00f80000 	rscseq	r0, r8, r0
 690:	01080000 	mrseq	r0, (UNDEF: 8)
 694:	00010000 	andeq	r0, r1, r0
 698:	00000052 	andeq	r0, r0, r2, asr r0
 69c:	00000000 	andeq	r0, r0, r0
 6a0:	00011000 	andeq	r1, r1, r0
 6a4:	0001c800 	andeq	ip, r1, r0, lsl #16
 6a8:	50000100 	andpl	r0, r0, r0, lsl #2
 6ac:	000001c8 	andeq	r0, r0, r8, asr #3
 6b0:	000001cc 	andeq	r0, r0, ip, asr #3
 6b4:	01f30004 	mvnseq	r0, r4
 6b8:	01cc9f50 	biceq	r9, ip, r0, asr pc
 6bc:	01d00000 	bicseq	r0, r0, r0
 6c0:	00010000 	andeq	r0, r1, r0
 6c4:	0001d050 	andeq	sp, r1, r0, asr r0
 6c8:	0001d400 	andeq	sp, r1, r0, lsl #8
 6cc:	f3000400 	vshl.u8	d0, d0, d0
 6d0:	009f5001 	addseq	r5, pc, r1
 6d4:	00000000 	andeq	r0, r0, r0
 6d8:	10000000 	andne	r0, r0, r0
 6dc:	48000001 	stmdami	r0, {r0}
 6e0:	01000001 	tsteq	r0, r1
 6e4:	01485200 	mrseq	r5, (UNDEF: 104)
 6e8:	01cc0000 	biceq	r0, ip, r0
 6ec:	00040000 	andeq	r0, r4, r0
 6f0:	9f5201f3 	svcls	0x005201f3
 6f4:	000001cc 	andeq	r0, r0, ip, asr #3
 6f8:	000001d4 	ldrdeq	r0, [r0], -r4
 6fc:	00520001 	subseq	r0, r2, r1
 700:	00000000 	andeq	r0, r0, r0
 704:	64000000 	strvs	r0, [r0], #-0
 708:	80000001 	andhi	r0, r0, r1
 70c:	02000001 	andeq	r0, r0, #1
 710:	809f3000 	addshi	r3, pc, r0
 714:	90000001 	andls	r0, r0, r1
 718:	06000001 	streq	r0, [r0], -r1
 71c:	70007300 	andvc	r7, r0, r0, lsl #6
 720:	009f1c7f 	addseq	r1, pc, pc, ror ip	; <UNPREDICTABLE>
 724:	00000000 	andeq	r0, r0, r0
 728:	b0000000 	andlt	r0, r0, r0
 72c:	bc000001 	stclt	0, cr0, [r0], {1}
 730:	01000001 	tsteq	r0, r1
 734:	01bc5200 			; <UNDEFINED> instruction: 0x01bc5200
 738:	01c40000 	biceq	r0, r4, r0
 73c:	00040000 	andeq	r0, r4, r0
 740:	9f060473 	svcls	0x00060473
	...
 74c:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
 750:	000001cc 	andeq	r0, r0, ip, asr #3
 754:	00520001 	subseq	r0, r2, r1
	...
 760:	24000000 	strcs	r0, [r0], #-0
 764:	01000000 	mrseq	r0, (UNDEF: 0)
 768:	00245000 	eoreq	r5, r4, r0
 76c:	002b0000 	eoreq	r0, fp, r0
 770:	00010000 	andeq	r0, r1, r0
 774:	00002b51 	andeq	r2, r0, r1, asr fp
 778:	00003400 	andeq	r3, r0, r0, lsl #8
 77c:	f3000400 	vshl.u8	d0, d0, d0
 780:	009f5001 	addseq	r5, pc, r1
 784:	00000000 	andeq	r0, r0, r0
 788:	10000000 	andne	r0, r0, r0
 78c:	1c000000 	stcne	0, cr0, [r0], {-0}
 790:	01000000 	mrseq	r0, (UNDEF: 0)
 794:	001c5000 	andseq	r5, ip, r0
 798:	009c0000 	addseq	r0, ip, r0
 79c:	00040000 	andeq	r0, r4, r0
 7a0:	9f5001f3 	svcls	0x005001f3
	...
 7ac:	00000034 	andeq	r0, r0, r4, lsr r0
 7b0:	00000044 	andeq	r0, r0, r4, asr #32
 7b4:	44530001 	ldrbmi	r0, [r3], #-1
 7b8:	57000000 	strpl	r0, [r0, -r0]
 7bc:	02000000 	andeq	r0, r0, #0
 7c0:	006d9100 	rsbeq	r9, sp, r0, lsl #2
 7c4:	00000000 	andeq	r0, r0, r0
 7c8:	34000000 	strcc	r0, [r0], #-0
 7cc:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 7d0:	02000000 	andeq	r0, r0, #0
 7d4:	589f3300 	ldmpl	pc, {r8, r9, ip, sp}	; <UNPREDICTABLE>
 7d8:	70000000 	andvc	r0, r0, r0
 7dc:	02000000 	andeq	r0, r0, #0
 7e0:	709f3100 	addsvc	r3, pc, r0, lsl #2
 7e4:	90000000 	andls	r0, r0, r0
 7e8:	02000000 	andeq	r0, r0, #0
 7ec:	009f3200 	addseq	r3, pc, r0, lsl #4
 7f0:	00000000 	andeq	r0, r0, r0
 7f4:	80000000 	andhi	r0, r0, r0
 7f8:	90000000 	andls	r0, r0, r0
 7fc:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 800:	946c9100 	strbtls	r9, [ip], #-256	; 0x100
 804:	1aff0801 	bne	fffc2810 <__user_program+0xffcc2810>
 808:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 80c:	00000000 	andeq	r0, r0, r0
 810:	00008000 	andeq	r8, r0, r0
 814:	00009000 	andeq	r9, r0, r0
 818:	91000800 	tstls	r0, r0, lsl #16
 81c:	0801946d 	stmdaeq	r1, {r0, r2, r3, r5, r6, sl, ip, pc}
 820:	009f1aff 			; <UNDEFINED> instruction: 0x009f1aff
	...
 82c:	0c000000 	stceq	0, cr0, [r0], {-0}
 830:	01000000 	mrseq	r0, (UNDEF: 0)
 834:	000c5000 	andeq	r5, ip, r0
 838:	00130000 	andseq	r0, r3, r0
 83c:	00010000 	andeq	r0, r1, r0
 840:	00001351 	andeq	r1, r0, r1, asr r3
 844:	00001800 	andeq	r1, r0, r0, lsl #16
 848:	f3000400 	vshl.u8	d0, d0, d0
 84c:	009f5001 	addseq	r5, pc, r1
 850:	00000000 	andeq	r0, r0, r0
 854:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
 858:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
 85c:	01000000 	mrseq	r0, (UNDEF: 0)
 860:	00385000 	eorseq	r5, r8, r0
 864:	00500000 	subseq	r0, r0, r0
 868:	00040000 	andeq	r0, r4, r0
 86c:	9f5001f3 	svcls	0x005001f3
 870:	00000050 	andeq	r0, r0, r0, asr r0
 874:	00000054 	andeq	r0, r0, r4, asr r0
 878:	54500001 	ldrbpl	r0, [r0], #-1
 87c:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
 880:	04000000 	streq	r0, [r0], #-0
 884:	5001f300 	andpl	pc, r1, r0, lsl #6
 888:	0000589f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 88c:	00005c00 	andeq	r5, r0, r0, lsl #24
 890:	50000100 	andpl	r0, r0, r0, lsl #2
 894:	0000005c 	andeq	r0, r0, ip, asr r0
 898:	00000060 	andeq	r0, r0, r0, rrx
 89c:	01f30004 	mvnseq	r0, r4
 8a0:	00009f50 	andeq	r9, r0, r0, asr pc
 8a4:	00000000 	andeq	r0, r0, r0
 8a8:	00180000 	andseq	r0, r8, r0
 8ac:	00380000 	eorseq	r0, r8, r0
 8b0:	00010000 	andeq	r0, r1, r0
 8b4:	00003851 	andeq	r3, r0, r1, asr r8
 8b8:	00005000 	andeq	r5, r0, r0
 8bc:	f3000400 	vshl.u8	d0, d0, d0
 8c0:	509f5101 	addspl	r5, pc, r1, lsl #2
 8c4:	60000000 	andvs	r0, r0, r0
 8c8:	01000000 	mrseq	r0, (UNDEF: 0)
 8cc:	00005100 	andeq	r5, r0, r0, lsl #2
 8d0:	00000000 	andeq	r0, r0, r0
 8d4:	00180000 	andseq	r0, r8, r0
 8d8:	00380000 	eorseq	r0, r8, r0
 8dc:	00010000 	andeq	r0, r1, r0
 8e0:	00003852 	andeq	r3, r0, r2, asr r8
 8e4:	00005000 	andeq	r5, r0, r0
 8e8:	56000100 	strpl	r0, [r0], -r0, lsl #2
 8ec:	00000050 	andeq	r0, r0, r0, asr r0
 8f0:	00000060 	andeq	r0, r0, r0, rrx
 8f4:	00520001 	subseq	r0, r2, r1
 8f8:	00000000 	andeq	r0, r0, r0
 8fc:	20000000 	andcs	r0, r0, r0
 900:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
 904:	02000000 	andeq	r0, r0, #0
 908:	389f3000 	ldmcc	pc, {ip, sp}	; <UNPREDICTABLE>
 90c:	3c000000 	stccc	0, cr0, [r0], {-0}
 910:	07000000 	streq	r0, [r0, -r0]
 914:	f3007400 	vshl.u8	d7, d0, d0
 918:	9f1c5101 	svcls	0x001c5101
 91c:	0000003c 	andeq	r0, r0, ip, lsr r0
 920:	00000040 	andeq	r0, r0, r0, asr #32
 924:	01f30008 	mvnseq	r0, r8
 928:	00742051 	rsbseq	r2, r4, r1, asr r0
 92c:	00409f22 	subeq	r9, r0, r2, lsr #30
 930:	00500000 	subseq	r0, r0, r0
 934:	00070000 	andeq	r0, r7, r0
 938:	01f30074 	mvnseq	r0, r4, ror r0
 93c:	589f1c51 	ldmpl	pc, {r0, r4, r6, sl, fp, ip}	; <UNPREDICTABLE>
 940:	60000000 	andvs	r0, r0, r0
 944:	02000000 	andeq	r0, r0, #0
 948:	009f3000 	addseq	r3, pc, r0
 94c:	00000000 	andeq	r0, r0, r0
 950:	60000000 	andvs	r0, r0, r0
 954:	7c000000 	stcvc	0, cr0, [r0], {-0}
 958:	01000000 	mrseq	r0, (UNDEF: 0)
 95c:	007c5000 	rsbseq	r5, ip, r0
 960:	00f00000 	rscseq	r0, r0, r0
 964:	00040000 	andeq	r0, r4, r0
 968:	9f5001f3 	svcls	0x005001f3
 96c:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 970:	000000f4 	strdeq	r0, [r0], -r4
 974:	f4500001 			; <UNDEFINED> instruction: 0xf4500001
 978:	00000000 	andeq	r0, r0, r0
 97c:	04000001 	streq	r0, [r0], #-1
 980:	5001f300 	andpl	pc, r1, r0, lsl #6
 984:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 988:	00000000 	andeq	r0, r0, r0
 98c:	00006000 	andeq	r6, r0, r0
 990:	00007c00 	andeq	r7, r0, r0, lsl #24
 994:	51000100 	mrspl	r0, (UNDEF: 16)
 998:	0000007c 	andeq	r0, r0, ip, ror r0
 99c:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 9a0:	f0550001 			; <UNDEFINED> instruction: 0xf0550001
 9a4:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
 9a8:	01000000 	mrseq	r0, (UNDEF: 0)
 9ac:	00f85100 	rscseq	r5, r8, r0, lsl #2
 9b0:	01000000 	mrseq	r0, (UNDEF: 0)
 9b4:	00010000 	andeq	r0, r1, r0
 9b8:	00000055 	andeq	r0, r0, r5, asr r0
 9bc:	00000000 	andeq	r0, r0, r0
 9c0:	00006000 	andeq	r6, r0, r0
 9c4:	00007c00 	andeq	r7, r0, r0, lsl #24
 9c8:	52000100 	andpl	r0, r0, #0, 2
 9cc:	0000007c 	andeq	r0, r0, ip, ror r0
 9d0:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 9d4:	f0560001 			; <UNDEFINED> instruction: 0xf0560001
 9d8:	f8000000 			; <UNDEFINED> instruction: 0xf8000000
 9dc:	01000000 	mrseq	r0, (UNDEF: 0)
 9e0:	00f85200 	rscseq	r5, r8, r0, lsl #4
 9e4:	01000000 	mrseq	r0, (UNDEF: 0)
 9e8:	00010000 	andeq	r0, r1, r0
 9ec:	00000056 	andeq	r0, r0, r6, asr r0
 9f0:	00000000 	andeq	r0, r0, r0
 9f4:	00008400 	andeq	r8, r0, r0, lsl #8
 9f8:	0000bc00 	andeq	fp, r0, r0, lsl #24
 9fc:	50000100 	andpl	r0, r0, r0, lsl #2
 a00:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 a04:	000000d4 	ldrdeq	r0, [r0], -r4
 a08:	f8500001 			; <UNDEFINED> instruction: 0xf8500001
 a0c:	fc000000 	stc2	0, cr0, [r0], {-0}
 a10:	01000000 	mrseq	r0, (UNDEF: 0)
 a14:	00005000 	andeq	r5, r0, r0
 a18:	00000000 	andeq	r0, r0, r0
 a1c:	01000000 	mrseq	r0, (UNDEF: 0)
 a20:	010b0000 	mrseq	r0, (UNDEF: 11)
 a24:	00010000 	andeq	r0, r1, r0
 a28:	00010b50 	andeq	r0, r1, r0, asr fp
 a2c:	00012400 	andeq	r2, r1, r0, lsl #8
 a30:	f3000400 	vshl.u8	d0, d0, d0
 a34:	009f5001 	addseq	r5, pc, r1
	...
 a40:	0b000001 	bleq	a4c <__start-0x75b4>
 a44:	01000001 	tsteq	r0, r1
 a48:	010b5100 	mrseq	r5, (UNDEF: 27)
 a4c:	01240000 	teqeq	r4, r0
 a50:	00040000 	andeq	r0, r4, r0
 a54:	9f5101f3 	svcls	0x005101f3
	...
 a60:	00000100 	andeq	r0, r0, r0, lsl #2
 a64:	0000010b 	andeq	r0, r0, fp, lsl #2
 a68:	0b520001 	bleq	1480a74 <__user_program+0x1180a74>
 a6c:	24000001 	strcs	r0, [r0], #-1
 a70:	01000001 	tsteq	r0, r1
 a74:	00005400 	andeq	r5, r0, r0, lsl #8
 a78:	00000000 	andeq	r0, r0, r0
 a7c:	01340000 	teqeq	r4, r0
 a80:	01680000 	cmneq	r8, r0
 a84:	00010000 	andeq	r0, r1, r0
 a88:	00016850 	andeq	r6, r1, r0, asr r8
 a8c:	00018c00 	andeq	r8, r1, r0, lsl #24
 a90:	f3000400 	vshl.u8	d0, d0, d0
 a94:	009f5001 	addseq	r5, pc, r1
 a98:	00000000 	andeq	r0, r0, r0
 a9c:	8c000000 	stchi	0, cr0, [r0], {-0}
 aa0:	90000001 	andls	r0, r0, r1
 aa4:	01000001 	tsteq	r0, r1
 aa8:	01905000 	orrseq	r5, r0, r0
 aac:	01940000 	orrseq	r0, r4, r0
 ab0:	00040000 	andeq	r0, r4, r0
 ab4:	9f5001f3 	svcls	0x005001f3
	...
 ac0:	00000194 	muleq	r0, r4, r1
 ac4:	00000198 	muleq	r0, r8, r1
 ac8:	98500001 	ldmdals	r0, {r0}^
 acc:	9c000001 	stcls	0, cr0, [r0], {1}
 ad0:	04000001 	streq	r0, [r0], #-1
 ad4:	5001f300 	andpl	pc, r1, r0, lsl #6
 ad8:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 adc:	00000000 	andeq	r0, r0, r0
 ae0:	00019c00 	andeq	r9, r1, r0, lsl #24
 ae4:	0001a000 	andeq	sl, r1, r0
 ae8:	50000100 	andpl	r0, r0, r0, lsl #2
 aec:	000001a0 	andeq	r0, r0, r0, lsr #3
 af0:	000001a4 	andeq	r0, r0, r4, lsr #3
 af4:	01f30004 	mvnseq	r0, r4
 af8:	00009f50 	andeq	r9, r0, r0, asr pc
 afc:	00000000 	andeq	r0, r0, r0
 b00:	01a40000 			; <UNDEFINED> instruction: 0x01a40000
 b04:	01a80000 			; <UNDEFINED> instruction: 0x01a80000
 b08:	00010000 	andeq	r0, r1, r0
 b0c:	0001a850 	andeq	sl, r1, r0, asr r8
 b10:	0001ac00 	andeq	sl, r1, r0, lsl #24
 b14:	f3000400 	vshl.u8	d0, d0, d0
 b18:	009f5001 	addseq	r5, pc, r1
 b1c:	00000000 	andeq	r0, r0, r0
 b20:	Address 0x00000b20 is out of bounds.


Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	000000f8 	strdeq	r0, [r0], -r8
   4:	00000100 	andeq	r0, r0, r0, lsl #2
   8:	000001dc 	ldrdeq	r0, [r0], -ip
   c:	000001fc 	strdeq	r0, [r0], -ip
	...
  18:	00000100 	andeq	r0, r0, r0, lsl #2
  1c:	00000104 	andeq	r0, r0, r4, lsl #2
  20:	000001fc 	strdeq	r0, [r0], -ip
  24:	0000021c 	andeq	r0, r0, ip, lsl r2
	...
