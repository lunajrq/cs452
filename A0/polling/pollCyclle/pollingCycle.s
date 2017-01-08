	.file	"pollingCycle.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 2496
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #2496
	ldr	sl, .L10
.L9:
	add	sl, pc, sl
	str	r0, [fp, #-2508]
	str	r1, [fp, #-2512]
	sub	r2, fp, #1072
	sub	r2, r2, #4
	sub	r3, fp, #2128
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	bl	baseIOBootstrap(PLT)
	bl	timerBootstrap(PLT)
	sub	r3, fp, #2128
	sub	r3, r3, #8
	mov	r0, r3
	ldr	r3, .L10+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	baseIOprintf(PLT)
	sub	r2, fp, #2496
	sub	r2, r2, #8
	sub	r3, fp, #2128
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	bl	initUI(PLT)
	b	.L8
.L2:
.L8:
	bl	getTimerTick(PLT)
	mov	r3, r0
	cmp	r3, #1
	beq	.L2
	sub	r3, fp, #2128
	sub	r3, r3, #8
	mov	r0, r3
	bl	buffer2port(PLT)
	mov	r3, r0
	cmp	r3, #1
	beq	.L2
	sub	r3, fp, #2128
	sub	r3, r3, #8
	mov	r0, r3
	bl	port2buffer(PLT)
	mov	r3, r0
	cmp	r3, #1
	beq	.L2
	sub	r3, fp, #2496
	sub	r3, r3, #8
	mov	r0, r3
	bl	UIHeartBeat(PLT)
	b	.L2
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.L9+8)
	.word	.LC0(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
