	.file	"clock.c"
	.text
	.align	2
	.global	initClock
	.type	initClock, %function
initClock:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initClock, .-initClock
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC1:
	.ascii	"%dh %dmin %ds elapsed\000"
	.text
	.align	2
	.global	clockHeartBeat
	.type	clockHeartBeat, %function
clockHeartBeat:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L9+4
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #6
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L4
	mov	r2, #0
	str	r2, [fp, #-48]
	b	.L6
.L4:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r2, [fp, #-32]
	ldr	r3, .L9+12
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #11
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-32]
	ldr	r3, .L9+12
	umull	r2, r3, r1, r3
	mov	r3, r3, lsr #11
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-44]
	mov	r2, r2, asl #4
	ldr	r3, [fp, #-44]
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	rsb	r1, r3, r1
	str	r1, [fp, #-44]
	ldr	r3, .L9+16
	ldr	r1, [fp, #-44]
	umull	r2, r3, r1, r3
	mov	r3, r3, lsr #5
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r3, .L9+16
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #5
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mov	r3, r3, asl #4
	ldr	r1, [fp, #-40]
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	rsb	r2, r3, r2
	str	r2, [fp, #-40]
	ldr	r2, [fp, #-40]
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L9+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #12]
	mov	r3, #1
	str	r3, [fp, #-48]
.L6:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	274877907
	.word	.LC0(GOTOFF)
	.word	-1851608123
	.word	-2004318071
	.word	.LC1(GOTOFF)
	.size	clockHeartBeat, .-clockHeartBeat
	.ident	"GCC: (GNU) 4.0.2"
