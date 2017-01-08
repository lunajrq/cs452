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
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	str	r3, [r2, #0]
	ldr	r2, .L4+12
	ldr	r3, .L4+12
	ldr	r3, [r3, #0]
	orr	r3, r3, #64
	str	r3, [r2, #0]
	ldr	r2, .L4+12
	ldr	r3, .L4+12
	ldr	r3, [r3, #0]
	orr	r3, r3, #8
	str	r3, [r2, #0]
	ldr	r2, .L4+12
	ldr	r3, .L4+12
	ldr	r3, [r3, #0]
	orr	r3, r3, #128
	str	r3, [r2, #0]
	ldr	r3, .L4+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	-2139029376
	.word	508000
	.word	-2139029368
	.word	_timerTick(GOT)
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
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	ldr	r3, .L12+4
	ldr	r2, [r3, #0]
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L12+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bls	.L7
	ldr	r3, .L12+16
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L12+16
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L12+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L9
.L7:
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L12+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
.L9:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
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
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	ldr	r3, .L17+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	_timerTick(GOT)
	.size	getTime, .-getTime
	.ident	"GCC: (GNU) 4.0.2"
