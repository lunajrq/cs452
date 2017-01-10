	.file	"pollingCycle.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"1\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 3168
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #3168
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	str	r0, [fp, #-3180]
	str	r1, [fp, #-3184]
	sub	r3, fp, #1072
	sub	r3, r3, #12
	sub	r2, fp, #2144
	mov	r0, r3
	mov	r1, r2
	bl	baseIOBootstrap(PLT)
	bl	timerBootstrap(PLT)
	sub	r3, fp, #2144
	mov	r0, r3
	ldr	r3, .L11+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	baseIOprintf(PLT)
	sub	r3, fp, #2368
	sub	r2, fp, #2144
	mov	r0, r3
	mov	r1, r2
	bl	initUI(PLT)
	sub	r2, fp, #2768
	sub	r2, r2, #8
	sub	r3, fp, #1072
	sub	r3, r3, #12
	mov	r0, r2
	mov	r1, r3
	bl	trainIOBootstrap(PLT)
	sub	r3, fp, #2800
	sub	r3, r3, #12
	mov	r0, r3
	bl	commandHandlerBootstrap(PLT)
	sub	r3, fp, #3136
	mov	r0, r3
	bl	trainSpeedBootstrap(PLT)
	sub	r3, fp, #3152
	sub	r3, r3, #12
	mov	r0, r3
	bl	TrainSwitchStatusBootstrap(PLT)
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L2
.L3:
	mov	r3, #3
	str	r3, [fp, #-3176]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-3172]
	mov	r3, #1
	str	r3, [fp, #-3168]
	sub	r2, fp, #2768
	sub	r2, r2, #8
	sub	r3, fp, #3168
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	bl	pushTrainCmd(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #18
	ble	.L3
.L4:
	bl	getTimerTick(PLT)
	sub	r3, fp, #2144
	mov	r0, r3
	bl	buffer2port(PLT)
	sub	r3, fp, #2144
	mov	r0, r3
	bl	port2buffer(PLT)
	sub	r3, fp, #1072
	sub	r3, r3, #12
	mov	r0, r3
	bl	buffer2port(PLT)
	mov	r3, r0
	cmn	r3, #3
	bne	.L5
	sub	r3, fp, #2144
	mov	r0, r3
	ldr	r3, .L11+8
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
.L5:
	sub	r3, fp, #1072
	sub	r3, r3, #12
	mov	r0, r3
	bl	port2buffer(PLT)
	sub	r3, fp, #2368
	mov	r0, r3
	bl	UIHeartBeat(PLT)
	sub	r3, fp, #2768
	sub	r3, r3, #8
	mov	r0, r3
	bl	trainIOHeartBeat(PLT)
	sub	r3, fp, #2800
	sub	r3, r3, #12
	mov	r0, r3
	bl	commandHandlerHeartBeat(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #2
	beq	.L7
	b	.L4
.L7:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
