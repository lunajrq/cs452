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
	.ascii	"%ds elapsed\000"
	.text
	.align	2
	.global	clockHeartBeat
	.type	clockHeartBeat, %function
clockHeartBeat:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	bl	getTime(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L4
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L6
.L4:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L9+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	mov	r0, r3
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	baseIOprintf(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #12]
	mov	r3, #1
	str	r3, [fp, #-28]
.L6:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	clockHeartBeat, .-clockHeartBeat
	.ident	"GCC: (GNU) 4.0.2"
