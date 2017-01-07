	.file	"timer.c"
	.global	_timerTick
	.bss
	.align	2
	.type	_timerTick, %object
	.size	_timerTick, 4
_timerTick:
	.space	4
	.global	_then
	.align	2
	.type	_then, %object
	.size	_then, 4
_then:
	.space	4
	.global	_now
	.align	2
	.type	_now, %object
	.size	_now, 4
_now:
	.space	4
	.text
	.align	2
	.global	timerBootstrap
	.type	timerBootstrap, %function
timerBootstrap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	r2, .L3
	mov	r3, #2000
	str	r3, [r2, #0]
	ldr	r2, .L3+4
	ldr	r3, .L3+4
	ldr	r3, [r3, #0]
	orr	r3, r3, #64
	str	r3, [r2, #0]
	ldr	r2, .L3+4
	ldr	r3, .L3+4
	ldr	r3, [r3, #0]
	bic	r3, r3, #8
	str	r3, [r2, #0]
	ldr	r2, .L3+4
	ldr	r3, .L3+4
	ldr	r3, [r3, #0]
	orr	r3, r3, #128
	str	r3, [r2, #0]
	ldmfd	sp, {fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	-2139029376
	.word	-2139029368
	.size	timerBootstrap, .-timerBootstrap
	.align	2
	.global	getTimerTick
	.type	getTimerTick, %function
getTimerTick:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	ldr	r3, .L11+4
	ldr	r2, [r3, #0]
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L11+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bls	.L6
	ldr	r3, .L11+16
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L11+16
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L11+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L8
.L6:
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L11+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
.L8:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	-2139029372
	.word	_now(GOT)
	.word	_then(GOT)
	.word	_timerTick(GOT)
	.size	getTimerTick, .-getTimerTick
	.align	2
	.global	getTime
	.type	getTime, %function
getTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	_timerTick(GOT)
	.size	getTime, .-getTime
	.ident	"GCC: (GNU) 4.0.2"
