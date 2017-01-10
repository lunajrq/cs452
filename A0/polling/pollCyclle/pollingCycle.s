	.file	"pollingCycle.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"1\000"
	.align	2
.LC2:
	.ascii	"\012\015%d\012\015%d \012\015%d\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 3256
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #3248
	sub	sp, sp, #12
	ldr	sl, .L29
.L28:
	add	sl, pc, sl
	str	r0, [fp, #-3268]
	str	r1, [fp, #-3272]
	sub	r2, fp, #1104
	sub	r3, fp, #2160
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	baseIOBootstrap(PLT)
	bl	timerBootstrap(PLT)
	sub	r3, fp, #2160
	sub	r3, r3, #4
	mov	r0, r3
	ldr	r3, .L29+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	baseIOprintf(PLT)
	sub	r2, fp, #2432
	sub	r2, r2, #8
	sub	r3, fp, #2160
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	initUI(PLT)
	sub	r3, fp, #2848
	sub	r3, r3, #4
	sub	r2, fp, #1104
	mov	r0, r3
	mov	r1, r2
	bl	trainIOBootstrap(PLT)
	sub	r3, fp, #2880
	sub	r3, r3, #8
	mov	r0, r3
	bl	commandHandlerBootstrap(PLT)
	sub	r3, fp, #3200
	sub	r3, r3, #12
	mov	r0, r3
	bl	trainSpeedBootstrap(PLT)
	sub	r3, fp, #3232
	sub	r3, r3, #8
	mov	r0, r3
	bl	TrainSwitchStatusBootstrap(PLT)
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L2
.L3:
	mov	r3, #3
	str	r3, [fp, #-3264]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-3260]
	mov	r3, #1
	str	r3, [fp, #-3256]
	sub	r3, fp, #2848
	sub	r3, r3, #4
	sub	r2, fp, #3264
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L2:
	ldr	r3, [fp, #-44]
	cmp	r3, #18
	ble	.L3
	mov	r3, #3
	str	r3, [fp, #-3252]
	mov	r3, #153
	str	r3, [fp, #-3248]
	mov	r3, #1
	str	r3, [fp, #-3244]
	sub	r2, fp, #2848
	sub	r2, r2, #4
	sub	r3, fp, #3248
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	pushTrainCmd(PLT)
	mov	r3, #3
	str	r3, [fp, #-3252]
	mov	r3, #154
	str	r3, [fp, #-3248]
	mov	r3, #0
	str	r3, [fp, #-3244]
	sub	r2, fp, #2848
	sub	r2, r2, #4
	sub	r3, fp, #3248
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	pushTrainCmd(PLT)
	mov	r3, #3
	str	r3, [fp, #-3252]
	mov	r3, #155
	str	r3, [fp, #-3248]
	mov	r3, #1
	str	r3, [fp, #-3244]
	sub	r2, fp, #2848
	sub	r2, r2, #4
	sub	r3, fp, #3248
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	pushTrainCmd(PLT)
	mov	r3, #3
	str	r3, [fp, #-3252]
	mov	r3, #156
	str	r3, [fp, #-3248]
	mov	r3, #0
	str	r3, [fp, #-3244]
	sub	r2, fp, #2848
	sub	r2, r2, #4
	sub	r3, fp, #3248
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	bl	pushTrainCmd(PLT)
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, .L29+8
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
.L5:
	bl	getTimerTick(PLT)
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L6
	ldr	r3, .L29+16
	ldr	r3, [r3, #0]
	str	r3, [fp, #-40]
.L6:
	sub	r3, fp, #2160
	sub	r3, r3, #4
	mov	r0, r3
	bl	buffer2port(PLT)
	sub	r3, fp, #2160
	sub	r3, r3, #4
	mov	r0, r3
	bl	port2buffer(PLT)
	sub	r3, fp, #1104
	mov	r0, r3
	bl	buffer2port(PLT)
	mov	r3, r0
	cmn	r3, #3
	bne	.L8
	sub	r3, fp, #2160
	sub	r3, r3, #4
	mov	r0, r3
	ldr	r3, .L29+20
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
.L8:
	sub	r3, fp, #1104
	mov	r0, r3
	bl	port2buffer(PLT)
	sub	r3, fp, #2432
	sub	r3, r3, #8
	mov	r0, r3
	bl	UIHeartBeat(PLT)
	sub	r3, fp, #2848
	sub	r3, r3, #4
	mov	r0, r3
	bl	trainIOHeartBeat(PLT)
	sub	r3, fp, #2880
	sub	r3, r3, #8
	mov	r0, r3
	bl	commandHandlerHeartBeat(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L10
	ldr	r3, .L29+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	rsb	r3, r2, r3
	str	r3, [fp, #-36]
.L10:
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L12
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bge	.L12
	ldr	r3, [fp, #-36]
	add	r3, r3, #508
	str	r3, [fp, #-36]
.L12:
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L15
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bls	.L15
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-32]
.L15:
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L18
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bcs	.L18
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-28]
.L18:
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L21
	sub	r3, fp, #2160
	sub	r3, r3, #4
	ldr	r2, [fp, #-28]
	str	r2, [sp, #0]
	mov	r0, r3
	ldr	r3, .L29+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	bl	baseIOprintf(PLT)
.L21:
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r2, r3, lsr #6
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L23
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L29+12
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #6
	str	r3, [fp, #-24]
.L23:
	ldr	r3, [fp, #-20]
	cmn	r3, #2
	beq	.L25
	b	.L5
.L25:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.L28+8)
	.word	.LC0(GOTOFF)
	.word	65535
	.word	274877907
	.word	-2139029372
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
