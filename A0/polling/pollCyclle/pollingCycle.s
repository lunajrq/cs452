	.file	"pollingCycle.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Hello, world!\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 2136
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #2128
	sub	sp, sp, #8
	ldr	sl, .L10
.L9:
	add	sl, pc, sl
	str	r0, [fp, #-2148]
	str	r1, [fp, #-2152]
	sub	r2, fp, #1072
	sub	r2, r2, #8
	sub	r3, fp, #2128
	sub	r3, r3, #12
	mov	r0, r2
	mov	r1, r3
	bl	baseIOBootstrap(PLT)
	bl	timerBootstrap(PLT)
	sub	r3, fp, #2128
	sub	r3, r3, #12
	mov	r0, r3
	ldr	r3, .L10+4
	add	r3, sl, r3
	mov	r1, r3
	bl	writeStr(PLT)
	b	.L8
.L2:
.L8:
	bl	getTimerTick(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L3
	bl	getTime(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r2, r3
	sub	r3, fp, #2128
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	writeChar(PLT)
.L3:
	sub	r3, fp, #2128
	sub	r3, r3, #12
	mov	r0, r3
	bl	buffer2port(PLT)
	sub	r3, fp, #2128
	sub	r3, r3, #12
	mov	r0, r3
	bl	port2buffer(PLT)
	sub	r2, fp, #2128
	sub	r2, r2, #12
	sub	r3, fp, #2128
	sub	r3, r3, #13
	mov	r0, r2
	mov	r1, r3
	bl	readChar(PLT)
	mov	r3, r0
	cmn	r3, #1
	beq	.L2
	ldrb	r3, [fp, #-2141]	@ zero_extendqisi2
	mov	r2, r3
	sub	r3, fp, #2128
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	writeChar(PLT)
	b	.L2
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.L9+8)
	.word	.LC0(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
