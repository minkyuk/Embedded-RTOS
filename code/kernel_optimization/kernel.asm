
kernel_optimization/kernel.elf:     file format elf32-littlearm


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
    8038:	eb00005d 	bl	81b4 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	0012d000 	andseq	sp, r2, r0
    8048:	0011c000 	andseq	ip, r1, r0
    804c:	0000b000 	andeq	fp, r0, r0
    8050:	0000c000 	andeq	ip, r0, r0

00008054 <gpio_config>:
    8054:	e3510007 	cmp	r1, #7
    8058:	93500035 	cmpls	r0, #53	; 0x35
    805c:	812fff1e 	bxhi	lr
    8060:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8064:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8068:	e0832290 	umull	r2, r3, r0, r2
    806c:	e1a0c1a3 	lsr	ip, r3, #3
    8070:	e6ef307c 	uxtb	r3, ip
    8074:	e1a03103 	lsl	r3, r3, #2
    8078:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    807c:	e2833602 	add	r3, r3, #2097152	; 0x200000
    8080:	e5932000 	ldr	r2, [r3]
    8084:	e08cc10c 	add	ip, ip, ip, lsl #2
    8088:	e040008c 	sub	r0, r0, ip, lsl #1
    808c:	e6ef0070 	uxtb	r0, r0
    8090:	e0800080 	add	r0, r0, r0, lsl #1
    8094:	e3a0c007 	mov	ip, #7
    8098:	e1c2201c 	bic	r2, r2, ip, lsl r0
    809c:	e1820011 	orr	r0, r2, r1, lsl r0
    80a0:	e5830000 	str	r0, [r3]
    80a4:	e12fff1e 	bx	lr

000080a8 <gpio_set>:
    80a8:	e3500035 	cmp	r0, #53	; 0x35
    80ac:	812fff1e 	bxhi	lr
    80b0:	e350001f 	cmp	r0, #31
    80b4:	9a000006 	bls	80d4 <gpio_set+0x2c>
    80b8:	e2400020 	sub	r0, r0, #32
    80bc:	e3a03001 	mov	r3, #1
    80c0:	e1a00013 	lsl	r0, r3, r0
    80c4:	e3a03000 	mov	r3, #0
    80c8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80cc:	e5830020 	str	r0, [r3, #32]
    80d0:	e12fff1e 	bx	lr
    80d4:	e3a03001 	mov	r3, #1
    80d8:	e1a00013 	lsl	r0, r3, r0
    80dc:	e3a03000 	mov	r3, #0
    80e0:	e3433f20 	movt	r3, #16160	; 0x3f20
    80e4:	e583001c 	str	r0, [r3, #28]
    80e8:	e12fff1e 	bx	lr

000080ec <gpio_clr>:
    80ec:	e3500035 	cmp	r0, #53	; 0x35
    80f0:	812fff1e 	bxhi	lr
    80f4:	e350001f 	cmp	r0, #31
    80f8:	9a000006 	bls	8118 <gpio_clr+0x2c>
    80fc:	e2400020 	sub	r0, r0, #32
    8100:	e3a03001 	mov	r3, #1
    8104:	e1a00013 	lsl	r0, r3, r0
    8108:	e3a03000 	mov	r3, #0
    810c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8110:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8114:	e12fff1e 	bx	lr
    8118:	e3a03001 	mov	r3, #1
    811c:	e1a00013 	lsl	r0, r3, r0
    8120:	e3a03000 	mov	r3, #0
    8124:	e3433f20 	movt	r3, #16160	; 0x3f20
    8128:	e5830028 	str	r0, [r3, #40]	; 0x28
    812c:	e12fff1e 	bx	lr

00008130 <gpio_set_pull>:
    8130:	e3510002 	cmp	r1, #2
    8134:	93500035 	cmpls	r0, #53	; 0x35
    8138:	812fff1e 	bxhi	lr
    813c:	e92d4038 	push	{r3, r4, r5, lr}
    8140:	e1a04000 	mov	r4, r0
    8144:	e3a03000 	mov	r3, #0
    8148:	e3433f20 	movt	r3, #16160	; 0x3f20
    814c:	e5831094 	str	r1, [r3, #148]	; 0x94
    8150:	e3a00096 	mov	r0, #150	; 0x96
    8154:	eb0001a0 	bl	87dc <delay_cycles>
    8158:	e354001f 	cmp	r4, #31
    815c:	9a00000a 	bls	818c <gpio_set_pull+0x5c>
    8160:	e2440020 	sub	r0, r4, #32
    8164:	e3a04001 	mov	r4, #1
    8168:	e1a00014 	lsl	r0, r4, r0
    816c:	e3a05000 	mov	r5, #0
    8170:	e3435f20 	movt	r5, #16160	; 0x3f20
    8174:	e585009c 	str	r0, [r5, #156]	; 0x9c
    8178:	e3a00096 	mov	r0, #150	; 0x96
    817c:	eb000196 	bl	87dc <delay_cycles>
    8180:	e3a03000 	mov	r3, #0
    8184:	e585309c 	str	r3, [r5, #156]	; 0x9c
    8188:	e8bd8038 	pop	{r3, r4, r5, pc}
    818c:	e3a00001 	mov	r0, #1
    8190:	e1a00410 	lsl	r0, r0, r4
    8194:	e3a05000 	mov	r5, #0
    8198:	e3435f20 	movt	r5, #16160	; 0x3f20
    819c:	e5850098 	str	r0, [r5, #152]	; 0x98
    81a0:	e3a00096 	mov	r0, #150	; 0x96
    81a4:	eb00018c 	bl	87dc <delay_cycles>
    81a8:	e3a03000 	mov	r3, #0
    81ac:	e5853098 	str	r3, [r5, #152]	; 0x98
    81b0:	e8bd8038 	pop	{r3, r4, r5, pc}

000081b4 <kernel_main>:
    81b4:	e92d4800 	push	{fp, lr}
    81b8:	e28db004 	add	fp, sp, #4
    81bc:	e24dd010 	sub	sp, sp, #16
    81c0:	e3a03001 	mov	r3, #1
    81c4:	e50b300c 	str	r3, [fp, #-12]
    81c8:	eb000131 	bl	8694 <uart_init>
    81cc:	e3a03000 	mov	r3, #0
    81d0:	e50b3008 	str	r3, [fp, #-8]
    81d4:	ea00000c 	b	820c <kernel_main+0x58>
    81d8:	e30b37d0 	movw	r3, #47056	; 0xb7d0
    81dc:	e3403000 	movt	r3, #0
    81e0:	e51b2008 	ldr	r2, [fp, #-8]
    81e4:	e51b1008 	ldr	r1, [fp, #-8]
    81e8:	e7831102 	str	r1, [r3, r2, lsl #2]
    81ec:	e30b3000 	movw	r3, #45056	; 0xb000
    81f0:	e3403000 	movt	r3, #0
    81f4:	e51b2008 	ldr	r2, [fp, #-8]
    81f8:	e51b1008 	ldr	r1, [fp, #-8]
    81fc:	e7831102 	str	r1, [r3, r2, lsl #2]
    8200:	e51b3008 	ldr	r3, [fp, #-8]
    8204:	e2833001 	add	r3, r3, #1
    8208:	e50b3008 	str	r3, [fp, #-8]
    820c:	e51b3008 	ldr	r3, [fp, #-8]
    8210:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8214:	baffffef 	blt	81d8 <kernel_main+0x24>
    8218:	e3090000 	movw	r0, #36864	; 0x9000
    821c:	e3400000 	movt	r0, #0
    8220:	eb000087 	bl	8444 <printk>
    8224:	eb000155 	bl	8780 <tic>
    8228:	e30b07d0 	movw	r0, #47056	; 0xb7d0
    822c:	e3400000 	movt	r0, #0
    8230:	eb0001e1 	bl	89bc <optimize_me>
    8234:	eb00015e 	bl	87b4 <toc>
    8238:	e50b0010 	str	r0, [fp, #-16]
    823c:	e3090024 	movw	r0, #36900	; 0x9024
    8240:	e3400000 	movt	r0, #0
    8244:	e51b1010 	ldr	r1, [fp, #-16]
    8248:	eb00007d 	bl	8444 <printk>
    824c:	e3090028 	movw	r0, #36904	; 0x9028
    8250:	e3400000 	movt	r0, #0
    8254:	eb00007a 	bl	8444 <printk>
    8258:	eb000148 	bl	8780 <tic>
    825c:	e30b0000 	movw	r0, #45056	; 0xb000
    8260:	e3400000 	movt	r0, #0
    8264:	eb00017e 	bl	8864 <unoptimized>
    8268:	eb000151 	bl	87b4 <toc>
    826c:	e50b0010 	str	r0, [fp, #-16]
    8270:	e3090024 	movw	r0, #36900	; 0x9024
    8274:	e3400000 	movt	r0, #0
    8278:	e51b1010 	ldr	r1, [fp, #-16]
    827c:	eb000070 	bl	8444 <printk>
    8280:	e3a03000 	mov	r3, #0
    8284:	e50b3008 	str	r3, [fp, #-8]
    8288:	ea000012 	b	82d8 <kernel_main+0x124>
    828c:	e30b37d0 	movw	r3, #47056	; 0xb7d0
    8290:	e3403000 	movt	r3, #0
    8294:	e51b2008 	ldr	r2, [fp, #-8]
    8298:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    829c:	e30b3000 	movw	r3, #45056	; 0xb000
    82a0:	e3403000 	movt	r3, #0
    82a4:	e51b1008 	ldr	r1, [fp, #-8]
    82a8:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    82ac:	e1520003 	cmp	r2, r3
    82b0:	0a000005 	beq	82cc <kernel_main+0x118>
    82b4:	e309004c 	movw	r0, #36940	; 0x904c
    82b8:	e3400000 	movt	r0, #0
    82bc:	eb000060 	bl	8444 <printk>
    82c0:	e3a03000 	mov	r3, #0
    82c4:	e50b300c 	str	r3, [fp, #-12]
    82c8:	ea000005 	b	82e4 <kernel_main+0x130>
    82cc:	e51b3008 	ldr	r3, [fp, #-8]
    82d0:	e2833001 	add	r3, r3, #1
    82d4:	e50b3008 	str	r3, [fp, #-8]
    82d8:	e51b3008 	ldr	r3, [fp, #-8]
    82dc:	e3530f7d 	cmp	r3, #500	; 0x1f4
    82e0:	baffffe9 	blt	828c <kernel_main+0xd8>
    82e4:	e51b300c 	ldr	r3, [fp, #-12]
    82e8:	e3530000 	cmp	r3, #0
    82ec:	0a000002 	beq	82fc <kernel_main+0x148>
    82f0:	e3090068 	movw	r0, #36968	; 0x9068
    82f4:	e3400000 	movt	r0, #0
    82f8:	eb000051 	bl	8444 <printk>
    82fc:	e30806a0 	movw	r0, #34464	; 0x86a0
    8300:	e3400001 	movt	r0, #1
    8304:	eb000134 	bl	87dc <delay_cycles>
    8308:	eafffffb 	b	82fc <kernel_main+0x148>

0000830c <printnumk>:
    830c:	e92d4810 	push	{r4, fp, lr}
    8310:	e28db008 	add	fp, sp, #8
    8314:	e24dd024 	sub	sp, sp, #36	; 0x24
    8318:	e1a01000 	mov	r1, r0
    831c:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    8320:	e1a03001 	mov	r3, r1
    8324:	e54b301d 	strb	r3, [fp, #-29]
    8328:	e3a03000 	mov	r3, #0
    832c:	e50b3010 	str	r3, [fp, #-16]
    8330:	e24b301c 	sub	r3, fp, #28
    8334:	e2833007 	add	r3, r3, #7
    8338:	e50b3014 	str	r3, [fp, #-20]
    833c:	e55b301d 	ldrb	r3, [fp, #-29]
    8340:	e3530008 	cmp	r3, #8
    8344:	1a000003 	bne	8358 <printnumk+0x4c>
    8348:	e3093084 	movw	r3, #36996	; 0x9084
    834c:	e3403000 	movt	r3, #0
    8350:	e50b3010 	str	r3, [fp, #-16]
    8354:	ea000005 	b	8370 <printnumk+0x64>
    8358:	e55b301d 	ldrb	r3, [fp, #-29]
    835c:	e3530010 	cmp	r3, #16
    8360:	1a000002 	bne	8370 <printnumk+0x64>
    8364:	e3093088 	movw	r3, #37000	; 0x9088
    8368:	e3403000 	movt	r3, #0
    836c:	e50b3010 	str	r3, [fp, #-16]
    8370:	e51b4014 	ldr	r4, [fp, #-20]
    8374:	e2443001 	sub	r3, r4, #1
    8378:	e50b3014 	str	r3, [fp, #-20]
    837c:	e55b201d 	ldrb	r2, [fp, #-29]
    8380:	e3a03000 	mov	r3, #0
    8384:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    8388:	eb0001d0 	bl	8ad0 <__aeabi_uldivmod>
    838c:	e1a00002 	mov	r0, r2
    8390:	e1a01003 	mov	r1, r3
    8394:	e30a3000 	movw	r3, #40960	; 0xa000
    8398:	e3403000 	movt	r3, #0
    839c:	e0833000 	add	r3, r3, r0
    83a0:	e5d33000 	ldrb	r3, [r3]
    83a4:	e5c43000 	strb	r3, [r4]
    83a8:	e55b201d 	ldrb	r2, [fp, #-29]
    83ac:	e3a03000 	mov	r3, #0
    83b0:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    83b4:	eb0001c5 	bl	8ad0 <__aeabi_uldivmod>
    83b8:	e1a02000 	mov	r2, r0
    83bc:	e1a03001 	mov	r3, r1
    83c0:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    83c4:	e14b22dc 	ldrd	r2, [fp, #-44]	; 0xffffffd4
    83c8:	e1923003 	orrs	r3, r2, r3
    83cc:	1affffe7 	bne	8370 <printnumk+0x64>
    83d0:	e51b3010 	ldr	r3, [fp, #-16]
    83d4:	e3530000 	cmp	r3, #0
    83d8:	0a00000a 	beq	8408 <printnumk+0xfc>
    83dc:	ea000005 	b	83f8 <printnumk+0xec>
    83e0:	e51b3010 	ldr	r3, [fp, #-16]
    83e4:	e2832001 	add	r2, r3, #1
    83e8:	e50b2010 	str	r2, [fp, #-16]
    83ec:	e5d33000 	ldrb	r3, [r3]
    83f0:	e1a00003 	mov	r0, r3
    83f4:	eb0000b0 	bl	86bc <uart_put_byte>
    83f8:	e51b3010 	ldr	r3, [fp, #-16]
    83fc:	e5d33000 	ldrb	r3, [r3]
    8400:	e3530000 	cmp	r3, #0
    8404:	1afffff5 	bne	83e0 <printnumk+0xd4>
    8408:	ea000003 	b	841c <printnumk+0x110>
    840c:	e51b3014 	ldr	r3, [fp, #-20]
    8410:	e5d33000 	ldrb	r3, [r3]
    8414:	e1a00003 	mov	r0, r3
    8418:	eb0000a7 	bl	86bc <uart_put_byte>
    841c:	e51b3014 	ldr	r3, [fp, #-20]
    8420:	e2833001 	add	r3, r3, #1
    8424:	e50b3014 	str	r3, [fp, #-20]
    8428:	e24b301c 	sub	r3, fp, #28
    842c:	e2833008 	add	r3, r3, #8
    8430:	e51b2014 	ldr	r2, [fp, #-20]
    8434:	e1520003 	cmp	r2, r3
    8438:	1afffff3 	bne	840c <printnumk+0x100>
    843c:	e24bd008 	sub	sp, fp, #8
    8440:	e8bd8810 	pop	{r4, fp, pc}

00008444 <printk>:
    8444:	e92d000f 	push	{r0, r1, r2, r3}
    8448:	e92d4800 	push	{fp, lr}
    844c:	e28db004 	add	fp, sp, #4
    8450:	e24dd020 	sub	sp, sp, #32
    8454:	e28b3008 	add	r3, fp, #8
    8458:	e50b3020 	str	r3, [fp, #-32]
    845c:	ea000082 	b	866c <printk+0x228>
    8460:	e59b3004 	ldr	r3, [fp, #4]
    8464:	e5d33000 	ldrb	r3, [r3]
    8468:	e3530025 	cmp	r3, #37	; 0x25
    846c:	0a000006 	beq	848c <printk+0x48>
    8470:	e59b3004 	ldr	r3, [fp, #4]
    8474:	e2832001 	add	r2, r3, #1
    8478:	e58b2004 	str	r2, [fp, #4]
    847c:	e5d33000 	ldrb	r3, [r3]
    8480:	e1a00003 	mov	r0, r3
    8484:	eb00008c 	bl	86bc <uart_put_byte>
    8488:	ea000077 	b	866c <printk+0x228>
    848c:	e59b3004 	ldr	r3, [fp, #4]
    8490:	e2833001 	add	r3, r3, #1
    8494:	e58b3004 	str	r3, [fp, #4]
    8498:	e59b3004 	ldr	r3, [fp, #4]
    849c:	e5d33000 	ldrb	r3, [r3]
    84a0:	e353006f 	cmp	r3, #111	; 0x6f
    84a4:	0a000036 	beq	8584 <printk+0x140>
    84a8:	e353006f 	cmp	r3, #111	; 0x6f
    84ac:	ca000006 	bgt	84cc <printk+0x88>
    84b0:	e3530063 	cmp	r3, #99	; 0x63
    84b4:	0a00005a 	beq	8624 <printk+0x1e0>
    84b8:	e3530064 	cmp	r3, #100	; 0x64
    84bc:	0a00000e 	beq	84fc <printk+0xb8>
    84c0:	e3530025 	cmp	r3, #37	; 0x25
    84c4:	0a000060 	beq	864c <printk+0x208>
    84c8:	ea000062 	b	8658 <printk+0x214>
    84cc:	e3530073 	cmp	r3, #115	; 0x73
    84d0:	0a000041 	beq	85dc <printk+0x198>
    84d4:	e3530073 	cmp	r3, #115	; 0x73
    84d8:	ca000002 	bgt	84e8 <printk+0xa4>
    84dc:	e3530070 	cmp	r3, #112	; 0x70
    84e0:	0a000032 	beq	85b0 <printk+0x16c>
    84e4:	ea00005b 	b	8658 <printk+0x214>
    84e8:	e3530075 	cmp	r3, #117	; 0x75
    84ec:	0a000019 	beq	8558 <printk+0x114>
    84f0:	e3530078 	cmp	r3, #120	; 0x78
    84f4:	0a00002d 	beq	85b0 <printk+0x16c>
    84f8:	ea000056 	b	8658 <printk+0x214>
    84fc:	e51b3020 	ldr	r3, [fp, #-32]
    8500:	e2832004 	add	r2, r3, #4
    8504:	e50b2020 	str	r2, [fp, #-32]
    8508:	e5933000 	ldr	r3, [r3]
    850c:	e50b300c 	str	r3, [fp, #-12]
    8510:	e51b300c 	ldr	r3, [fp, #-12]
    8514:	e3530000 	cmp	r3, #0
    8518:	aa000008 	bge	8540 <printk+0xfc>
    851c:	e3a0002d 	mov	r0, #45	; 0x2d
    8520:	eb000065 	bl	86bc <uart_put_byte>
    8524:	e51b300c 	ldr	r3, [fp, #-12]
    8528:	e2633000 	rsb	r3, r3, #0
    852c:	e1a02003 	mov	r2, r3
    8530:	e1a03fc2 	asr	r3, r2, #31
    8534:	e3a0000a 	mov	r0, #10
    8538:	ebffff73 	bl	830c <printnumk>
    853c:	ea000047 	b	8660 <printk+0x21c>
    8540:	e51b300c 	ldr	r3, [fp, #-12]
    8544:	e1a02003 	mov	r2, r3
    8548:	e1a03fc2 	asr	r3, r2, #31
    854c:	e3a0000a 	mov	r0, #10
    8550:	ebffff6d 	bl	830c <printnumk>
    8554:	ea000041 	b	8660 <printk+0x21c>
    8558:	e51b3020 	ldr	r3, [fp, #-32]
    855c:	e2832004 	add	r2, r3, #4
    8560:	e50b2020 	str	r2, [fp, #-32]
    8564:	e5933000 	ldr	r3, [r3]
    8568:	e50b3010 	str	r3, [fp, #-16]
    856c:	e51b3010 	ldr	r3, [fp, #-16]
    8570:	e1a02003 	mov	r2, r3
    8574:	e3a03000 	mov	r3, #0
    8578:	e3a0000a 	mov	r0, #10
    857c:	ebffff62 	bl	830c <printnumk>
    8580:	ea000036 	b	8660 <printk+0x21c>
    8584:	e51b3020 	ldr	r3, [fp, #-32]
    8588:	e2832004 	add	r2, r3, #4
    858c:	e50b2020 	str	r2, [fp, #-32]
    8590:	e5933000 	ldr	r3, [r3]
    8594:	e50b3014 	str	r3, [fp, #-20]
    8598:	e51b3014 	ldr	r3, [fp, #-20]
    859c:	e1a02003 	mov	r2, r3
    85a0:	e3a03000 	mov	r3, #0
    85a4:	e3a00008 	mov	r0, #8
    85a8:	ebffff57 	bl	830c <printnumk>
    85ac:	ea00002b 	b	8660 <printk+0x21c>
    85b0:	e51b3020 	ldr	r3, [fp, #-32]
    85b4:	e2832004 	add	r2, r3, #4
    85b8:	e50b2020 	str	r2, [fp, #-32]
    85bc:	e5933000 	ldr	r3, [r3]
    85c0:	e50b3018 	str	r3, [fp, #-24]
    85c4:	e51b3018 	ldr	r3, [fp, #-24]
    85c8:	e1a02003 	mov	r2, r3
    85cc:	e3a03000 	mov	r3, #0
    85d0:	e3a00010 	mov	r0, #16
    85d4:	ebffff4c 	bl	830c <printnumk>
    85d8:	ea000020 	b	8660 <printk+0x21c>
    85dc:	e51b3020 	ldr	r3, [fp, #-32]
    85e0:	e2832004 	add	r2, r3, #4
    85e4:	e50b2020 	str	r2, [fp, #-32]
    85e8:	e5933000 	ldr	r3, [r3]
    85ec:	e50b3008 	str	r3, [fp, #-8]
    85f0:	ea000006 	b	8610 <printk+0x1cc>
    85f4:	e51b3008 	ldr	r3, [fp, #-8]
    85f8:	e5d33000 	ldrb	r3, [r3]
    85fc:	e1a00003 	mov	r0, r3
    8600:	eb00002d 	bl	86bc <uart_put_byte>
    8604:	e51b3008 	ldr	r3, [fp, #-8]
    8608:	e2833001 	add	r3, r3, #1
    860c:	e50b3008 	str	r3, [fp, #-8]
    8610:	e51b3008 	ldr	r3, [fp, #-8]
    8614:	e5d33000 	ldrb	r3, [r3]
    8618:	e3530000 	cmp	r3, #0
    861c:	1afffff4 	bne	85f4 <printk+0x1b0>
    8620:	ea00000e 	b	8660 <printk+0x21c>
    8624:	e51b3020 	ldr	r3, [fp, #-32]
    8628:	e2832004 	add	r2, r3, #4
    862c:	e50b2020 	str	r2, [fp, #-32]
    8630:	e5933000 	ldr	r3, [r3]
    8634:	e50b301c 	str	r3, [fp, #-28]
    8638:	e51b301c 	ldr	r3, [fp, #-28]
    863c:	e6ef3073 	uxtb	r3, r3
    8640:	e1a00003 	mov	r0, r3
    8644:	eb00001c 	bl	86bc <uart_put_byte>
    8648:	ea000004 	b	8660 <printk+0x21c>
    864c:	e3a00025 	mov	r0, #37	; 0x25
    8650:	eb000019 	bl	86bc <uart_put_byte>
    8654:	ea000001 	b	8660 <printk+0x21c>
    8658:	e3e03000 	mvn	r3, #0
    865c:	ea000007 	b	8680 <printk+0x23c>
    8660:	e59b3004 	ldr	r3, [fp, #4]
    8664:	e2833001 	add	r3, r3, #1
    8668:	e58b3004 	str	r3, [fp, #4]
    866c:	e59b3004 	ldr	r3, [fp, #4]
    8670:	e5d33000 	ldrb	r3, [r3]
    8674:	e3530000 	cmp	r3, #0
    8678:	1affff78 	bne	8460 <printk+0x1c>
    867c:	e3a03000 	mov	r3, #0
    8680:	e1a00003 	mov	r0, r3
    8684:	e24bd004 	sub	sp, fp, #4
    8688:	e8bd4800 	pop	{fp, lr}
    868c:	e28dd010 	add	sp, sp, #16
    8690:	e12fff1e 	bx	lr

00008694 <uart_init>:
    8694:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8698:	e28db000 	add	fp, sp, #0
    869c:	e24bd000 	sub	sp, fp, #0
    86a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86a4:	e12fff1e 	bx	lr

000086a8 <uart_close>:
    86a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86ac:	e28db000 	add	fp, sp, #0
    86b0:	e24bd000 	sub	sp, fp, #0
    86b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86b8:	e12fff1e 	bx	lr

000086bc <uart_put_byte>:
    86bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86c0:	e28db000 	add	fp, sp, #0
    86c4:	e24dd00c 	sub	sp, sp, #12
    86c8:	e1a03000 	mov	r3, r0
    86cc:	e54b3005 	strb	r3, [fp, #-5]
    86d0:	e24bd000 	sub	sp, fp, #0
    86d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86d8:	e12fff1e 	bx	lr

000086dc <uart_get_byte>:
    86dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86e0:	e28db000 	add	fp, sp, #0
    86e4:	e3a03000 	mov	r3, #0
    86e8:	e1a00003 	mov	r0, r3
    86ec:	e24bd000 	sub	sp, fp, #0
    86f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    86f4:	e12fff1e 	bx	lr

000086f8 <timer_start>:
    86f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86fc:	e28db000 	add	fp, sp, #0
    8700:	e24dd00c 	sub	sp, sp, #12
    8704:	e50b0008 	str	r0, [fp, #-8]
    8708:	e1a00000 	nop			; (mov r0, r0)
    870c:	e24bd000 	sub	sp, fp, #0
    8710:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8714:	e12fff1e 	bx	lr

00008718 <timer_stop>:
    8718:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    871c:	e28db000 	add	fp, sp, #0
    8720:	e1a00000 	nop			; (mov r0, r0)
    8724:	e24bd000 	sub	sp, fp, #0
    8728:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    872c:	e12fff1e 	bx	lr

00008730 <timer_read>:
    8730:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8734:	e28db000 	add	fp, sp, #0
    8738:	e3a03000 	mov	r3, #0
    873c:	e1a00003 	mov	r0, r3
    8740:	e24bd000 	sub	sp, fp, #0
    8744:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8748:	e12fff1e 	bx	lr

0000874c <timer_is_pending>:
    874c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8750:	e28db000 	add	fp, sp, #0
    8754:	e3a03000 	mov	r3, #0
    8758:	e1a00003 	mov	r0, r3
    875c:	e24bd000 	sub	sp, fp, #0
    8760:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8764:	e12fff1e 	bx	lr

00008768 <timer_clear_pending>:
    8768:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    876c:	e28db000 	add	fp, sp, #0
    8770:	e1a00000 	nop			; (mov r0, r0)
    8774:	e24bd000 	sub	sp, fp, #0
    8778:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    877c:	e12fff1e 	bx	lr

00008780 <tic>:
    8780:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8784:	e28db000 	add	fp, sp, #0
    8788:	e3a03b2d 	mov	r3, #46080	; 0xb400
    878c:	e3433f00 	movt	r3, #16128	; 0x3f00
    8790:	e3e02000 	mvn	r2, #0
    8794:	e5832000 	str	r2, [r3]
    8798:	e30b3408 	movw	r3, #46088	; 0xb408
    879c:	e3433f00 	movt	r3, #16128	; 0x3f00
    87a0:	e3a02082 	mov	r2, #130	; 0x82
    87a4:	e5832000 	str	r2, [r3]
    87a8:	e24bd000 	sub	sp, fp, #0
    87ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    87b0:	e12fff1e 	bx	lr

000087b4 <toc>:
    87b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    87b8:	e28db000 	add	fp, sp, #0
    87bc:	e30b3404 	movw	r3, #46084	; 0xb404
    87c0:	e3433f00 	movt	r3, #16128	; 0x3f00
    87c4:	e5933000 	ldr	r3, [r3]
    87c8:	e1e03003 	mvn	r3, r3
    87cc:	e1a00003 	mov	r0, r3
    87d0:	e24bd000 	sub	sp, fp, #0
    87d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    87d8:	e12fff1e 	bx	lr

000087dc <delay_cycles>:
    87dc:	e2500001 	subs	r0, r0, #1
    87e0:	1afffffd 	bne	87dc <delay_cycles>
    87e4:	e1a0f00e 	mov	pc, lr

000087e8 <read_cpsr>:
    87e8:	e10f0000 	mrs	r0, CPSR
    87ec:	e1a0f00e 	mov	pc, lr

000087f0 <write_cpsr>:
    87f0:	e129f000 	msr	CPSR_fc, r0
    87f4:	e1a0f00e 	mov	pc, lr

000087f8 <disable_interrupts>:
    87f8:	e10f0000 	mrs	r0, CPSR
    87fc:	e3a01d07 	mov	r1, #448	; 0x1c0
    8800:	e1800001 	orr	r0, r0, r1
    8804:	e129f000 	msr	CPSR_fc, r0
    8808:	e1a0f00e 	mov	pc, lr

0000880c <enable_interrupts>:
    880c:	e10f0000 	mrs	r0, CPSR
    8810:	e3a01d07 	mov	r1, #448	; 0x1c0
    8814:	e1c00001 	bic	r0, r0, r1
    8818:	e129f000 	msr	CPSR_fc, r0
    881c:	e1a0f00e 	mov	pc, lr

00008820 <func2>:
    8820:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8824:	e28db000 	add	fp, sp, #0
    8828:	e24dd00c 	sub	sp, sp, #12
    882c:	e50b0008 	str	r0, [fp, #-8]
    8830:	e50b100c 	str	r1, [fp, #-12]
    8834:	e51b200c 	ldr	r2, [fp, #-12]
    8838:	e1a03002 	mov	r3, r2
    883c:	e1a03103 	lsl	r3, r3, #2
    8840:	e0833002 	add	r3, r3, r2
    8844:	e1a02103 	lsl	r2, r3, #2
    8848:	e0832002 	add	r2, r3, r2
    884c:	e51b3008 	ldr	r3, [fp, #-8]
    8850:	e0823003 	add	r3, r2, r3
    8854:	e1a00003 	mov	r0, r3
    8858:	e24bd000 	sub	sp, fp, #0
    885c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8860:	e12fff1e 	bx	lr

00008864 <unoptimized>:
    8864:	e92d4870 	push	{r4, r5, r6, fp, lr}
    8868:	e28db010 	add	fp, sp, #16
    886c:	e24dd01c 	sub	sp, sp, #28
    8870:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    8874:	e3a03000 	mov	r3, #0
    8878:	e50b3018 	str	r3, [fp, #-24]
    887c:	ea000037 	b	8960 <unoptimized+0xfc>
    8880:	e3a03011 	mov	r3, #17
    8884:	e50b3020 	str	r3, [fp, #-32]
    8888:	e3a03000 	mov	r3, #0
    888c:	e50b301c 	str	r3, [fp, #-28]
    8890:	ea00002c 	b	8948 <unoptimized+0xe4>
    8894:	e3a03002 	mov	r3, #2
    8898:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    889c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    88a0:	e2833001 	add	r3, r3, #1
    88a4:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    88a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    88ac:	e2432002 	sub	r2, r3, #2
    88b0:	e1a03002 	mov	r3, r2
    88b4:	e1a03083 	lsl	r3, r3, #1
    88b8:	e0833002 	add	r3, r3, r2
    88bc:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    88c0:	e51b301c 	ldr	r3, [fp, #-28]
    88c4:	e1a03103 	lsl	r3, r3, #2
    88c8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    88cc:	e0824003 	add	r4, r2, r3
    88d0:	e51b301c 	ldr	r3, [fp, #-28]
    88d4:	e1a03103 	lsl	r3, r3, #2
    88d8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    88dc:	e0823003 	add	r3, r2, r3
    88e0:	e5933000 	ldr	r3, [r3]
    88e4:	e51b2020 	ldr	r2, [fp, #-32]
    88e8:	e0030392 	mul	r3, r2, r3
    88ec:	e2835010 	add	r5, r3, #16
    88f0:	e51b3018 	ldr	r3, [fp, #-24]
    88f4:	e1a03103 	lsl	r3, r3, #2
    88f8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    88fc:	e0823003 	add	r3, r2, r3
    8900:	e5936000 	ldr	r6, [r3]
    8904:	e51b0018 	ldr	r0, [fp, #-24]
    8908:	e51b101c 	ldr	r1, [fp, #-28]
    890c:	ebffffc3 	bl	8820 <func2>
    8910:	e1a03000 	mov	r3, r0
    8914:	e0030396 	mul	r3, r6, r3
    8918:	e0852003 	add	r2, r5, r3
    891c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8920:	e0823003 	add	r3, r2, r3
    8924:	e283200f 	add	r2, r3, #15
    8928:	e3530000 	cmp	r3, #0
    892c:	b1a03002 	movlt	r3, r2
    8930:	a1a03003 	movge	r3, r3
    8934:	e1a03243 	asr	r3, r3, #4
    8938:	e5843000 	str	r3, [r4]
    893c:	e51b301c 	ldr	r3, [fp, #-28]
    8940:	e2833001 	add	r3, r3, #1
    8944:	e50b301c 	str	r3, [fp, #-28]
    8948:	e51b301c 	ldr	r3, [fp, #-28]
    894c:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8950:	baffffcf 	blt	8894 <unoptimized+0x30>
    8954:	e51b3018 	ldr	r3, [fp, #-24]
    8958:	e2833001 	add	r3, r3, #1
    895c:	e50b3018 	str	r3, [fp, #-24]
    8960:	e51b3018 	ldr	r3, [fp, #-24]
    8964:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8968:	baffffc4 	blt	8880 <unoptimized+0x1c>
    896c:	e24bd010 	sub	sp, fp, #16
    8970:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8974:	e12fff1e 	bx	lr

00008978 <func>:
    8978:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    897c:	e28db000 	add	fp, sp, #0
    8980:	e24dd00c 	sub	sp, sp, #12
    8984:	e50b0008 	str	r0, [fp, #-8]
    8988:	e50b100c 	str	r1, [fp, #-12]
    898c:	e51b200c 	ldr	r2, [fp, #-12]
    8990:	e1a03002 	mov	r3, r2
    8994:	e1a03103 	lsl	r3, r3, #2
    8998:	e0833002 	add	r3, r3, r2
    899c:	e1a02103 	lsl	r2, r3, #2
    89a0:	e0832002 	add	r2, r3, r2
    89a4:	e51b3008 	ldr	r3, [fp, #-8]
    89a8:	e0823003 	add	r3, r2, r3
    89ac:	e1a00003 	mov	r0, r3
    89b0:	e24bd000 	sub	sp, fp, #0
    89b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    89b8:	e12fff1e 	bx	lr

000089bc <optimize_me>:
    89bc:	e92d4870 	push	{r4, r5, r6, fp, lr}
    89c0:	e28db010 	add	fp, sp, #16
    89c4:	e24dd01c 	sub	sp, sp, #28
    89c8:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    89cc:	e3a03000 	mov	r3, #0
    89d0:	e50b3018 	str	r3, [fp, #-24]
    89d4:	ea000037 	b	8ab8 <optimize_me+0xfc>
    89d8:	e3a03011 	mov	r3, #17
    89dc:	e50b3020 	str	r3, [fp, #-32]
    89e0:	e3a03000 	mov	r3, #0
    89e4:	e50b301c 	str	r3, [fp, #-28]
    89e8:	ea00002c 	b	8aa0 <optimize_me+0xe4>
    89ec:	e3a03002 	mov	r3, #2
    89f0:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    89f4:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    89f8:	e2833001 	add	r3, r3, #1
    89fc:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a00:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8a04:	e2432002 	sub	r2, r3, #2
    8a08:	e1a03002 	mov	r3, r2
    8a0c:	e1a03083 	lsl	r3, r3, #1
    8a10:	e0833002 	add	r3, r3, r2
    8a14:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a18:	e51b301c 	ldr	r3, [fp, #-28]
    8a1c:	e1a03103 	lsl	r3, r3, #2
    8a20:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a24:	e0824003 	add	r4, r2, r3
    8a28:	e51b301c 	ldr	r3, [fp, #-28]
    8a2c:	e1a03103 	lsl	r3, r3, #2
    8a30:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a34:	e0823003 	add	r3, r2, r3
    8a38:	e5933000 	ldr	r3, [r3]
    8a3c:	e51b2020 	ldr	r2, [fp, #-32]
    8a40:	e0030392 	mul	r3, r2, r3
    8a44:	e2835010 	add	r5, r3, #16
    8a48:	e51b3018 	ldr	r3, [fp, #-24]
    8a4c:	e1a03103 	lsl	r3, r3, #2
    8a50:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a54:	e0823003 	add	r3, r2, r3
    8a58:	e5936000 	ldr	r6, [r3]
    8a5c:	e51b0018 	ldr	r0, [fp, #-24]
    8a60:	e51b101c 	ldr	r1, [fp, #-28]
    8a64:	ebffffc3 	bl	8978 <func>
    8a68:	e1a03000 	mov	r3, r0
    8a6c:	e0030396 	mul	r3, r6, r3
    8a70:	e0852003 	add	r2, r5, r3
    8a74:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8a78:	e0823003 	add	r3, r2, r3
    8a7c:	e283200f 	add	r2, r3, #15
    8a80:	e3530000 	cmp	r3, #0
    8a84:	b1a03002 	movlt	r3, r2
    8a88:	a1a03003 	movge	r3, r3
    8a8c:	e1a03243 	asr	r3, r3, #4
    8a90:	e5843000 	str	r3, [r4]
    8a94:	e51b301c 	ldr	r3, [fp, #-28]
    8a98:	e2833001 	add	r3, r3, #1
    8a9c:	e50b301c 	str	r3, [fp, #-28]
    8aa0:	e51b301c 	ldr	r3, [fp, #-28]
    8aa4:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8aa8:	baffffcf 	blt	89ec <optimize_me+0x30>
    8aac:	e51b3018 	ldr	r3, [fp, #-24]
    8ab0:	e2833001 	add	r3, r3, #1
    8ab4:	e50b3018 	str	r3, [fp, #-24]
    8ab8:	e51b3018 	ldr	r3, [fp, #-24]
    8abc:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8ac0:	baffffc4 	blt	89d8 <optimize_me+0x1c>
    8ac4:	e24bd010 	sub	sp, fp, #16
    8ac8:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8acc:	e12fff1e 	bx	lr

00008ad0 <__aeabi_uldivmod>:
    8ad0:	e3530000 	cmp	r3, #0
    8ad4:	03520000 	cmpeq	r2, #0
    8ad8:	1a000004 	bne	8af0 <__aeabi_uldivmod+0x20>
    8adc:	e3510000 	cmp	r1, #0
    8ae0:	03500000 	cmpeq	r0, #0
    8ae4:	13e01000 	mvnne	r1, #0
    8ae8:	13e00000 	mvnne	r0, #0
    8aec:	ea000027 	b	8b90 <__aeabi_idiv0>
    8af0:	e24dd008 	sub	sp, sp, #8
    8af4:	e92d6000 	push	{sp, lr}
    8af8:	eb000014 	bl	8b50 <__gnu_uldivmod_helper>
    8afc:	e59de004 	ldr	lr, [sp, #4]
    8b00:	e28dd008 	add	sp, sp, #8
    8b04:	e8bd000c 	pop	{r2, r3}
    8b08:	e12fff1e 	bx	lr

00008b0c <__gnu_ldivmod_helper>:
    8b0c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8b10:	e59d6020 	ldr	r6, [sp, #32]
    8b14:	e1a07002 	mov	r7, r2
    8b18:	e1a0a003 	mov	sl, r3
    8b1c:	e1a04000 	mov	r4, r0
    8b20:	e1a05001 	mov	r5, r1
    8b24:	eb00001a 	bl	8b94 <__divdi3>
    8b28:	e1a03000 	mov	r3, r0
    8b2c:	e0020197 	mul	r2, r7, r1
    8b30:	e0898097 	umull	r8, r9, r7, r0
    8b34:	e023239a 	mla	r3, sl, r3, r2
    8b38:	e0544008 	subs	r4, r4, r8
    8b3c:	e0839009 	add	r9, r3, r9
    8b40:	e0c55009 	sbc	r5, r5, r9
    8b44:	e8860030 	stm	r6, {r4, r5}
    8b48:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8b4c:	e12fff1e 	bx	lr

00008b50 <__gnu_uldivmod_helper>:
    8b50:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8b54:	e59d5018 	ldr	r5, [sp, #24]
    8b58:	e1a04002 	mov	r4, r2
    8b5c:	e1a08003 	mov	r8, r3
    8b60:	e1a06000 	mov	r6, r0
    8b64:	e1a07001 	mov	r7, r1
    8b68:	eb000067 	bl	8d0c <__udivdi3>
    8b6c:	e0080890 	mul	r8, r0, r8
    8b70:	e0832490 	umull	r2, r3, r0, r4
    8b74:	e0248491 	mla	r4, r1, r4, r8
    8b78:	e0566002 	subs	r6, r6, r2
    8b7c:	e0843003 	add	r3, r4, r3
    8b80:	e0c77003 	sbc	r7, r7, r3
    8b84:	e88500c0 	stm	r5, {r6, r7}
    8b88:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b8c:	e12fff1e 	bx	lr

00008b90 <__aeabi_idiv0>:
    8b90:	e12fff1e 	bx	lr

00008b94 <__divdi3>:
    8b94:	e3510000 	cmp	r1, #0
    8b98:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8b9c:	a1a04000 	movge	r4, r0
    8ba0:	a1a05001 	movge	r5, r1
    8ba4:	a3a0a000 	movge	sl, #0
    8ba8:	ba000053 	blt	8cfc <__divdi3+0x168>
    8bac:	e3530000 	cmp	r3, #0
    8bb0:	a1a08002 	movge	r8, r2
    8bb4:	a1a09003 	movge	r9, r3
    8bb8:	ba00004b 	blt	8cec <__divdi3+0x158>
    8bbc:	e1550009 	cmp	r5, r9
    8bc0:	01540008 	cmpeq	r4, r8
    8bc4:	33a02000 	movcc	r2, #0
    8bc8:	33a03000 	movcc	r3, #0
    8bcc:	3a00003b 	bcc	8cc0 <__divdi3+0x12c>
    8bd0:	e1a01009 	mov	r1, r9
    8bd4:	e1a00008 	mov	r0, r8
    8bd8:	eb000093 	bl	8e2c <__clzdi2>
    8bdc:	e1a01005 	mov	r1, r5
    8be0:	e1a0b000 	mov	fp, r0
    8be4:	e1a00004 	mov	r0, r4
    8be8:	eb00008f 	bl	8e2c <__clzdi2>
    8bec:	e060000b 	rsb	r0, r0, fp
    8bf0:	e240e020 	sub	lr, r0, #32
    8bf4:	e1a07019 	lsl	r7, r9, r0
    8bf8:	e1877e18 	orr	r7, r7, r8, lsl lr
    8bfc:	e260c020 	rsb	ip, r0, #32
    8c00:	e1877c38 	orr	r7, r7, r8, lsr ip
    8c04:	e1550007 	cmp	r5, r7
    8c08:	e1a06018 	lsl	r6, r8, r0
    8c0c:	01540006 	cmpeq	r4, r6
    8c10:	e1a01000 	mov	r1, r0
    8c14:	33a02000 	movcc	r2, #0
    8c18:	33a03000 	movcc	r3, #0
    8c1c:	3a000005 	bcc	8c38 <__divdi3+0xa4>
    8c20:	e3a08001 	mov	r8, #1
    8c24:	e0544006 	subs	r4, r4, r6
    8c28:	e1a03e18 	lsl	r3, r8, lr
    8c2c:	e1833c38 	orr	r3, r3, r8, lsr ip
    8c30:	e0c55007 	sbc	r5, r5, r7
    8c34:	e1a02018 	lsl	r2, r8, r0
    8c38:	e3500000 	cmp	r0, #0
    8c3c:	0a00001f 	beq	8cc0 <__divdi3+0x12c>
    8c40:	e1b070a7 	lsrs	r7, r7, #1
    8c44:	e1a06066 	rrx	r6, r6
    8c48:	ea000007 	b	8c6c <__divdi3+0xd8>
    8c4c:	e0544006 	subs	r4, r4, r6
    8c50:	e0c55007 	sbc	r5, r5, r7
    8c54:	e0944004 	adds	r4, r4, r4
    8c58:	e0a55005 	adc	r5, r5, r5
    8c5c:	e2944001 	adds	r4, r4, #1
    8c60:	e2a55000 	adc	r5, r5, #0
    8c64:	e2500001 	subs	r0, r0, #1
    8c68:	0a000006 	beq	8c88 <__divdi3+0xf4>
    8c6c:	e1570005 	cmp	r7, r5
    8c70:	01560004 	cmpeq	r6, r4
    8c74:	9afffff4 	bls	8c4c <__divdi3+0xb8>
    8c78:	e0944004 	adds	r4, r4, r4
    8c7c:	e0a55005 	adc	r5, r5, r5
    8c80:	e2500001 	subs	r0, r0, #1
    8c84:	1afffff8 	bne	8c6c <__divdi3+0xd8>
    8c88:	e261c020 	rsb	ip, r1, #32
    8c8c:	e1a00134 	lsr	r0, r4, r1
    8c90:	e0922004 	adds	r2, r2, r4
    8c94:	e241e020 	sub	lr, r1, #32
    8c98:	e1800c15 	orr	r0, r0, r5, lsl ip
    8c9c:	e1a04135 	lsr	r4, r5, r1
    8ca0:	e1800e35 	orr	r0, r0, r5, lsr lr
    8ca4:	e1a07114 	lsl	r7, r4, r1
    8ca8:	e1877e10 	orr	r7, r7, r0, lsl lr
    8cac:	e1a06110 	lsl	r6, r0, r1
    8cb0:	e0a33005 	adc	r3, r3, r5
    8cb4:	e1877c30 	orr	r7, r7, r0, lsr ip
    8cb8:	e0522006 	subs	r2, r2, r6
    8cbc:	e0c33007 	sbc	r3, r3, r7
    8cc0:	e29a0000 	adds	r0, sl, #0
    8cc4:	13a00001 	movne	r0, #1
    8cc8:	e3a01000 	mov	r1, #0
    8ccc:	e2704000 	rsbs	r4, r0, #0
    8cd0:	e2e15000 	rsc	r5, r1, #0
    8cd4:	e0222004 	eor	r2, r2, r4
    8cd8:	e0233005 	eor	r3, r3, r5
    8cdc:	e0900002 	adds	r0, r0, r2
    8ce0:	e0a11003 	adc	r1, r1, r3
    8ce4:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8ce8:	e12fff1e 	bx	lr
    8cec:	e2728000 	rsbs	r8, r2, #0
    8cf0:	e1e0a00a 	mvn	sl, sl
    8cf4:	e2e39000 	rsc	r9, r3, #0
    8cf8:	eaffffaf 	b	8bbc <__divdi3+0x28>
    8cfc:	e2704000 	rsbs	r4, r0, #0
    8d00:	e2e15000 	rsc	r5, r1, #0
    8d04:	e3e0a000 	mvn	sl, #0
    8d08:	eaffffa7 	b	8bac <__divdi3+0x18>

00008d0c <__udivdi3>:
    8d0c:	e1510003 	cmp	r1, r3
    8d10:	01500002 	cmpeq	r0, r2
    8d14:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8d18:	e1a04000 	mov	r4, r0
    8d1c:	e1a05001 	mov	r5, r1
    8d20:	e1a08002 	mov	r8, r2
    8d24:	e1a09003 	mov	r9, r3
    8d28:	33a00000 	movcc	r0, #0
    8d2c:	33a01000 	movcc	r1, #0
    8d30:	3a00003b 	bcc	8e24 <__udivdi3+0x118>
    8d34:	e1a01003 	mov	r1, r3
    8d38:	e1a00002 	mov	r0, r2
    8d3c:	eb00003a 	bl	8e2c <__clzdi2>
    8d40:	e1a01005 	mov	r1, r5
    8d44:	e1a0a000 	mov	sl, r0
    8d48:	e1a00004 	mov	r0, r4
    8d4c:	eb000036 	bl	8e2c <__clzdi2>
    8d50:	e060300a 	rsb	r3, r0, sl
    8d54:	e243e020 	sub	lr, r3, #32
    8d58:	e1a07319 	lsl	r7, r9, r3
    8d5c:	e1877e18 	orr	r7, r7, r8, lsl lr
    8d60:	e263c020 	rsb	ip, r3, #32
    8d64:	e1877c38 	orr	r7, r7, r8, lsr ip
    8d68:	e1550007 	cmp	r5, r7
    8d6c:	e1a06318 	lsl	r6, r8, r3
    8d70:	01540006 	cmpeq	r4, r6
    8d74:	e1a02003 	mov	r2, r3
    8d78:	33a00000 	movcc	r0, #0
    8d7c:	33a01000 	movcc	r1, #0
    8d80:	3a000005 	bcc	8d9c <__udivdi3+0x90>
    8d84:	e3a08001 	mov	r8, #1
    8d88:	e0544006 	subs	r4, r4, r6
    8d8c:	e1a01e18 	lsl	r1, r8, lr
    8d90:	e1811c38 	orr	r1, r1, r8, lsr ip
    8d94:	e0c55007 	sbc	r5, r5, r7
    8d98:	e1a00318 	lsl	r0, r8, r3
    8d9c:	e3530000 	cmp	r3, #0
    8da0:	0a00001f 	beq	8e24 <__udivdi3+0x118>
    8da4:	e1b070a7 	lsrs	r7, r7, #1
    8da8:	e1a06066 	rrx	r6, r6
    8dac:	ea000007 	b	8dd0 <__udivdi3+0xc4>
    8db0:	e0544006 	subs	r4, r4, r6
    8db4:	e0c55007 	sbc	r5, r5, r7
    8db8:	e0944004 	adds	r4, r4, r4
    8dbc:	e0a55005 	adc	r5, r5, r5
    8dc0:	e2944001 	adds	r4, r4, #1
    8dc4:	e2a55000 	adc	r5, r5, #0
    8dc8:	e2533001 	subs	r3, r3, #1
    8dcc:	0a000006 	beq	8dec <__udivdi3+0xe0>
    8dd0:	e1570005 	cmp	r7, r5
    8dd4:	01560004 	cmpeq	r6, r4
    8dd8:	9afffff4 	bls	8db0 <__udivdi3+0xa4>
    8ddc:	e0944004 	adds	r4, r4, r4
    8de0:	e0a55005 	adc	r5, r5, r5
    8de4:	e2533001 	subs	r3, r3, #1
    8de8:	1afffff8 	bne	8dd0 <__udivdi3+0xc4>
    8dec:	e0948000 	adds	r8, r4, r0
    8df0:	e0a59001 	adc	r9, r5, r1
    8df4:	e1a03234 	lsr	r3, r4, r2
    8df8:	e2621020 	rsb	r1, r2, #32
    8dfc:	e2420020 	sub	r0, r2, #32
    8e00:	e1833115 	orr	r3, r3, r5, lsl r1
    8e04:	e1a0c235 	lsr	ip, r5, r2
    8e08:	e1833035 	orr	r3, r3, r5, lsr r0
    8e0c:	e1a0721c 	lsl	r7, ip, r2
    8e10:	e1877013 	orr	r7, r7, r3, lsl r0
    8e14:	e1a06213 	lsl	r6, r3, r2
    8e18:	e1877133 	orr	r7, r7, r3, lsr r1
    8e1c:	e0580006 	subs	r0, r8, r6
    8e20:	e0c91007 	sbc	r1, r9, r7
    8e24:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8e28:	e12fff1e 	bx	lr

00008e2c <__clzdi2>:
    8e2c:	e92d4010 	push	{r4, lr}
    8e30:	e3510000 	cmp	r1, #0
    8e34:	1a000002 	bne	8e44 <__clzdi2+0x18>
    8e38:	eb000005 	bl	8e54 <__clzsi2>
    8e3c:	e2800020 	add	r0, r0, #32
    8e40:	ea000001 	b	8e4c <__clzdi2+0x20>
    8e44:	e1a00001 	mov	r0, r1
    8e48:	eb000001 	bl	8e54 <__clzsi2>
    8e4c:	e8bd4010 	pop	{r4, lr}
    8e50:	e12fff1e 	bx	lr

00008e54 <__clzsi2>:
    8e54:	e3a0101c 	mov	r1, #28
    8e58:	e3500801 	cmp	r0, #65536	; 0x10000
    8e5c:	21a00820 	lsrcs	r0, r0, #16
    8e60:	22411010 	subcs	r1, r1, #16
    8e64:	e3500c01 	cmp	r0, #256	; 0x100
    8e68:	21a00420 	lsrcs	r0, r0, #8
    8e6c:	22411008 	subcs	r1, r1, #8
    8e70:	e3500010 	cmp	r0, #16
    8e74:	21a00220 	lsrcs	r0, r0, #4
    8e78:	22411004 	subcs	r1, r1, #4
    8e7c:	e28f2008 	add	r2, pc, #8
    8e80:	e7d20000 	ldrb	r0, [r2, r0]
    8e84:	e0800001 	add	r0, r0, r1
    8e88:	e12fff1e 	bx	lr
    8e8c:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    8e90:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

00009000 <__rodata_start>:
    9000:	2b2b2b2b 	blcs	ad3cb4 <__user_program+0x7d3cb4>
    9004:	4f2b2b2b 	svcmi	0x002b2b2b
    9008:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
    900c:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
    9010:	6e754620 	cdpvs	6, 7, cr4, cr5, cr0, {1}
    9014:	6f697463 	svcvs	0x00697463
    9018:	2b2b2b6e 	blcs	ad3dd8 <__user_program+0x7d3dd8>
    901c:	2b2b2b2b 	blcs	ad3cd0 <__user_program+0x7d3cd0>
    9020:	0000000a 	andeq	r0, r0, sl

00009024 <.LC1>:
    9024:	000a6425 	andeq	r6, sl, r5, lsr #8

00009028 <.LC2>:
    9028:	2b2b2b2b 	blcs	ad3cdc <__user_program+0x7d3cdc>
    902c:	552b2b2b 	strpl	r2, [fp, #-2859]!	; 0xb2b
    9030:	74706f6e 	ldrbtvc	r6, [r0], #-3950	; 0xf6e
    9034:	7a696d69 	bvc	1a645e0 <__user_program+0x17645e0>
    9038:	46206465 	strtmi	r6, [r0], -r5, ror #8
    903c:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xe75
    9040:	2b6e6f69 	blcs	1ba4dec <__user_program+0x18a4dec>
    9044:	2b2b2b2b 	blcs	ad3cf8 <__user_program+0x7d3cf8>
    9048:	000a2b2b 	andeq	r2, sl, fp, lsr #22

0000904c <.LC3>:
    904c:	2b2b2b2b 	blcs	ad3d00 <__user_program+0x7d3d00>
    9050:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    9054:	20747365 	rsbscs	r7, r4, r5, ror #6
    9058:	6c696146 	stfvse	f6, [r9], #-280	; 0xfffffee8
    905c:	2b2b6465 	blcs	ae21f8 <__user_program+0x7e21f8>
    9060:	2b2b2b2b 	blcs	ad3d14 <__user_program+0x7d3d14>
    9064:	00000a2b 	andeq	r0, r0, fp, lsr #20

00009068 <.LC4>:
    9068:	2b2b2b2b 	blcs	ad3d1c <__user_program+0x7d3d1c>
    906c:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    9070:	20747365 	rsbscs	r7, r4, r5, ror #6
    9074:	73736150 	cmnvc	r3, #80, 2
    9078:	2b2b6465 	blcs	ae2214 <__user_program+0x7e2214>
    907c:	2b2b2b2b 	blcs	ad3d30 <__user_program+0x7d3d30>
    9080:	00000a2b 	andeq	r0, r0, fp, lsr #20

00009084 <.LC0>:
    9084:	00000030 	andeq	r0, r0, r0, lsr r0

00009088 <.LC1>:
    9088:	Address 0x00009088 is out of bounds.


Disassembly of section .ARM.exidx:

0000908c <.ARM.exidx>:
    908c:	7ffffb08 	svcvc	0x00fffb08
    9090:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000a000 <__data_start>:
    a000:	33323130 	teqcc	r2, #48, 2
    a004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    a008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    a00c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .bss:

0000b000 <__bss_start>:
	...

0000b7d0 <array1>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	0000004a 	andeq	r0, r0, sl, asr #32
  10:	00014d01 	andeq	r4, r1, r1, lsl #26
  14:	0000f500 	andeq	pc, r0, r0, lsl #10
  18:	00805400 	addeq	r5, r0, r0, lsl #8
  1c:	00016000 	andeq	r6, r1, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	08010200 	stmdaeq	r1, {r9}
  28:	000000d1 	ldrdeq	r0, [r0], -r1
  2c:	da080102 	ble	20043c <__end+0xd343c>
  30:	02000000 	andeq	r0, r0, #0
  34:	013c0502 	teqeq	ip, r2, lsl #10
  38:	04030000 	streq	r0, [r3], #-0
  3c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
  40:	05080200 	streq	r0, [r8, #-512]	; 0x200
  44:	00000000 	andeq	r0, r0, r0
  48:	0000c904 	andeq	ip, r0, r4, lsl #18
  4c:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
  50:	02000000 	andeq	r0, r0, #0
  54:	01170702 	tsteq	r7, r2, lsl #14
  58:	df040000 	svcle	0x00040000
  5c:	02000000 	andeq	r0, r0, #0
  60:	0000651a 	andeq	r6, r0, sl, lsl r5
  64:	07040200 	streq	r0, [r4, -r0, lsl #4]
  68:	00000034 	andeq	r0, r0, r4, lsr r0
  6c:	2a070802 	bcs	1c207c <__end+0x9507c>
  70:	05000000 	streq	r0, [r0, #-0]
  74:	00000130 	andeq	r0, r0, r0, lsr r1
  78:	80545401 	subshi	r5, r4, r1, lsl #8
  7c:	00540000 	subseq	r0, r4, r0
  80:	9c010000 	stcls	0, cr0, [r1], {-0}
  84:	000000d2 	ldrdeq	r0, [r0], -r2
  88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
  8c:	48540100 	ldmdami	r4, {r8}^
  90:	00000000 	andeq	r0, r0, r0
  94:	07000000 	streq	r0, [r0, -r0]
  98:	006e7566 	rsbeq	r7, lr, r6, ror #10
  9c:	00485401 	subeq	r5, r8, r1, lsl #8
  a0:	51010000 	mrspl	r0, (UNDEF: 1)
  a4:	67657208 	strbvs	r7, [r5, -r8, lsl #4]!
  a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
  ac:	21000000 	mrscs	r0, (UNDEF: 0)
  b0:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
  b4:	00000135 	andeq	r0, r0, r5, lsr r1
  b8:	005a5b01 	subseq	r5, sl, r1, lsl #22
  bc:	005a0000 	subseq	r0, sl, r0
  c0:	46090000 	strmi	r0, [r9], -r0
  c4:	01000001 	tsteq	r0, r1
  c8:	00005a5d 	andeq	r5, r0, sp, asr sl
  cc:	00007800 	andeq	r7, r0, r0, lsl #16
  d0:	21050000 	mrscs	r0, (UNDEF: 5)
  d4:	01000000 	mrseq	r0, (UNDEF: 0)
  d8:	0080a864 	addeq	sl, r0, r4, ror #16
  dc:	00004400 	andeq	r4, r0, r0, lsl #8
  e0:	f79c0100 			; <UNDEFINED> instruction: 0xf79c0100
  e4:	06000000 	streq	r0, [r0], -r0
  e8:	006e6970 	rsbeq	r6, lr, r0, ror r9
  ec:	00486401 	subeq	r6, r8, r1, lsl #8
  f0:	008b0000 	addeq	r0, fp, r0
  f4:	05000000 	streq	r0, [r0, #-0]
  f8:	00000041 	andeq	r0, r0, r1, asr #32
  fc:	80ec7001 	rschi	r7, ip, r1
 100:	00440000 	subeq	r0, r4, r0
 104:	9c010000 	stcls	0, cr0, [r1], {-0}
 108:	0000011c 	andeq	r0, r0, ip, lsl r1
 10c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
 110:	48700100 	ldmdami	r0!, {r8}^
 114:	c5000000 	strgt	r0, [r0, #-0]
 118:	00000000 	andeq	r0, r0, r0
 11c:	00000e05 	andeq	r0, r0, r5, lsl #28
 120:	307c0100 	rsbscc	r0, ip, r0, lsl #2
 124:	84000081 	strhi	r0, [r0], #-129	; 0x81
 128:	01000000 	mrseq	r0, (UNDEF: 0)
 12c:	0001889c 	muleq	r1, ip, r8
 130:	69700600 	ldmdbvs	r0!, {r9, sl}^
 134:	7c01006e 	stcvc	0, cr0, [r1], {110}	; 0x6e
 138:	00000048 	andeq	r0, r0, r8, asr #32
 13c:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 140:	00012a0a 	andeq	r2, r1, sl, lsl #20
 144:	487c0100 	ldmdami	ip!, {r8}^
 148:	20000000 	andcs	r0, r0, r0
 14c:	0b000001 	bleq	158 <__start-0x7ea8>
 150:	00008158 	andeq	r8, r0, r8, asr r1
 154:	000001a7 	andeq	r0, r0, r7, lsr #3
 158:	00000163 	andeq	r0, r0, r3, ror #2
 15c:	0250010c 	subseq	r0, r0, #12, 2
 160:	0b009608 	bleq	25988 <__bss_end+0x19988>
 164:	00008180 	andeq	r8, r0, r0, lsl #3
 168:	000001a7 	andeq	r0, r0, r7, lsr #3
 16c:	00000177 	andeq	r0, r0, r7, ror r1
 170:	0250010c 	subseq	r0, r0, #12, 2
 174:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
 178:	000081a8 	andeq	r8, r0, r8, lsr #3
 17c:	000001a7 	andeq	r0, r0, r7, lsr #3
 180:	0250010c 	subseq	r0, r0, #12, 2
 184:	00009608 	andeq	r9, r0, r8, lsl #12
 188:	00001c0e 	andeq	r1, r0, lr, lsl #24
 18c:	97510100 	ldrbls	r0, [r1, -r0, lsl #2]
 190:	00000001 	andeq	r0, r0, r1
 194:	0f3f2000 	svceq	0x003f2000
 198:	0000019c 	muleq	r0, ip, r1
 19c:	01a20410 			; <UNDEFINED> instruction: 0x01a20410
 1a0:	5a110000 	bpl	4401a8 <__user_program+0x1401a8>
 1a4:	12000000 	andne	r0, r0, #0
 1a8:	000000e8 	andeq	r0, r0, r8, ror #1
 1ac:	5a131903 	bpl	4c65c0 <__user_program+0x1c65c0>
 1b0:	00000000 	andeq	r0, r0, r0
 1b4:	0000dd00 	andeq	sp, r0, r0, lsl #26
 1b8:	fe000400 	cdp2	4, 0, cr0, cr0, cr0, {0}
 1bc:	04000000 	streq	r0, [r0], #-0
 1c0:	0001a601 	andeq	sl, r1, r1, lsl #12
 1c4:	01670100 	cmneq	r7, r0, lsl #2
 1c8:	00f50000 	rscseq	r0, r5, r0
 1cc:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
 1d0:	01580000 	cmpeq	r8, r0
 1d4:	00860000 	addeq	r0, r6, r0
 1d8:	01020000 	mrseq	r0, (UNDEF: 2)
 1dc:	0000da08 	andeq	sp, r0, r8, lsl #20
 1e0:	05020200 	streq	r0, [r2, #-512]	; 0x200
 1e4:	0000013c 	andeq	r0, r0, ip, lsr r1
 1e8:	69050403 	stmdbvs	r5, {r0, r1, sl}
 1ec:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 1f0:	00000508 	andeq	r0, r0, r8, lsl #10
 1f4:	01020000 	mrseq	r0, (UNDEF: 2)
 1f8:	0000d108 	andeq	sp, r0, r8, lsl #2
 1fc:	07020200 	streq	r0, [r2, -r0, lsl #4]
 200:	00000117 	andeq	r0, r0, r7, lsl r1
 204:	0000df04 	andeq	sp, r0, r4, lsl #30
 208:	5a1a0200 	bpl	680a10 <__user_program+0x380a10>
 20c:	02000000 	andeq	r0, r0, #0
 210:	00340704 	eorseq	r0, r4, r4, lsl #14
 214:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 218:	00002a07 	andeq	r2, r0, r7, lsl #20
 21c:	019a0500 	orrseq	r0, sl, r0, lsl #10
 220:	17010000 	strne	r0, [r1, -r0]
 224:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
 228:	00000158 	andeq	r0, r0, r8, asr r1
 22c:	00a69c01 	adceq	r9, r6, r1, lsl #24
 230:	69060000 	stmdbvs	r6, {}	; <UNPREDICTABLE>
 234:	33190100 	tstcc	r9, #0, 2
 238:	02000000 	andeq	r0, r0, #0
 23c:	29077491 	stmdbcs	r7, {r0, r4, r7, sl, ip, sp, lr}
 240:	01000002 	tsteq	r0, r2
 244:	00003319 	andeq	r3, r0, r9, lsl r3
 248:	70910200 	addsvc	r0, r1, r0, lsl #4
 24c:	00018f07 	andeq	r8, r1, r7, lsl #30
 250:	4f1a0100 	svcmi	0x001a0100
 254:	02000000 	andeq	r0, r0, #0
 258:	08006c91 	stmdaeq	r0, {r0, r4, r7, sl, fp, sp, lr}
 25c:	00000033 	andeq	r0, r0, r3, lsr r0
 260:	000000b7 	strheq	r0, [r0], -r7
 264:	0000b709 	andeq	fp, r0, r9, lsl #14
 268:	0001f300 	andeq	pc, r1, r0, lsl #6
 26c:	2e070402 	cdpcs	4, 0, cr0, cr7, cr2, {0}
 270:	0a000002 	beq	280 <__start-0x7d80>
 274:	00000160 	andeq	r0, r0, r0, ror #2
 278:	00a61201 	adceq	r1, r6, r1, lsl #4
 27c:	03050000 	movweq	r0, #20480	; 0x5000
 280:	0000b7d0 	ldrdeq	fp, [r0], -r0
 284:	0001880a 	andeq	r8, r1, sl, lsl #16
 288:	a6120100 	ldrge	r0, [r2], -r0, lsl #2
 28c:	05000000 	streq	r0, [r0, #-0]
 290:	00b00003 	adcseq	r0, r0, r3
 294:	02350000 	eorseq	r0, r5, #0
 298:	00040000 	andeq	r0, r4, r0
 29c:	00000190 	muleq	r0, r0, r1
 2a0:	01a60104 			; <UNDEFINED> instruction: 0x01a60104
 2a4:	70010000 	andvc	r0, r1, r0
 2a8:	f5000002 			; <UNDEFINED> instruction: 0xf5000002
 2ac:	0c000000 	stceq	0, cr0, [r0], {-0}
 2b0:	88000083 	stmdahi	r0, {r0, r1, r7}
 2b4:	38000003 	stmdacc	r0, {r0, r1}
 2b8:	02000001 	andeq	r0, r0, #1
 2bc:	000000ca 	andeq	r0, r0, sl, asr #1
 2c0:	00300e02 	eorseq	r0, r0, r2, lsl #28
 2c4:	01030000 	mrseq	r0, (UNDEF: 3)
 2c8:	0000da08 	andeq	sp, r0, r8, lsl #20
 2cc:	05020300 	streq	r0, [r2, #-768]	; 0x300
 2d0:	0000013c 	andeq	r0, r0, ip, lsr r1
 2d4:	0000e002 	andeq	lr, r0, r2
 2d8:	49120200 	ldmdbmi	r2, {r9}
 2dc:	04000000 	streq	r0, [r0], #-0
 2e0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 2e4:	08030074 	stmdaeq	r3, {r2, r4, r5, r6}
 2e8:	00000005 	andeq	r0, r0, r5
 2ec:	00c90200 	sbceq	r0, r9, r0, lsl #4
 2f0:	16020000 	strne	r0, [r2], -r0
 2f4:	00000062 	andeq	r0, r0, r2, rrx
 2f8:	d1080103 	tstle	r8, r3, lsl #2
 2fc:	03000000 	movweq	r0, #0
 300:	01170702 	tsteq	r7, r2, lsl #14
 304:	df020000 	svcle	0x00020000
 308:	02000000 	andeq	r0, r0, #0
 30c:	00007b1a 	andeq	r7, r0, sl, lsl fp
 310:	07040300 	streq	r0, [r4, -r0, lsl #6]
 314:	00000034 	andeq	r0, r0, r4, lsr r0
 318:	00024702 	andeq	r4, r2, r2, lsl #14
 31c:	8d1c0200 	lfmhi	f0, 4, [ip, #-0]
 320:	03000000 	movweq	r0, #0
 324:	002a0708 	eoreq	r0, sl, r8, lsl #14
 328:	57020000 	strpl	r0, [r2, -r0]
 32c:	03000002 	movweq	r0, #2
 330:	00009f13 	andeq	r9, r0, r3, lsl pc
 334:	02550500 	subseq	r0, r5, #0, 10
 338:	04040000 	streq	r0, [r4], #-0
 33c:	0000b600 	andeq	fp, r0, r0, lsl #12
 340:	029d0600 	addseq	r0, sp, #0, 12
 344:	00b60000 	adcseq	r0, r6, r0
 348:	00000000 	andeq	r0, r0, r0
 34c:	5f080407 	svcpl	0x00080407
 350:	01000002 	tsteq	r0, r2
 354:	00830c21 	addeq	r0, r3, r1, lsr #24
 358:	00013800 	andeq	r3, r1, r0, lsl #16
 35c:	149c0100 	ldrne	r0, [ip], #256	; 0x100
 360:	09000001 	stmdbeq	r0, {r0}
 364:	00000250 	andeq	r0, r0, r0, asr r2
 368:	00572101 	subseq	r2, r7, r1, lsl #2
 36c:	91020000 	mrsls	r0, (UNDEF: 2)
 370:	756e0a5f 	strbvc	r0, [lr, #-2655]!	; 0xa5f
 374:	2101006d 	tstcs	r1, sp, rrx
 378:	00000082 	andeq	r0, r0, r2, lsl #1
 37c:	0b509102 	bleq	142478c <__user_program+0x112478c>
 380:	00000240 	andeq	r0, r0, r0, asr #4
 384:	01142201 	tsteq	r4, r1, lsl #4
 388:	91020000 	mrsls	r0, (UNDEF: 2)
 38c:	75620c6c 	strbvc	r0, [r2, #-3180]!	; 0xc6c
 390:	23010066 	movwcs	r0, #4198	; 0x1066
 394:	0000011a 	andeq	r0, r0, sl, lsl r1
 398:	0c609102 	stfeqp	f1, [r0], #-8
 39c:	00727470 	rsbseq	r7, r2, r0, ror r4
 3a0:	01142401 	tsteq	r4, r1, lsl #8
 3a4:	91020000 	mrsls	r0, (UNDEF: 2)
 3a8:	040d0068 	streq	r0, [sp], #-104	; 0x68
 3ac:	00000025 	andeq	r0, r0, r5, lsr #32
 3b0:	0000250e 	andeq	r2, r0, lr, lsl #10
 3b4:	00012a00 	andeq	r2, r1, r0, lsl #20
 3b8:	012a0f00 	teqeq	sl, r0, lsl #30
 3bc:	00070000 	andeq	r0, r7, r0
 3c0:	2e070403 	cdpcs	4, 0, cr0, cr7, cr3, {0}
 3c4:	10000002 	andne	r0, r0, r2
 3c8:	00000291 	muleq	r0, r1, r2
 3cc:	00493f01 	subeq	r3, r9, r1, lsl #30
 3d0:	84440000 	strbhi	r0, [r4], #-0
 3d4:	02500000 	subseq	r0, r0, #0
 3d8:	9c010000 	stcls	0, cr0, [r1], {-0}
 3dc:	0000020c 	andeq	r0, r0, ip, lsl #4
 3e0:	746d660a 	strbtvc	r6, [sp], #-1546	; 0x60a
 3e4:	0c3f0100 	ldfeqs	f0, [pc], #-0	; 3ec <__start-0x7c14>
 3e8:	02000002 	andeq	r0, r0, #2
 3ec:	0b117091 	bleq	45c638 <__user_program+0x15c638>
 3f0:	00000298 	muleq	r0, r8, r2
 3f4:	00944001 	addseq	r4, r4, r1
 3f8:	91020000 	mrsls	r0, (UNDEF: 2)
 3fc:	84fc124c 	ldrbthi	r1, [ip], #588	; 0x24c
 400:	005c0000 	subseq	r0, ip, r0
 404:	01830000 	orreq	r0, r3, r0
 408:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 40c:	01006d75 	tsteq	r0, r5, ror sp
 410:	00003e50 	andeq	r3, r0, r0, asr lr
 414:	60910200 	addsvs	r0, r1, r0, lsl #4
 418:	85581200 	ldrbhi	r1, [r8, #-512]	; 0x200
 41c:	002c0000 	eoreq	r0, ip, r0
 420:	019f0000 	orrseq	r0, pc, r0
 424:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 428:	01006d75 	tsteq	r0, r5, ror sp
 42c:	0000705b 	andeq	r7, r0, fp, asr r0
 430:	5c910200 	lfmpl	f0, 4, [r1], {0}
 434:	85841200 	strhi	r1, [r4, #512]	; 0x200
 438:	002c0000 	eoreq	r0, ip, r0
 43c:	01bb0000 			; <UNDEFINED> instruction: 0x01bb0000
 440:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 444:	01006d75 	tsteq	r0, r5, ror sp
 448:	00007061 	andeq	r7, r0, r1, rrx
 44c:	58910200 	ldmpl	r1, {r9}
 450:	85b01200 	ldrhi	r1, [r0, #512]!	; 0x200
 454:	002c0000 	eoreq	r0, ip, r0
 458:	01d70000 	bicseq	r0, r7, r0
 45c:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 460:	01006d75 	tsteq	r0, r5, ror sp
 464:	00007068 	andeq	r7, r0, r8, rrx
 468:	54910200 	ldrpl	r0, [r1], #512	; 0x200
 46c:	85dc1200 	ldrbhi	r1, [ip, #512]	; 0x200
 470:	00480000 	subeq	r0, r8, r0
 474:	01f30000 	mvnseq	r0, r0
 478:	370b0000 	strcc	r0, [fp, -r0]
 47c:	01000002 	tsteq	r0, r2
 480:	0001146e 	andeq	r1, r1, lr, ror #8
 484:	64910200 	ldrvs	r0, [r1], #512	; 0x200
 488:	86241300 	strthi	r1, [r4], -r0, lsl #6
 48c:	00280000 	eoreq	r0, r8, r0
 490:	ab0b0000 	blge	2c0498 <__end+0x193498>
 494:	01000002 	tsteq	r0, r2
 498:	00003e77 	andeq	r3, r0, r7, ror lr
 49c:	50910200 	addspl	r0, r1, r0, lsl #4
 4a0:	040d0000 	streq	r0, [sp], #-0
 4a4:	00000212 	andeq	r0, r0, r2, lsl r2
 4a8:	00003014 	andeq	r3, r0, r4, lsl r0
 4ac:	00300e00 	eorseq	r0, r0, r0, lsl #28
 4b0:	02270000 	eoreq	r0, r7, #0
 4b4:	2a0f0000 	bcs	3c04bc <__user_program+0xc04bc>
 4b8:	10000001 	andne	r0, r0, r1
 4bc:	02690b00 	rsbeq	r0, r9, #0, 22
 4c0:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
 4c4:	00000217 	andeq	r0, r0, r7, lsl r2
 4c8:	a0000305 	andge	r0, r0, r5, lsl #6
 4cc:	c0000000 	andgt	r0, r0, r0
 4d0:	04000000 	streq	r0, [r0], #-0
 4d4:	00029500 	andeq	r9, r2, r0, lsl #10
 4d8:	a6010400 	strge	r0, [r1], -r0, lsl #8
 4dc:	01000001 	tsteq	r0, r1
 4e0:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
 4e4:	000000f5 	strdeq	r0, [r0], -r5
 4e8:	00008694 	muleq	r0, r4, r6
 4ec:	00000064 	andeq	r0, r0, r4, rrx
 4f0:	00000212 	andeq	r0, r0, r2, lsl r2
 4f4:	da080102 	ble	200904 <__end+0xd3904>
 4f8:	02000000 	andeq	r0, r0, #0
 4fc:	013c0502 	teqeq	ip, r2, lsl #10
 500:	04030000 	streq	r0, [r3], #-0
 504:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
 508:	05080200 	streq	r0, [r8, #-512]	; 0x200
 50c:	00000000 	andeq	r0, r0, r0
 510:	0000c904 	andeq	ip, r0, r4, lsl #18
 514:	4c160200 	lfmmi	f0, 4, [r6], {-0}
 518:	02000000 	andeq	r0, r0, #0
 51c:	00d10801 	sbcseq	r0, r1, r1, lsl #16
 520:	02020000 	andeq	r0, r2, #0
 524:	00011707 	andeq	r1, r1, r7, lsl #14
 528:	07040200 	streq	r0, [r4, -r0, lsl #4]
 52c:	00000034 	andeq	r0, r0, r4, lsr r0
 530:	2a070802 	bcs	1c2540 <__end+0x95540>
 534:	05000000 	streq	r0, [r0, #-0]
 538:	000002cf 	andeq	r0, r0, pc, asr #5
 53c:	86940d01 	ldrhi	r0, [r4], r1, lsl #26
 540:	00140000 	andseq	r0, r4, r0
 544:	9c010000 	stcls	0, cr0, [r1], {-0}
 548:	0002e705 	andeq	lr, r2, r5, lsl #14
 54c:	a8110100 	ldmdage	r1, {r8}
 550:	14000086 	strne	r0, [r0], #-134	; 0x86
 554:	01000000 	mrseq	r0, (UNDEF: 0)
 558:	02d9069c 	sbcseq	r0, r9, #156, 12	; 0x9c00000
 55c:	15010000 	strne	r0, [r1, #-0]
 560:	000086bc 			; <UNDEFINED> instruction: 0x000086bc
 564:	00000020 	andeq	r0, r0, r0, lsr #32
 568:	00ae9c01 	adceq	r9, lr, r1, lsl #24
 56c:	ab070000 	blge	1c0574 <__end+0x93574>
 570:	01000002 	tsteq	r0, r2
 574:	00004115 	andeq	r4, r0, r5, lsl r1
 578:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
 57c:	02a20800 	adceq	r0, r2, #0, 16
 580:	19010000 	stmdbne	r1, {}	; <UNPREDICTABLE>
 584:	00000041 	andeq	r0, r0, r1, asr #32
 588:	000086dc 	ldrdeq	r8, [r0], -ip
 58c:	0000001c 	andeq	r0, r0, ip, lsl r0
 590:	d5009c01 	strle	r9, [r0, #-3073]	; 0xc01
 594:	04000000 	streq	r0, [r0], #-0
 598:	00032700 	andeq	r2, r3, r0, lsl #14
 59c:	a6010400 	strge	r0, [r1], -r0, lsl #8
 5a0:	01000001 	tsteq	r0, r1
 5a4:	00000306 	andeq	r0, r0, r6, lsl #6
 5a8:	000000f5 	strdeq	r0, [r0], -r5
 5ac:	000086f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 5b0:	00000088 	andeq	r0, r0, r8, lsl #1
 5b4:	00000285 	andeq	r0, r0, r5, lsl #5
 5b8:	da080102 	ble	2009c8 <__end+0xd39c8>
 5bc:	02000000 	andeq	r0, r0, #0
 5c0:	013c0502 	teqeq	ip, r2, lsl #10
 5c4:	04030000 	streq	r0, [r3], #-0
 5c8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
 5cc:	05080200 	streq	r0, [r8, #-512]	; 0x200
 5d0:	00000000 	andeq	r0, r0, r0
 5d4:	d1080102 	tstle	r8, r2, lsl #2
 5d8:	02000000 	andeq	r0, r0, #0
 5dc:	01170702 	tsteq	r7, r2, lsl #14
 5e0:	df040000 	svcle	0x00040000
 5e4:	02000000 	andeq	r0, r0, #0
 5e8:	00005a1a 	andeq	r5, r0, sl, lsl sl
 5ec:	07040200 	streq	r0, [r4, -r0, lsl #4]
 5f0:	00000034 	andeq	r0, r0, r4, lsr r0
 5f4:	2a070802 	bcs	1c2604 <__end+0x95604>
 5f8:	05000000 	streq	r0, [r0, #-0]
 5fc:	0000032b 	andeq	r0, r0, fp, lsr #6
 600:	86f80c01 	ldrbthi	r0, [r8], r1, lsl #24
 604:	00200000 	eoreq	r0, r0, r0
 608:	9c010000 	stcls	0, cr0, [r1], {-0}
 60c:	0000008c 	andeq	r0, r0, ip, lsl #1
 610:	00032606 	andeq	r2, r3, r6, lsl #12
 614:	330c0100 	movwcc	r0, #49408	; 0xc100
 618:	02000000 	andeq	r0, r0, #0
 61c:	07007491 			; <UNDEFINED> instruction: 0x07007491
 620:	00000348 	andeq	r0, r0, r8, asr #6
 624:	87181001 	ldrhi	r1, [r8, -r1]
 628:	00180000 	andseq	r0, r8, r0
 62c:	9c010000 	stcls	0, cr0, [r1], {-0}
 630:	00035308 	andeq	r5, r3, r8, lsl #6
 634:	4f140100 	svcmi	0x00140100
 638:	30000000 	andcc	r0, r0, r0
 63c:	1c000087 	stcne	0, cr0, [r0], {135}	; 0x87
 640:	01000000 	mrseq	r0, (UNDEF: 0)
 644:	0337089c 	teqeq	r7, #156, 16	; 0x9c0000
 648:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
 64c:	00000033 	andeq	r0, r0, r3, lsr r0
 650:	0000874c 	andeq	r8, r0, ip, asr #14
 654:	0000001c 	andeq	r0, r0, ip, lsl r0
 658:	f2079c01 			; <UNDEFINED> instruction: 0xf2079c01
 65c:	01000002 	tsteq	r0, r2
 660:	0087681d 	addeq	r6, r7, sp, lsl r8
 664:	00001800 	andeq	r1, r0, r0, lsl #16
 668:	009c0100 	addseq	r0, ip, r0, lsl #2
 66c:	0000008b 	andeq	r0, r0, fp, lsl #1
 670:	03b90004 			; <UNDEFINED> instruction: 0x03b90004
 674:	01040000 	mrseq	r0, (UNDEF: 4)
 678:	000001a6 	andeq	r0, r0, r6, lsr #3
 67c:	00035e01 	andeq	r5, r3, r1, lsl #28
 680:	0000f500 	andeq	pc, r0, r0, lsl #10
 684:	00878000 	addeq	r8, r7, r0
 688:	00005c00 	andeq	r5, r0, r0, lsl #24
 68c:	0002ff00 	andeq	pc, r2, r0, lsl #30
 690:	08010200 	stmdaeq	r1, {r9}
 694:	000000da 	ldrdeq	r0, [r0], -sl
 698:	3c050202 	sfmcc	f0, 4, [r5], {2}
 69c:	03000001 	movweq	r0, #1
 6a0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 6a4:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 6a8:	00000005 	andeq	r0, r0, r5
 6ac:	08010200 	stmdaeq	r1, {r9}
 6b0:	000000d1 	ldrdeq	r0, [r0], -r1
 6b4:	17070202 	strne	r0, [r7, -r2, lsl #4]
 6b8:	04000001 	streq	r0, [r0], #-1
 6bc:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 6c0:	005a1a02 	subseq	r1, sl, r2, lsl #20
 6c4:	04020000 	streq	r0, [r2], #-0
 6c8:	00003407 	andeq	r3, r0, r7, lsl #8
 6cc:	07080200 	streq	r0, [r8, -r0, lsl #4]
 6d0:	0000002a 	andeq	r0, r0, sl, lsr #32
 6d4:	63697405 	cmnvs	r9, #83886080	; 0x5000000
 6d8:	80170100 	andshi	r0, r7, r0, lsl #2
 6dc:	34000087 	strcc	r0, [r0], #-135	; 0x87
 6e0:	01000000 	mrseq	r0, (UNDEF: 0)
 6e4:	6f74069c 	svcvs	0x0074069c
 6e8:	25010063 	strcs	r0, [r1, #-99]	; 0x63
 6ec:	0000004f 	andeq	r0, r0, pc, asr #32
 6f0:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
 6f4:	00000028 	andeq	r0, r0, r8, lsr #32
 6f8:	59009c01 	stmdbpl	r0, {r0, sl, fp, ip, pc}
 6fc:	02000000 	andeq	r0, r0, #0
 700:	00042200 	andeq	r2, r4, r0, lsl #4
 704:	73010400 	movwvc	r0, #5120	; 0x1400
 708:	00000003 	andeq	r0, r0, r3
 70c:	54000080 	strpl	r0, [r0], #-128	; 0x80
 710:	33000080 	movwcc	r0, #128	; 0x80
 714:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 718:	732f6b62 	teqvc	pc, #100352	; 0x18800
 71c:	622f6372 	eorvs	r6, pc, #-939524095	; 0xc8000001
 720:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
 724:	682f0053 	stmdavs	pc!, {r0, r1, r4, r6}	; <UNPREDICTABLE>
 728:	2f656d6f 	svccs	0x00656d6f
 72c:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
 730:	6e2f3934 	mcrvs	9, 1, r3, cr15, cr4, {1}
 734:	616c7765 	cmnvs	ip, r5, ror #14
 738:	332f3262 	teqcc	pc, #536870918	; 0x20000006
 73c:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
 740:	632f3631 	teqvs	pc, #51380224	; 0x3100000
 744:	0065646f 	rsbeq	r6, r5, pc, ror #8
 748:	20554e47 	subscs	r4, r5, r7, asr #28
 74c:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
 750:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
 754:	80010030 	andhi	r0, r1, r0, lsr r0
 758:	00000058 	andeq	r0, r0, r8, asr r0
 75c:	04360002 	ldrteq	r0, [r6], #-2
 760:	01040000 	mrseq	r0, (UNDEF: 4)
 764:	000003cb 	andeq	r0, r0, fp, asr #7
 768:	000087dc 	ldrdeq	r8, [r0], -ip
 76c:	00008820 	andeq	r8, r0, r0, lsr #16
 770:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 774:	2f6b6269 	svccs	0x006b6269
 778:	2f637273 	svccs	0x00637273
 77c:	2e6d7261 	cdpcs	2, 6, cr7, cr13, cr1, {3}
 780:	682f0053 	stmdavs	pc!, {r0, r1, r4, r6}	; <UNPREDICTABLE>
 784:	2f656d6f 	svccs	0x00656d6f
 788:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
 78c:	6e2f3934 	mcrvs	9, 1, r3, cr15, cr4, {1}
 790:	616c7765 	cmnvs	ip, r5, ror #14
 794:	332f3262 	teqcc	pc, #536870918	; 0x20000006
 798:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
 79c:	632f3631 	teqvs	pc, #51380224	; 0x3100000
 7a0:	0065646f 	rsbeq	r6, r5, pc, ror #8
 7a4:	20554e47 	subscs	r4, r5, r7, asr #28
 7a8:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
 7ac:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
 7b0:	80010030 	andhi	r0, r1, r0, lsr r0
 7b4:	00000054 	andeq	r0, r0, r4, asr r0
 7b8:	044a0002 	strbeq	r0, [sl], #-2
 7bc:	01040000 	mrseq	r0, (UNDEF: 4)
 7c0:	0000041c 	andeq	r0, r0, ip, lsl r4
 7c4:	00008820 	andeq	r8, r0, r0, lsr #16
 7c8:	00008978 	andeq	r8, r0, r8, ror r9
 7cc:	706f6e75 	rsbvc	r6, pc, r5, ror lr	; <UNPREDICTABLE>
 7d0:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 7d4:	2e64657a 	mcrcs	5, 3, r6, cr4, cr10, {3}
 7d8:	682f0063 	stmdavs	pc!, {r0, r1, r5, r6}	; <UNPREDICTABLE>
 7dc:	2f656d6f 	svccs	0x00656d6f
 7e0:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
 7e4:	6e2f3934 	mcrvs	9, 1, r3, cr15, cr4, {1}
 7e8:	616c7765 	cmnvs	ip, r5, ror #14
 7ec:	332f3262 	teqcc	pc, #536870918	; 0x20000006
 7f0:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
 7f4:	632f3631 	teqvs	pc, #51380224	; 0x3100000
 7f8:	0065646f 	rsbeq	r6, r5, pc, ror #8
 7fc:	20554e47 	subscs	r4, r5, r7, asr #28
 800:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
 804:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
 808:	80010030 	andhi	r0, r1, r0, lsr r0
 80c:	00000054 	andeq	r0, r0, r4, asr r0
 810:	045e0002 	ldrbeq	r0, [lr], #-2
 814:	01040000 	mrseq	r0, (UNDEF: 4)
 818:	000004b0 			; <UNDEFINED> instruction: 0x000004b0
 81c:	00008978 	andeq	r8, r0, r8, ror r9
 820:	00008ad0 	ldrdeq	r8, [r0], -r0
 824:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 828:	657a696d 	ldrbvs	r6, [sl, #-2413]!	; 0x96d
 82c:	2e656d5f 	mcrcs	13, 3, r6, cr5, cr15, {2}
 830:	682f0063 	stmdavs	pc!, {r0, r1, r5, r6}	; <UNPREDICTABLE>
 834:	2f656d6f 	svccs	0x00656d6f
 838:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
 83c:	6e2f3934 	mcrvs	9, 1, r3, cr15, cr4, {1}
 840:	616c7765 	cmnvs	ip, r5, ror #14
 844:	332f3262 	teqcc	pc, #536870918	; 0x20000006
 848:	662d3934 			; <UNDEFINED> instruction: 0x662d3934
 84c:	632f3631 	teqvs	pc, #51380224	; 0x3100000
 850:	0065646f 	rsbeq	r6, r5, pc, ror #8
 854:	20554e47 	subscs	r4, r5, r7, asr #28
 858:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
 85c:	2e34322e 	cdpcs	2, 3, cr3, cr4, cr14, {1}
 860:	80010030 	andhi	r0, r1, r0, lsr r0

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
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a187c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000017 	smladeq	r0, r7, r0, r0
  60:	08030005 	stmdaeq	r3, {r0, r2}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a080300 	bcc	200c78 <__end+0xd3c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00170213 	andseq	r0, r7, r3, lsl r2
  7c:	00340900 	eorseq	r0, r4, r0, lsl #18
  80:	0b3a0e03 	bleq	e83894 <__user_program+0xb83894>
  84:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  88:	00001702 	andeq	r1, r0, r2, lsl #14
  8c:	0300050a 	movweq	r0, #1290	; 0x50a
  90:	3b0b3a0e 	blcc	2ce8d0 <__end+0x1a18d0>
  94:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  98:	0b000017 	bleq	fc <__start-0x7f04>
  9c:	01018289 	smlabbeq	r1, r9, r2, r8
  a0:	13310111 	teqne	r1, #1073741828	; 0x40000004
  a4:	00001301 	andeq	r1, r0, r1, lsl #6
  a8:	01828a0c 	orreq	r8, r2, ip, lsl #20
  ac:	91180200 	tstls	r8, r0, lsl #4
  b0:	00001842 	andeq	r1, r0, r2, asr #16
  b4:	0182890d 	orreq	r8, r2, sp, lsl #18
  b8:	31011101 	tstcc	r1, r1, lsl #2
  bc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  c0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  c4:	0b3b0b3a 	bleq	ec2db4 <__user_program+0xbc2db4>
  c8:	061c1349 	ldreq	r1, [ip], -r9, asr #6
  cc:	260f0000 	strcs	r0, [pc], -r0
  d0:	00134900 	andseq	r4, r3, r0, lsl #18
  d4:	000f1000 	andeq	r1, pc, r0
  d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  dc:	35110000 	ldrcc	r0, [r1, #-0]
  e0:	00134900 	andseq	r4, r3, r0, lsl #18
  e4:	012e1200 	teqeq	lr, r0, lsl #4
  e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <__user_program+0xbc2ddc>
  f0:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
  f4:	05130000 	ldreq	r0, [r3, #-0]
  f8:	00134900 	andseq	r4, r3, r0, lsl #18
  fc:	11010000 	mrsne	r0, (UNDEF: 1)
 100:	130e2501 	movwne	r2, #58625	; 0xe501
 104:	1b0e030b 	blne	380d38 <__user_program+0x80d38>
 108:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 10c:	00171006 	andseq	r1, r7, r6
 110:	00240200 	eoreq	r0, r4, r0, lsl #4
 114:	0b3e0b0b 	bleq	f82d48 <__user_program+0xc82d48>
 118:	00000e03 	andeq	r0, r0, r3, lsl #28
 11c:	0b002403 	bleq	9130 <.LC1+0xa8>
 120:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 124:	04000008 	streq	r0, [r0], #-8
 128:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 12c:	0b3b0b3a 	bleq	ec2e1c <__user_program+0xbc2e1c>
 130:	00001349 	andeq	r1, r0, r9, asr #6
 134:	3f012e05 	svccc	0x00012e05
 138:	3a0e0319 	bcc	380da4 <__user_program+0x80da4>
 13c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 140:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 144:	96184006 	ldrls	r4, [r8], -r6
 148:	13011942 	movwne	r1, #6466	; 0x1942
 14c:	34060000 	strcc	r0, [r6], #-0
 150:	3a080300 	bcc	200d58 <__end+0xd3d58>
 154:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	00180213 	andseq	r0, r8, r3, lsl r2
 15c:	00340700 	eorseq	r0, r4, r0, lsl #14
 160:	0b3a0e03 	bleq	e83974 <__user_program+0xb83974>
 164:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 168:	00001802 	andeq	r1, r0, r2, lsl #16
 16c:	49010108 	stmdbmi	r1, {r3, r8}
 170:	00130113 	andseq	r0, r3, r3, lsl r1
 174:	00210900 	eoreq	r0, r1, r0, lsl #18
 178:	052f1349 	streq	r1, [pc, #-841]!	; fffffe37 <__user_program+0xffcffe37>
 17c:	340a0000 	strcc	r0, [sl], #-0
 180:	3a0e0300 	bcc	380d88 <__user_program+0x80d88>
 184:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 188:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 18c:	00000018 	andeq	r0, r0, r8, lsl r0
 190:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 194:	030b130e 	movweq	r1, #45838	; 0xb30e
 198:	110e1b0e 	tstne	lr, lr, lsl #22
 19c:	10061201 	andne	r1, r6, r1, lsl #4
 1a0:	02000017 	andeq	r0, r0, #23
 1a4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 1a8:	0b3b0b3a 	bleq	ec2e98 <__user_program+0xbc2e98>
 1ac:	00001349 	andeq	r1, r0, r9, asr #6
 1b0:	0b002403 	bleq	91c4 <.LC1+0x13c>
 1b4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 1b8:	0400000e 	streq	r0, [r0], #-14
 1bc:	0b0b0024 	bleq	2c0254 <__end+0x193254>
 1c0:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 1c4:	13050000 	movwne	r0, #20480	; 0x5000
 1c8:	0b0e0301 	bleq	380dd4 <__user_program+0x80dd4>
 1cc:	3b0b3a0b 	blcc	2cea00 <__end+0x1a1a00>
 1d0:	0013010b 	andseq	r0, r3, fp, lsl #2
 1d4:	000d0600 	andeq	r0, sp, r0, lsl #12
 1d8:	13490e03 	movtne	r0, #40451	; 0x9e03
 1dc:	19340b38 	ldmdbne	r4!, {r3, r4, r5, r8, r9, fp}
 1e0:	0f070000 	svceq	0x00070000
 1e4:	000b0b00 	andeq	r0, fp, r0, lsl #22
 1e8:	012e0800 	teqeq	lr, r0, lsl #16
 1ec:	0b3a0e03 	bleq	e83a00 <__user_program+0xb83a00>
 1f0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 1f4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1f8:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 1fc:	00130119 	andseq	r0, r3, r9, lsl r1
 200:	00050900 	andeq	r0, r5, r0, lsl #18
 204:	0b3a0e03 	bleq	e83a18 <__user_program+0xb83a18>
 208:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 20c:	00001802 	andeq	r1, r0, r2, lsl #16
 210:	0300050a 	movweq	r0, #1290	; 0x50a
 214:	3b0b3a08 	blcc	2cea3c <__end+0x1a1a3c>
 218:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 21c:	0b000018 	bleq	284 <__start-0x7d7c>
 220:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 224:	0b3b0b3a 	bleq	ec2f14 <__user_program+0xbc2f14>
 228:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 22c:	340c0000 	strcc	r0, [ip], #-0
 230:	3a080300 	bcc	200e38 <__end+0xd3e38>
 234:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 238:	00180213 	andseq	r0, r8, r3, lsl r2
 23c:	000f0d00 	andeq	r0, pc, r0, lsl #26
 240:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 244:	010e0000 	mrseq	r0, (UNDEF: 14)
 248:	01134901 	tsteq	r3, r1, lsl #18
 24c:	0f000013 	svceq	0x00000013
 250:	13490021 	movtne	r0, #36897	; 0x9021
 254:	00000b2f 	andeq	r0, r0, pc, lsr #22
 258:	3f012e10 	svccc	0x00012e10
 25c:	3a0e0319 	bcc	380ec8 <__user_program+0x80ec8>
 260:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 264:	11134919 	tstne	r3, r9, lsl r9
 268:	40061201 	andmi	r1, r6, r1, lsl #4
 26c:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 270:	00001301 	andeq	r1, r0, r1, lsl #6
 274:	00001811 	andeq	r1, r0, r1, lsl r8
 278:	010b1200 	mrseq	r1, R11_fiq
 27c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 280:	00001301 	andeq	r1, r0, r1, lsl #6
 284:	11010b13 	tstne	r1, r3, lsl fp
 288:	00061201 	andeq	r1, r6, r1, lsl #4
 28c:	00261400 	eoreq	r1, r6, r0, lsl #8
 290:	00001349 	andeq	r1, r0, r9, asr #6
 294:	01110100 	tsteq	r1, r0, lsl #2
 298:	0b130e25 	bleq	4c3b34 <__user_program+0x1c3b34>
 29c:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 2a0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2a4:	00001710 	andeq	r1, r0, r0, lsl r7
 2a8:	0b002402 	bleq	92b8 <.LC1+0x230>
 2ac:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2b0:	0300000e 	movweq	r0, #14
 2b4:	0b0b0024 	bleq	2c034c <__end+0x19334c>
 2b8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 2bc:	16040000 	strne	r0, [r4], -r0
 2c0:	3a0e0300 	bcc	380ec8 <__user_program+0x80ec8>
 2c4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2c8:	05000013 	streq	r0, [r0, #-19]
 2cc:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 2d0:	0b3a0e03 	bleq	e83ae4 <__user_program+0xb83ae4>
 2d4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2d8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2dc:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2e0:	06000019 			; <UNDEFINED> instruction: 0x06000019
 2e4:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 2e8:	0b3a0e03 	bleq	e83afc <__user_program+0xb83afc>
 2ec:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2f0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2f4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2f8:	00130119 	andseq	r0, r3, r9, lsl r1
 2fc:	00050700 	andeq	r0, r5, r0, lsl #14
 300:	0b3a0e03 	bleq	e83b14 <__user_program+0xb83b14>
 304:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 308:	00001802 	andeq	r1, r0, r2, lsl #16
 30c:	3f002e08 	svccc	0x00002e08
 310:	3a0e0319 	bcc	380f7c <__user_program+0x80f7c>
 314:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 318:	11134919 	tstne	r3, r9, lsl r9
 31c:	40061201 	andmi	r1, r6, r1, lsl #4
 320:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 324:	01000000 	mrseq	r0, (UNDEF: 0)
 328:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 32c:	0e030b13 	vmoveq.32	d3[0], r0
 330:	01110e1b 	tsteq	r1, fp, lsl lr
 334:	17100612 			; <UNDEFINED> instruction: 0x17100612
 338:	24020000 	strcs	r0, [r2], #-0
 33c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 340:	000e030b 	andeq	r0, lr, fp, lsl #6
 344:	00240300 	eoreq	r0, r4, r0, lsl #6
 348:	0b3e0b0b 	bleq	f82f7c <__user_program+0xc82f7c>
 34c:	00000803 	andeq	r0, r0, r3, lsl #16
 350:	03001604 	movweq	r1, #1540	; 0x604
 354:	3b0b3a0e 	blcc	2ceb94 <__end+0x1a1b94>
 358:	0013490b 	andseq	r4, r3, fp, lsl #18
 35c:	012e0500 	teqeq	lr, r0, lsl #10
 360:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 364:	0b3b0b3a 	bleq	ec3054 <__user_program+0xbc3054>
 368:	01111927 	tsteq	r1, r7, lsr #18
 36c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 370:	01194297 			; <UNDEFINED> instruction: 0x01194297
 374:	06000013 			; <UNDEFINED> instruction: 0x06000013
 378:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 37c:	0b3b0b3a 	bleq	ec306c <__user_program+0xbc306c>
 380:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 384:	2e070000 	cdpcs	0, 0, cr0, cr7, cr0, {0}
 388:	03193f00 	tsteq	r9, #0, 30
 38c:	3b0b3a0e 	blcc	2cebcc <__end+0x1a1bcc>
 390:	1119270b 	tstne	r9, fp, lsl #14
 394:	40061201 	andmi	r1, r6, r1, lsl #4
 398:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 39c:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 3a0:	03193f00 	tsteq	r9, #0, 30
 3a4:	3b0b3a0e 	blcc	2cebe4 <__end+0x1a1be4>
 3a8:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 3ac:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 3b0:	97184006 	ldrls	r4, [r8, -r6]
 3b4:	00001942 	andeq	r1, r0, r2, asr #18
 3b8:	01110100 	tsteq	r1, r0, lsl #2
 3bc:	0b130e25 	bleq	4c3c58 <__user_program+0x1c3c58>
 3c0:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 3c4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3c8:	00001710 	andeq	r1, r0, r0, lsl r7
 3cc:	0b002402 	bleq	93dc <.LC1+0x354>
 3d0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3d4:	0300000e 	movweq	r0, #14
 3d8:	0b0b0024 	bleq	2c0470 <__end+0x193470>
 3dc:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 3e0:	16040000 	strne	r0, [r4], -r0
 3e4:	3a0e0300 	bcc	380fec <__user_program+0x80fec>
 3e8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3ec:	05000013 	streq	r0, [r0, #-19]
 3f0:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 3f4:	0b3a0803 	bleq	e82408 <__user_program+0xb82408>
 3f8:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 3fc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 400:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 404:	06000019 			; <UNDEFINED> instruction: 0x06000019
 408:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 40c:	0b3a0803 	bleq	e82420 <__user_program+0xb82420>
 410:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 414:	01111349 	tsteq	r1, r9, asr #6
 418:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 41c:	00194297 	mulseq	r9, r7, r2
 420:	11010000 	mrsne	r0, (UNDEF: 1)
 424:	11061000 	mrsne	r1, (UNDEF: 6)
 428:	03011201 	movweq	r1, #4609	; 0x1201
 42c:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 430:	00051308 	andeq	r1, r5, r8, lsl #6
 434:	11010000 	mrsne	r0, (UNDEF: 1)
 438:	11061000 	mrsne	r1, (UNDEF: 6)
 43c:	03011201 	movweq	r1, #4609	; 0x1201
 440:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 444:	00051308 	andeq	r1, r5, r8, lsl #6
 448:	11010000 	mrsne	r0, (UNDEF: 1)
 44c:	11061000 	mrsne	r1, (UNDEF: 6)
 450:	03011201 	movweq	r1, #4609	; 0x1201
 454:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 458:	00051308 	andeq	r1, r5, r8, lsl #6
 45c:	11010000 	mrsne	r0, (UNDEF: 1)
 460:	11061000 	mrsne	r1, (UNDEF: 6)
 464:	03011201 	movweq	r1, #4609	; 0x1201
 468:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 46c:	00051308 	andeq	r1, r5, r8, lsl #6
	...

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
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000160 	andeq	r0, r0, r0, ror #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01b50002 			; <UNDEFINED> instruction: 0x01b50002
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  34:	00000158 	andeq	r0, r0, r8, asr r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	02960002 	addseq	r0, r6, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000830c 	andeq	r8, r0, ip, lsl #6
  54:	00000388 	andeq	r0, r0, r8, lsl #7
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	04cf0002 	strbeq	r0, [pc], #2	; 6c <__start-0x7f94>
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008694 	muleq	r0, r4, r6
  74:	00000064 	andeq	r0, r0, r4, rrx
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	05930002 	ldreq	r0, [r3, #2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000086f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  94:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	066c0002 	strbteq	r0, [ip], -r2
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008780 	andeq	r8, r0, r0, lsl #15
  b4:	0000005c 	andeq	r0, r0, ip, asr r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	06fb0002 	ldrbteq	r0, [fp], r2
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008000 	andeq	r8, r0, r0
  d4:	00000054 	andeq	r0, r0, r4, asr r0
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	07580002 	ldrbeq	r0, [r8, -r2]
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	000087dc 	ldrdeq	r8, [r0], -ip
  f4:	00000044 	andeq	r0, r0, r4, asr #32
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	07b40002 	ldreq	r0, [r4, r2]!
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00008820 	andeq	r8, r0, r0, lsr #16
 114:	00000158 	andeq	r0, r0, r8, asr r1
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	080c0002 	stmdaeq	ip, {r1}
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008978 	andeq	r8, r0, r8, ror r9
 134:	00000158 	andeq	r0, r0, r8, asr r1
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000082 	andeq	r0, r0, r2, lsl #1
   4:	004f0002 	subeq	r0, pc, r2
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
  38:	6f697067 	svcvs	0x00697067
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	736b0000 	cmnvc	fp, #0
  44:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  48:	00682e74 	rsbeq	r2, r8, r4, ror lr
  4c:	61000002 	tstvs	r0, r2
  50:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
  54:	00000200 	andeq	r0, r0, r0, lsl #4
  58:	02050000 	andeq	r0, r5, #0
  5c:	00008054 	andeq	r8, r0, r4, asr r0
  60:	0100d303 	tsteq	r0, r3, lsl #6
  64:	84a06a13 	strthi	r6, [r0], #2579	; 0xa13
  68:	4e2f4b83 	vmulmi.f64	d4, d31, d3
  6c:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  70:	4b4d13bf 	blmi	1344f74 <__user_program+0x1044f74>
  74:	6513bfd8 	ldrvs	fp, [r3, #-4056]	; 0xfd8
  78:	4b4b674f 	blmi	12d9dbc <__user_program+0xfd9dbc>
  7c:	9f684bbb 	svcls	0x00684bbb
  80:	0006024b 	andeq	r0, r6, fp, asr #4
  84:	00ae0101 	adceq	r0, lr, r1, lsl #2
  88:	00020000 	andeq	r0, r2, r0
  8c:	00000054 	andeq	r0, r0, r4, asr r0
  90:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  94:	0101000d 	tsteq	r1, sp
  98:	00000101 	andeq	r0, r0, r1, lsl #2
  9c:	00000100 	andeq	r0, r0, r0, lsl #2
  a0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  a4:	5f6c656e 	svcpl	0x006c656e
  a8:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
  ac:	617a696d 	cmnvs	sl, sp, ror #18
  b0:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
  b4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  b8:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
  bc:	6b62696c 	blvs	189a674 <__user_program+0x159a674>
  c0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  c4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  c8:	656b0000 	strbvs	r0, [fp, #-0]!
  cc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  d0:	0100632e 	tsteq	r0, lr, lsr #6
  d4:	736b0000 	cmnvc	fp, #0
  d8:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  dc:	00682e74 	rsbeq	r2, r8, r4, ror lr
  e0:	00000002 	andeq	r0, r0, r2
  e4:	b4020500 	strlt	r0, [r2], #-1280	; 0x500
  e8:	03000081 	movweq	r0, #129	; 0x81
  ec:	4d670117 	stfmie	f0, [r7, #-92]!	; 0xffffffa4
  f0:	04020030 	streq	r0, [r2], #-48	; 0x30
  f4:	02006803 	andeq	r6, r0, #196608	; 0x30000
  f8:	009f0304 	addseq	r0, pc, r4, lsl #6
  fc:	9b030402 	blls	c110c <__bss_end+0xb510c>
 100:	01040200 	mrseq	r0, R12_usr
 104:	6d066606 	stcvs	6, cr6, [r6, #-24]	; 0xffffffe8
 108:	4b672f67 	blmi	19cbeac <__user_program+0x16cbeac>
 10c:	672f6785 	strvs	r6, [pc, -r5, lsl #15]!
 110:	0868854b 	stmdaeq	r8!, {r0, r1, r3, r6, r8, sl, pc}^
 114:	004b673f 	subeq	r6, fp, pc, lsr r7
 118:	03020402 	movweq	r0, #9218	; 0x2402
 11c:	02002e79 	andeq	r2, r0, #1936	; 0x790
 120:	66060104 	strvs	r0, [r6], -r4, lsl #2
 124:	660a0306 	strvs	r0, [sl], -r6, lsl #6
 128:	04020069 	streq	r0, [r2], #-105	; 0x69
 12c:	02006a01 	andeq	r6, r0, #4096	; 0x1000
 130:	02670104 	rsbeq	r0, r7, #4, 2
 134:	01010002 	tsteq	r1, r2
 138:	000000d6 	ldrdeq	r0, [r0], -r6
 13c:	006f0002 	rsbeq	r0, pc, r2
 140:	01020000 	mrseq	r0, (UNDEF: 2)
 144:	000d0efb 	strdeq	r0, [sp], -fp
 148:	01010101 	tsteq	r1, r1, lsl #2
 14c:	01000000 	mrseq	r0, (UNDEF: 0)
 150:	6b010000 	blvs	40158 <__bss_end+0x34158>
 154:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 158:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 15c:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 160:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 164:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 168:	33006372 	movwcc	r6, #882	; 0x372
 16c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 170:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 174:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 178:	00006564 	andeq	r6, r0, r4, ror #10
 17c:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 180:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 184:	00000100 	andeq	r0, r0, r0, lsl #2
 188:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 18c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 190:	00020068 	andeq	r0, r2, r8, rrx
 194:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 198:	67726164 	ldrbvs	r6, [r2, -r4, ror #2]!
 19c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1a0:	623c0000 	eorsvs	r0, ip, #0
 1a4:	746c6975 	strbtvc	r6, [ip], #-2421	; 0x975
 1a8:	3e6e692d 	cdpcc	9, 6, cr6, cr14, cr13, {1}
 1ac:	00000000 	andeq	r0, r0, r0
 1b0:	02050000 	andeq	r0, r5, #0
 1b4:	0000830c 	andeq	r8, r0, ip, lsl #6
 1b8:	d7012003 	strle	r2, [r1, -r3]
 1bc:	8367694c 	cmnhi	r7, #76, 18	; 0x130000
 1c0:	04020067 	streq	r0, [r2], #-103	; 0x67
 1c4:	02006b01 	andeq	r6, r0, #1024	; 0x400
 1c8:	ad080104 	stfges	f0, [r8, #-16]
 1cc:	01040200 	mrseq	r0, R12_usr
 1d0:	2f6769d7 	svccs	0x006769d7
 1d4:	812f86b9 			; <UNDEFINED> instruction: 0x812f86b9
 1d8:	4d854df5 	stcmi	13, cr4, [r5, #980]	; 0x3d4
 1dc:	30bb8330 	adcscc	r8, fp, r0, lsr r3
 1e0:	15320268 	ldrne	r0, [r2, #-616]!	; 0x268
 1e4:	be4b679f 	mcrlt	7, 2, r6, cr11, cr15, {4}
 1e8:	9f32a02c 	svcls	0x0032a02c
 1ec:	9f9f329f 	svcls	0x009f329f
 1f0:	329f9f33 	addscc	r9, pc, #51, 30	; 0xcc
 1f4:	64832f9f 	strvs	r2, [r3], #3999	; 0xf9f
 1f8:	839f3286 	orrshi	r3, pc, #1610612744	; 0x60000008
 1fc:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 200:	667fbf03 	ldrbtvs	fp, [pc], -r3, lsl #30
 204:	8200c503 	andhi	ip, r0, #12582912	; 0xc00000
 208:	01040200 	mrseq	r0, R12_usr
 20c:	000a022f 	andeq	r0, sl, pc, lsr #4
 210:	006f0101 	rsbeq	r0, pc, r1, lsl #2
 214:	00020000 	andeq	r0, r2, r0
 218:	00000052 	andeq	r0, r0, r2, asr r0
 21c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 220:	0101000d 	tsteq	r1, sp
 224:	00000101 	andeq	r0, r0, r1, lsl #2
 228:	00000100 	andeq	r0, r0, r0, lsl #2
 22c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 230:	5f6c656e 	svcpl	0x006c656e
 234:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 238:	617a696d 	cmnvs	sl, sp, ror #18
 23c:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
 240:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 244:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 248:	6b62696c 	blvs	189a800 <__user_program+0x159a800>
 24c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 250:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 254:	61750000 	cmnvs	r5, r0
 258:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 25c:	00000100 	andeq	r0, r0, r0, lsl #2
 260:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 264:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 268:	00020068 	andeq	r0, r2, r8, rrx
 26c:	05000000 	streq	r0, [r0, #-0]
 270:	00869402 	addeq	r9, r6, r2, lsl #8
 274:	010c0300 	mrseq	r0, LR_mon
 278:	694b694b 	stmdbvs	fp, {r0, r1, r3, r6, r8, fp, sp, lr}^
 27c:	2f4b699f 	svccs	0x004b699f
 280:	01000802 	tsteq	r0, r2, lsl #16
 284:	00007601 	andeq	r7, r0, r1, lsl #12
 288:	53000200 	movwpl	r0, #512	; 0x200
 28c:	02000000 	andeq	r0, r0, #0
 290:	0d0efb01 	vstreq	d15, [lr, #-4]
 294:	01010100 	mrseq	r0, (UNDEF: 17)
 298:	00000001 	andeq	r0, r0, r1
 29c:	01000001 	tsteq	r0, r1
 2a0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2a4:	6f5f6c65 	svcvs	0x005f6c65
 2a8:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 2ac:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 2b0:	2f6e6f69 	svccs	0x006e6f69
 2b4:	00637273 	rsbeq	r7, r3, r3, ror r2
 2b8:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 2bc:	2f6b6269 	svccs	0x006b6269
 2c0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2c4:	00656475 	rsbeq	r6, r5, r5, ror r4
 2c8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2cc:	632e7265 	teqvs	lr, #1342177286	; 0x50000006
 2d0:	00000100 	andeq	r0, r0, r0, lsl #2
 2d4:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 2d8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 2dc:	00020068 	andeq	r0, r2, r8, rrx
 2e0:	05000000 	streq	r0, [r0, #-0]
 2e4:	0086f802 	addeq	pc, r6, r2, lsl #16
 2e8:	010b0300 	mrseq	r0, (UNDEF: 59)
 2ec:	4b682f83 	blmi	1a0c100 <__user_program+0x170c100>
 2f0:	2f4b682f 	svccs	0x004b682f
 2f4:	852f4b84 	strhi	r4, [pc, #-2948]!	; fffff778 <__user_program+0xffcff778>
 2f8:	06022f4b 	streq	r2, [r2], -fp, asr #30
 2fc:	70010100 	andvc	r0, r1, r0, lsl #2
 300:	02000000 	andeq	r0, r0, #0
 304:	00005500 	andeq	r5, r0, r0, lsl #10
 308:	fb010200 	blx	40b12 <__bss_end+0x34b12>
 30c:	01000d0e 	tsteq	r0, lr, lsl #26
 310:	00010101 	andeq	r0, r1, r1, lsl #2
 314:	00010000 	andeq	r0, r1, r0
 318:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 31c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 320:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 324:	7a696d69 	bvc	1a5b8d0 <__user_program+0x175b8d0>
 328:	6f697461 	svcvs	0x00697461
 32c:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 330:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 334:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 338:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 33c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 340:	74000065 	strvc	r0, [r0], #-101	; 0x65
 344:	745f6369 	ldrbvc	r6, [pc], #-873	; 34c <__start-0x7cb4>
 348:	632e636f 	teqvs	lr, #-1140850687	; 0xbc000001
 34c:	00000100 	andeq	r0, r0, r0, lsl #2
 350:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 354:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 358:	00020068 	andeq	r0, r2, r8, rrx
 35c:	05000000 	streq	r0, [r0, #-0]
 360:	00878002 	addeq	r8, r7, r2
 364:	01170300 	tsteq	r7, r0, lsl #6
 368:	6d83854c 	cfstr32vs	mvfx8, [r3, #304]	; 0x130
 36c:	0802834b 	stmdaeq	r2, {r0, r1, r3, r6, r8, r9, pc}
 370:	54010100 	strpl	r0, [r1], #-256	; 0x100
 374:	02000000 	andeq	r0, r0, #0
 378:	00002900 	andeq	r2, r0, r0, lsl #18
 37c:	fb010200 	blx	40b86 <__bss_end+0x34b86>
 380:	01000d0e 	tsteq	r0, lr, lsl #26
 384:	00010101 	andeq	r0, r1, r1, lsl #2
 388:	00010000 	andeq	r0, r1, r0
 38c:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
 390:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 394:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 398:	62000063 	andvs	r0, r0, #99	; 0x63
 39c:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
 3a0:	00010053 	andeq	r0, r1, r3, asr r0
 3a4:	05000000 	streq	r0, [r0, #-0]
 3a8:	00800002 	addeq	r0, r0, r2
 3ac:	011b0300 	tsteq	fp, r0, lsl #6
 3b0:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 3b4:	2f2f2f2f 	svccs	0x002f2f2f
 3b8:	2f312f2f 	svccs	0x00312f2f
 3bc:	2f33312f 	svccs	0x0033312f
 3c0:	312e6903 	teqcc	lr, r3, lsl #18
 3c4:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 3c8:	4d010100 	stfmis	f0, [r1, #-0]
 3cc:	02000000 	andeq	r0, r0, #0
 3d0:	00002800 	andeq	r2, r0, r0, lsl #16
 3d4:	fb010200 	blx	40bde <__bss_end+0x34bde>
 3d8:	01000d0e 	tsteq	r0, lr, lsl #26
 3dc:	00010101 	andeq	r0, r1, r1, lsl #2
 3e0:	00010000 	andeq	r0, r1, r0
 3e4:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
 3e8:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 3ec:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 3f0:	61000063 	tstvs	r0, r3, rrx
 3f4:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 3f8:	00000100 	andeq	r0, r0, r0, lsl #2
 3fc:	02050000 	andeq	r0, r5, #0
 400:	000087dc 	ldrdeq	r8, [r0], -ip
 404:	2f011003 	svccs	0x00011003
 408:	332f332f 	teqcc	pc, #-1140850688	; 0xbc000000
 40c:	2f2f332f 	svccs	0x002f332f
 410:	2f332f2f 	svccs	0x00332f2f
 414:	022f2f2f 	eoreq	r2, pc, #47, 30	; 0xbc
 418:	01010002 	tsteq	r1, r2
 41c:	00000090 	muleq	r0, r0, r0
 420:	00240002 	eoreq	r0, r4, r2
 424:	01020000 	mrseq	r0, (UNDEF: 2)
 428:	000d0efb 	strdeq	r0, [sp], -fp
 42c:	01010101 	tsteq	r1, r1, lsl #2
 430:	01000000 	mrseq	r0, (UNDEF: 0)
 434:	00010000 	andeq	r0, r1, r0
 438:	706f6e75 	rsbvc	r6, pc, r5, ror lr	; <UNPREDICTABLE>
 43c:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 440:	2e64657a 	mcrcs	5, 3, r6, cr4, cr10, {3}
 444:	00000063 	andeq	r0, r0, r3, rrx
 448:	05000000 	streq	r0, [r0, #-0]
 44c:	00882002 	addeq	r2, r8, r2
 450:	01150300 	tsteq	r5, r0, lsl #6
 454:	2f2f2f2f 	svccs	0x002f2f2f
 458:	2f2f2f2f 	svccs	0x002f2f2f
 45c:	2f2f2f2f 	svccs	0x002f2f2f
 460:	2f302f2f 	svccs	0x00302f2f
 464:	2f2e0903 	svccs	0x002e0903
 468:	2f2f2f2f 	svccs	0x002f2f2f
 46c:	2f2f302f 	svccs	0x002f302f
 470:	2f302f2f 	svccs	0x00302f2f
 474:	2f2f2f2f 	svccs	0x002f2f2f
 478:	2f2f2f2f 	svccs	0x002f2f2f
 47c:	2f2f2f2f 	svccs	0x002f2f2f
 480:	2f2f2f2f 	svccs	0x002f2f2f
 484:	2f2f2f2f 	svccs	0x002f2f2f
 488:	2f2f2f2f 	svccs	0x002f2f2f
 48c:	2f2f2f2f 	svccs	0x002f2f2f
 490:	2f2f2f2f 	svccs	0x002f2f2f
 494:	2f2f2f2f 	svccs	0x002f2f2f
 498:	2f2f2f2f 	svccs	0x002f2f2f
 49c:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 4a0:	2f2f2f2f 	svccs	0x002f2f2f
 4a4:	2f2f302f 	svccs	0x002f302f
 4a8:	022f302f 	eoreq	r3, pc, #47	; 0x2f
 4ac:	01010002 	tsteq	r1, r2
 4b0:	00000090 	muleq	r0, r0, r0
 4b4:	00240002 	eoreq	r0, r4, r2
 4b8:	01020000 	mrseq	r0, (UNDEF: 2)
 4bc:	000d0efb 	strdeq	r0, [sp], -fp
 4c0:	01010101 	tsteq	r1, r1, lsl #2
 4c4:	01000000 	mrseq	r0, (UNDEF: 0)
 4c8:	00010000 	andeq	r0, r1, r0
 4cc:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 4d0:	657a696d 	ldrbvs	r6, [sl, #-2413]!	; 0x96d
 4d4:	2e656d5f 	mcrcs	13, 3, r6, cr5, cr15, {2}
 4d8:	00000063 	andeq	r0, r0, r3, rrx
 4dc:	05000000 	streq	r0, [r0, #-0]
 4e0:	00897802 	addeq	r7, r9, r2, lsl #16
 4e4:	01150300 	tsteq	r5, r0, lsl #6
 4e8:	2f2f2f2f 	svccs	0x002f2f2f
 4ec:	2f2f2f2f 	svccs	0x002f2f2f
 4f0:	2f2f2f2f 	svccs	0x002f2f2f
 4f4:	2f302f2f 	svccs	0x00302f2f
 4f8:	2f2e0903 	svccs	0x002e0903
 4fc:	2f2f2f2f 	svccs	0x002f2f2f
 500:	2f2f302f 	svccs	0x002f302f
 504:	2f302f2f 	svccs	0x00302f2f
 508:	2f2f2f2f 	svccs	0x002f2f2f
 50c:	2f2f2f2f 	svccs	0x002f2f2f
 510:	2f2f2f2f 	svccs	0x002f2f2f
 514:	2f2f2f2f 	svccs	0x002f2f2f
 518:	2f2f2f2f 	svccs	0x002f2f2f
 51c:	2f2f2f2f 	svccs	0x002f2f2f
 520:	2f2f2f2f 	svccs	0x002f2f2f
 524:	2f2f2f2f 	svccs	0x002f2f2f
 528:	2f2f2f2f 	svccs	0x002f2f2f
 52c:	2f2f2f2f 	svccs	0x002f2f2f
 530:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 534:	2f2f2f2f 	svccs	0x002f2f2f
 538:	2f2f302f 	svccs	0x002f302f
 53c:	022f302f 	eoreq	r3, pc, #47	; 0x2f
 540:	01010002 	tsteq	r1, r2

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
  1c:	6f697067 	svcvs	0x00697067
  20:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  24:	65735f6f 	ldrbvs	r5, [r3, #-3951]!	; 0xf6f
  28:	6f6c0074 	svcvs	0x006c0074
  2c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  30:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  34:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  38:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  3c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  40:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  44:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  48:	4e470072 	mcrmi	0, 2, r0, cr7, cr2, {3}
  4c:	20432055 	subcs	r2, r3, r5, asr r0
  50:	2e392e34 	mrccs	14, 1, r2, cr9, cr4, {1}
  54:	30322033 	eorscc	r2, r2, r3, lsr r0
  58:	35303531 	ldrcc	r3, [r0, #-1329]!	; 0x531
  5c:	28203932 	stmdacs	r0!, {r1, r4, r5, r8, fp, ip, sp}
  60:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
  64:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
  68:	52415b20 	subpl	r5, r1, #32, 22	; 0x8000
  6c:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
  70:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
  74:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
  78:	622d395f 	eorvs	r3, sp, #1556480	; 0x17c000
  7c:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  80:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
  84:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  88:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  8c:	38323432 	ldmdacc	r2!, {r1, r4, r5, sl, ip, sp}
  90:	2d205d38 	stccs	13, cr5, [r0, #-224]!	; 0xffffff20
  94:	6f6c666d 	svcvs	0x006c666d
  98:	612d7461 	teqvs	sp, r1, ror #8
  9c:	733d6962 	teqvc	sp, #1605632	; 0x188000
  a0:	2074666f 	rsbscs	r6, r4, pc, ror #12
  a4:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
  a8:	613d6863 	teqvs	sp, r3, ror #16
  ac:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
  b0:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
  b4:	4f2d2067 	svcmi	0x002d2067
  b8:	662d2031 			; <UNDEFINED> instruction: 0x662d2031
  bc:	65657266 	strbvs	r7, [r5, #-614]!	; 0x266
  c0:	6e617473 	mcrvs	4, 3, r7, cr1, cr3, {3}
  c4:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
  c8:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  cc:	745f3874 	ldrbvc	r3, [pc], #-2164	; d4 <__start-0x7f2c>
  d0:	736e7500 	cmnvc	lr, #0, 10
  d4:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  d8:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  dc:	75007261 	strvc	r7, [r0, #-609]	; 0x261
  e0:	33746e69 	cmncc	r4, #1680	; 0x690
  e4:	00745f32 	rsbseq	r5, r4, r2, lsr pc
  e8:	616c6564 	cmnvs	ip, r4, ror #10
  ec:	79635f79 	stmdbvc	r3!, {r0, r3, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  f0:	73656c63 	cmnvc	r5, #25344	; 0x6300
  f4:	6f682f00 	svcvs	0x00682f00
  f8:	652f656d 	strvs	r6, [pc, #-1389]!	; fffffb93 <__user_program+0xffcffb93>
  fc:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 100:	656e2f39 	strbvs	r2, [lr, #-3897]!	; 0xf39
 104:	62616c77 	rsbvs	r6, r1, #30464	; 0x7700
 108:	34332f32 	ldrtcc	r2, [r3], #-3890	; 0xf32
 10c:	31662d39 	cmncc	r6, r9, lsr sp
 110:	6f632f36 	svcvs	0x00632f36
 114:	73006564 	movwvc	r6, #1380	; 0x564
 118:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xf68
 11c:	736e7520 	cmnvc	lr, #32, 10	; 0x8000000
 120:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
 124:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
 128:	74730074 	ldrbtvc	r0, [r3], #-116	; 0x74
 12c:	00657461 	rsbeq	r7, r5, r1, ror #8
 130:	6f697067 	svcvs	0x00697067
 134:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 138:	00676966 	rsbeq	r6, r7, r6, ror #18
 13c:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 140:	6e692074 	mcrvs	0, 3, r2, cr9, cr4, {3}
 144:	666f0074 			; <UNDEFINED> instruction: 0x666f0074
 148:	74657366 	strbtvc	r7, [r5], #-870	; 0x366
 14c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 150:	6b62696c 	blvs	189a708 <__user_program+0x159a708>
 154:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 158:	6970672f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r8, r9, sl, sp, lr}^
 15c:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 160:	61727261 	cmnvs	r2, r1, ror #4
 164:	6b003179 	blvs	c750 <__bss_end+0x750>
 168:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 16c:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 170:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 174:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 178:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 17c:	6b2f6372 	blvs	bd8f4c <__user_program+0x8d8f4c>
 180:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 184:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 188:	61727261 	cmnvs	r2, r1, ror #4
 18c:	74003279 	strvc	r3, [r0], #-633	; 0x279
 190:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 194:	756c6156 	strbvc	r6, [ip, #-342]!	; 0x156
 198:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 19c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 1a0:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 1a4:	4e47006e 	cdpmi	0, 4, cr0, cr7, cr14, {3}
 1a8:	20432055 	subcs	r2, r3, r5, asr r0
 1ac:	2e392e34 	mrccs	14, 1, r2, cr9, cr4, {1}
 1b0:	30322033 	eorscc	r2, r2, r3, lsr r0
 1b4:	35303531 	ldrcc	r3, [r0, #-1329]!	; 0x531
 1b8:	28203932 	stmdacs	r0!, {r1, r4, r5, r8, fp, ip, sp}
 1bc:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
 1c0:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
 1c4:	52415b20 	subpl	r5, r1, #32, 22	; 0x8000
 1c8:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
 1cc:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
 1d0:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
 1d4:	622d395f 	eorvs	r3, sp, #1556480	; 0x17c000
 1d8:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
 1dc:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
 1e0:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
 1e4:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
 1e8:	38323432 	ldmdacc	r2!, {r1, r4, r5, sl, ip, sp}
 1ec:	2d205d38 	stccs	13, cr5, [r0, #-224]!	; 0xffffff20
 1f0:	6f6c666d 	svcvs	0x006c666d
 1f4:	612d7461 	teqvs	sp, r1, ror #8
 1f8:	733d6962 	teqvc	sp, #1605632	; 0x188000
 1fc:	2074666f 	rsbscs	r6, r4, pc, ror #12
 200:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
 204:	613d6863 	teqvs	sp, r3, ror #16
 208:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
 20c:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
 210:	4f2d2067 	svcmi	0x002d2067
 214:	4f2d2031 	svcmi	0x002d2031
 218:	662d2030 			; <UNDEFINED> instruction: 0x662d2030
 21c:	65657266 	strbvs	r7, [r5, #-614]!	; 0x266
 220:	6e617473 	mcrvs	4, 3, r7, cr1, cr3, {3}
 224:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 228:	6f6f6700 	svcvs	0x006f6700
 22c:	69730064 	ldmdbvs	r3!, {r2, r5, r6}^
 230:	7974657a 	ldmdbvc	r4!, {r1, r3, r4, r5, r6, r8, sl, sp, lr}^
 234:	62006570 	andvs	r6, r0, #112, 10	; 0x1c000000
 238:	5f657479 	svcpl	0x00657479
 23c:	00727470 	rsbseq	r7, r2, r0, ror r4
 240:	66657270 			; <UNDEFINED> instruction: 0x66657270
 244:	75007869 	strvc	r7, [r0, #-2153]	; 0x869
 248:	36746e69 	ldrbtcc	r6, [r4], -r9, ror #28
 24c:	00745f34 	rsbseq	r5, r4, r4, lsr pc
 250:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0x162
 254:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
 258:	696c5f61 	stmdbvs	ip!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
 25c:	70007473 	andvc	r7, r0, r3, ror r4
 260:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 264:	6b6d756e 	blvs	1b5d824 <__user_program+0x185d824>
 268:	67696400 	strbvs	r6, [r9, -r0, lsl #8]!
 26c:	00737469 	rsbseq	r7, r3, r9, ror #8
 270:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 274:	6f5f6c65 	svcvs	0x005f6c65
 278:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 27c:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 280:	2f6e6f69 	svccs	0x006e6f69
 284:	2f637273 	svccs	0x00637273
 288:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 28c:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 290:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 294:	006b746e 	rsbeq	r7, fp, lr, ror #8
 298:	73677261 	cmnvc	r7, #268435462	; 0x10000006
 29c:	615f5f00 	cmpvs	pc, r0, lsl #30
 2a0:	61750070 	cmnvs	r5, r0, ror r0
 2a4:	675f7472 			; <UNDEFINED> instruction: 0x675f7472
 2a8:	625f7465 	subsvs	r7, pc, #1694498816	; 0x65000000
 2ac:	00657479 	rsbeq	r7, r5, r9, ror r4
 2b0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2b4:	6f5f6c65 	svcvs	0x005f6c65
 2b8:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 2bc:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 2c0:	2f6e6f69 	svccs	0x006e6f69
 2c4:	2f637273 	svccs	0x00637273
 2c8:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2cc:	7500632e 	strvc	r6, [r0, #-814]	; 0x32e
 2d0:	5f747261 	svcpl	0x00747261
 2d4:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 2d8:	72617500 	rsbvc	r7, r1, #0, 10
 2dc:	75705f74 	ldrbvc	r5, [r0, #-3956]!	; 0xf74
 2e0:	79625f74 	stmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 2e4:	75006574 	strvc	r6, [r0, #-1396]	; 0x574
 2e8:	5f747261 	svcpl	0x00747261
 2ec:	736f6c63 	cmnvc	pc, #25344	; 0x6300
 2f0:	69740065 	ldmdbvs	r4!, {r0, r2, r5, r6}^
 2f4:	5f72656d 	svcpl	0x0072656d
 2f8:	61656c63 	cmnvs	r5, r3, ror #24
 2fc:	65705f72 	ldrbvs	r5, [r0, #-3954]!	; 0xf72
 300:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 304:	656b0067 	strbvs	r0, [fp, #-103]!	; 0x67
 308:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 30c:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 310:	7a696d69 	bvc	1a5b8bc <__user_program+0x175b8bc>
 314:	6f697461 	svcvs	0x00697461
 318:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 31c:	69742f63 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 320:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 324:	72660063 	rsbvc	r0, r6, #99	; 0x63
 328:	74007165 	strvc	r7, [r0], #-357	; 0x165
 32c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 330:	6174735f 	cmnvs	r4, pc, asr r3
 334:	74007472 	strvc	r7, [r0], #-1138	; 0x472
 338:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 33c:	5f73695f 	svcpl	0x0073695f
 340:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 344:	00676e69 	rsbeq	r6, r7, r9, ror #28
 348:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 34c:	74735f72 	ldrbtvc	r5, [r3], #-3954	; 0xf72
 350:	7400706f 	strvc	r7, [r0], #-111	; 0x6f
 354:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 358:	6165725f 	cmnvs	r5, pc, asr r2
 35c:	656b0064 	strbvs	r0, [fp, #-100]!	; 0x64
 360:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 364:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 368:	7a696d69 	bvc	1a5b914 <__user_program+0x175b914>
 36c:	6f697461 	svcvs	0x00697461
 370:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 374:	69742f63 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 378:	6f745f63 	svcvs	0x00745f63
 37c:	00632e63 	rsbeq	r2, r3, r3, ror #28

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
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	0000000c 	andeq	r0, r0, ip
  24:	00000000 	andeq	r0, r0, r0
  28:	000080a8 	andeq	r8, r0, r8, lsr #1
  2c:	00000044 	andeq	r0, r0, r4, asr #32
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	000080ec 	andeq	r8, r0, ip, ror #1
  3c:	00000044 	andeq	r0, r0, r4, asr #32
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008130 	andeq	r8, r0, r0, lsr r1
  4c:	00000084 	andeq	r0, r0, r4, lsl #1
  50:	83100e48 	tsthi	r0, #72, 28	; 0x480
  54:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  58:	00018e02 	andeq	r8, r1, r2, lsl #28
  5c:	0000000c 	andeq	r0, r0, ip
  60:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  64:	7c020001 	stcvc	0, cr0, [r2], {1}
  68:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  6c:	00000018 	andeq	r0, r0, r8, lsl r0
  70:	0000005c 	andeq	r0, r0, ip, asr r0
  74:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  78:	00000158 	andeq	r0, r0, r8, asr r1
  7c:	8b080e42 	blhi	20398c <__end+0xd698c>
  80:	42018e02 	andmi	r8, r1, #2, 28
  84:	00040b0c 	andeq	r0, r4, ip, lsl #22
  88:	0000000c 	andeq	r0, r0, ip
  8c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  90:	7c020001 	stcvc	0, cr0, [r2], {1}
  94:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  98:	00000020 	andeq	r0, r0, r0, lsr #32
  9c:	00000088 	andeq	r0, r0, r8, lsl #1
  a0:	0000830c 	andeq	r8, r0, ip, lsl #6
  a4:	00000138 	andeq	r0, r0, r8, lsr r1
  a8:	840c0e42 	strhi	r0, [ip], #-3650	; 0xe42
  ac:	8e028b03 	vmlahi.f64	d8, d2, d3
  b0:	0b0c4201 	bleq	3108bc <__user_program+0x108bc>
  b4:	0c960204 	lfmeq	f0, 4, [r6], {4}
  b8:	00000c0d 	andeq	r0, r0, sp, lsl #24
  bc:	00000034 	andeq	r0, r0, r4, lsr r0
  c0:	00000088 	andeq	r0, r0, r8, lsl #1
  c4:	00008444 	andeq	r8, r0, r4, asr #8
  c8:	00000250 	andeq	r0, r0, r0, asr r2
  cc:	80100e42 	andshi	r0, r0, r2, asr #28
  d0:	82038104 	andhi	r8, r3, #4, 2
  d4:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
  d8:	068b180e 	streq	r1, [fp], lr, lsl #16
  dc:	0c42058e 	cfstr64eq	mvdx0, [r2], {142}	; 0x8e
  e0:	1c03140b 	cfstrsne	mvf1, [r3], {11}
  e4:	180d0c01 	stmdane	sp, {r0, sl, fp}
  e8:	0ecbce42 	cdpeq	14, 12, cr12, cr11, cr2, {2}
  ec:	c2c34210 	sbcgt	r4, r3, #16, 4
  f0:	000ec0c1 	andeq	ip, lr, r1, asr #1
  f4:	0000000c 	andeq	r0, r0, ip
  f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 100:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 104:	0000001c 	andeq	r0, r0, ip, lsl r0
 108:	000000f4 	strdeq	r0, [r0], -r4
 10c:	00008694 	muleq	r0, r4, r6
 110:	00000014 	andeq	r0, r0, r4, lsl r0
 114:	8b040e42 	blhi	103a24 <__bss_end+0xf7a24>
 118:	0b0d4201 	bleq	350924 <__user_program+0x50924>
 11c:	420d0d42 	andmi	r0, sp, #4224	; 0x1080
 120:	00000ecb 	andeq	r0, r0, fp, asr #29
 124:	0000001c 	andeq	r0, r0, ip, lsl r0
 128:	000000f4 	strdeq	r0, [r0], -r4
 12c:	000086a8 	andeq	r8, r0, r8, lsr #13
 130:	00000014 	andeq	r0, r0, r4, lsl r0
 134:	8b040e42 	blhi	103a44 <__bss_end+0xf7a44>
 138:	0b0d4201 	bleq	350944 <__user_program+0x50944>
 13c:	420d0d42 	andmi	r0, sp, #4224	; 0x1080
 140:	00000ecb 	andeq	r0, r0, fp, asr #29
 144:	0000001c 	andeq	r0, r0, ip, lsl r0
 148:	000000f4 	strdeq	r0, [r0], -r4
 14c:	000086bc 			; <UNDEFINED> instruction: 0x000086bc
 150:	00000020 	andeq	r0, r0, r0, lsr #32
 154:	8b040e42 	blhi	103a64 <__bss_end+0xf7a64>
 158:	0b0d4201 	bleq	350964 <__user_program+0x50964>
 15c:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 160:	00000ecb 	andeq	r0, r0, fp, asr #29
 164:	0000001c 	andeq	r0, r0, ip, lsl r0
 168:	000000f4 	strdeq	r0, [r0], -r4
 16c:	000086dc 	ldrdeq	r8, [r0], -ip
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	8b040e42 	blhi	103a84 <__bss_end+0xf7a84>
 178:	0b0d4201 	bleq	350984 <__user_program+0x50984>
 17c:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 180:	00000ecb 	andeq	r0, r0, fp, asr #29
 184:	0000000c 	andeq	r0, r0, ip
 188:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 18c:	7c020001 	stcvc	0, cr0, [r2], {1}
 190:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 194:	0000001c 	andeq	r0, r0, ip, lsl r0
 198:	00000184 	andeq	r0, r0, r4, lsl #3
 19c:	000086f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 1a0:	00000020 	andeq	r0, r0, r0, lsr #32
 1a4:	8b040e42 	blhi	103ab4 <__bss_end+0xf7ab4>
 1a8:	0b0d4201 	bleq	3509b4 <__user_program+0x509b4>
 1ac:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1b0:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b8:	00000184 	andeq	r0, r0, r4, lsl #3
 1bc:	00008718 	andeq	r8, r0, r8, lsl r7
 1c0:	00000018 	andeq	r0, r0, r8, lsl r0
 1c4:	8b040e42 	blhi	103ad4 <__bss_end+0xf7ad4>
 1c8:	0b0d4201 	bleq	3509d4 <__user_program+0x509d4>
 1cc:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 1d0:	00000ecb 	andeq	r0, r0, fp, asr #29
 1d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d8:	00000184 	andeq	r0, r0, r4, lsl #3
 1dc:	00008730 	andeq	r8, r0, r0, lsr r7
 1e0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1e4:	8b040e42 	blhi	103af4 <__bss_end+0xf7af4>
 1e8:	0b0d4201 	bleq	3509f4 <__user_program+0x509f4>
 1ec:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 1f0:	00000ecb 	andeq	r0, r0, fp, asr #29
 1f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1f8:	00000184 	andeq	r0, r0, r4, lsl #3
 1fc:	0000874c 	andeq	r8, r0, ip, asr #14
 200:	0000001c 	andeq	r0, r0, ip, lsl r0
 204:	8b040e42 	blhi	103b14 <__bss_end+0xf7b14>
 208:	0b0d4201 	bleq	350a14 <__user_program+0x50a14>
 20c:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 210:	00000ecb 	andeq	r0, r0, fp, asr #29
 214:	0000001c 	andeq	r0, r0, ip, lsl r0
 218:	00000184 	andeq	r0, r0, r4, lsl #3
 21c:	00008768 	andeq	r8, r0, r8, ror #14
 220:	00000018 	andeq	r0, r0, r8, lsl r0
 224:	8b040e42 	blhi	103b34 <__bss_end+0xf7b34>
 228:	0b0d4201 	bleq	350a34 <__user_program+0x50a34>
 22c:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 230:	00000ecb 	andeq	r0, r0, fp, asr #29
 234:	0000000c 	andeq	r0, r0, ip
 238:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 23c:	7c020001 	stcvc	0, cr0, [r2], {1}
 240:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 244:	0000001c 	andeq	r0, r0, ip, lsl r0
 248:	00000234 	andeq	r0, r0, r4, lsr r2
 24c:	00008780 	andeq	r8, r0, r0, lsl #15
 250:	00000034 	andeq	r0, r0, r4, lsr r0
 254:	8b040e42 	blhi	103b64 <__bss_end+0xf7b64>
 258:	0b0d4201 	bleq	350a64 <__user_program+0x50a64>
 25c:	420d0d52 	andmi	r0, sp, #5248	; 0x1480
 260:	00000ecb 	andeq	r0, r0, fp, asr #29
 264:	0000001c 	andeq	r0, r0, ip, lsl r0
 268:	00000234 	andeq	r0, r0, r4, lsr r2
 26c:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
 270:	00000028 	andeq	r0, r0, r8, lsr #32
 274:	8b040e42 	blhi	103b84 <__bss_end+0xf7b84>
 278:	0b0d4201 	bleq	350a84 <__user_program+0x50a84>
 27c:	420d0d4c 	andmi	r0, sp, #76, 26	; 0x1300
 280:	00000ecb 	andeq	r0, r0, fp, asr #29
 284:	0000000c 	andeq	r0, r0, ip
 288:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 28c:	7c010001 	stcvc	0, cr0, [r1], {1}
 290:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 294:	00000014 	andeq	r0, r0, r4, lsl r0
 298:	00000284 	andeq	r0, r0, r4, lsl #5
 29c:	00008ad0 	ldrdeq	r8, [r0], -r0
 2a0:	0000003c 	andeq	r0, r0, ip, lsr r0
 2a4:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 2a8:	00000010 	andeq	r0, r0, r0, lsl r0
 2ac:	0000000c 	andeq	r0, r0, ip
 2b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2b4:	7c020001 	stcvc	0, cr0, [r2], {1}
 2b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2bc:	0000002c 	andeq	r0, r0, ip, lsr #32
 2c0:	000002ac 	andeq	r0, r0, ip, lsr #5
 2c4:	00008b0c 	andeq	r8, r0, ip, lsl #22
 2c8:	00000044 	andeq	r0, r0, r4, asr #32
 2cc:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 2d0:	86078508 	strhi	r8, [r7], -r8, lsl #10
 2d4:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 2d8:	8a038904 	bhi	e26f0 <__bss_end+0xd66f0>
 2dc:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 2e0:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 2e4:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 2e8:	0000000e 	andeq	r0, r0, lr
 2ec:	00000024 	andeq	r0, r0, r4, lsr #32
 2f0:	000002ac 	andeq	r0, r0, ip, lsr #5
 2f4:	00008b50 	andeq	r8, r0, r0, asr fp
 2f8:	00000040 	andeq	r0, r0, r0, asr #32
 2fc:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 300:	86058506 	strhi	r8, [r5], -r6, lsl #10
 304:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 308:	5c018e02 	stcpl	14, cr8, [r1], {2}
 30c:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 310:	000ec4c5 	andeq	ip, lr, r5, asr #9
 314:	0000000c 	andeq	r0, r0, ip
 318:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 31c:	7c020001 	stcvc	0, cr0, [r2], {1}
 320:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 324:	00000034 	andeq	r0, r0, r4, lsr r0
 328:	00000314 	andeq	r0, r0, r4, lsl r3
 32c:	00008b94 	muleq	r0, r4, fp
 330:	00000178 	andeq	r0, r0, r8, ror r1
 334:	83280e44 	teqhi	r8, #68, 28	; 0x440
 338:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 33c:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 340:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 344:	8b038a04 	blhi	e2b5c <__bss_end+0xd6b5c>
 348:	02018e02 	andeq	r8, r1, #2, 28
 34c:	cbce0aa6 	blgt	ff382dec <__user_program+0xff082dec>
 350:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 354:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 358:	0b42000e 	bleq	1080398 <__user_program+0xd80398>
 35c:	0000000c 	andeq	r0, r0, ip
 360:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 364:	7c020001 	stcvc	0, cr0, [r2], {1}
 368:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 36c:	0000002c 	andeq	r0, r0, ip, lsr #32
 370:	0000035c 	andeq	r0, r0, ip, asr r3
 374:	00008d0c 	andeq	r8, r0, ip, lsl #26
 378:	00000120 	andeq	r0, r0, r0, lsr #2
 37c:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 380:	86078508 	strhi	r8, [r7], -r8, lsl #10
 384:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 388:	8a038904 	bhi	e27a0 <__bss_end+0xd67a0>
 38c:	02018e02 	andeq	r8, r1, #2, 28
 390:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 394:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 398:	00000ec4 	andeq	r0, r0, r4, asr #29
