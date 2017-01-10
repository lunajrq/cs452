	.file	"trainIO.c"
	.global	_trainIO
	.bss
	.align	2
	.type	_trainIO, %object
	.size	_trainIO, 4
_trainIO:
	.space	4
	.text
	.align	2
	.global	trainIOBootstrap
	.type	trainIOBootstrap, %function
trainIOBootstrap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #364]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #368]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #372]
	ldr	r3, .L4+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #392]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #396]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	_trainIO(GOT)
	.size	trainIOBootstrap, .-trainIOBootstrap
	.align	2
	.global	pushTrainCmd
	.type	pushTrainCmd, %function
pushTrainCmd:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #372]
	cmp	r3, #30
	bne	.L7
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L9
.L7:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #368]
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #0]
	ldr	r0, [fp, #-16]
	mov	ip, #4
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #368]
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #4]
	ldr	r0, [fp, #-16]
	mov	ip, #8
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #368]
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #8]
	ldr	r0, [fp, #-16]
	mov	ip, #12
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #372]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #372]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #368]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #368]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #368]
	cmp	r3, #29
	ble	.L10
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #368]
.L10:
	mov	r3, #1
	str	r3, [fp, #-24]
.L9:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pushTrainCmd, .-pushTrainCmd
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c%c\000"
	.text
	.align	2
	.global	sendSetTrainSpeed
	.type	sendSetTrainSpeed, %function
sendSetTrainSpeed:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L16+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	.LC0(GOTOFF)
	.size	sendSetTrainSpeed, .-sendSetTrainSpeed
	.align	2
	.global	sendSetTrainReverse
	.type	sendSetTrainReverse, %function
sendSetTrainReverse:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #0
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #392]
	ldr	r2, [fp, #-20]
	mov	r3, #2
	str	r3, [r2, #376]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #380]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #384]
	bl	getTime(PLT)
	mov	r3, r0
	add	r3, r3, #2992
	add	r3, r3, #8
	ldr	r2, [fp, #-20]
	str	r3, [r2, #388]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	.LC0(GOTOFF)
	.size	sendSetTrainReverse, .-sendSetTrainReverse
	.align	2
	.global	sendSetTrainReverseDirection
	.type	sendSetTrainReverseDirection, %function
sendSetTrainReverseDirection:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L26
.L25:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L26+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #15
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #376]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #380]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #384]
	ldr	r3, [fp, #-20]
	add	r3, r3, #376
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	pushTrainCmd(PLT)
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	.LC0(GOTOFF)
	.size	sendSetTrainReverseDirection, .-sendSetTrainReverseDirection
	.align	2
	.global	sendSetSwitch
	.type	sendSetSwitch, %function
sendSetSwitch:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L29
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L34+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #33
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	b	.L31
.L29:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L34+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #34
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
.L31:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	.LC0(GOTOFF)
	.size	sendSetSwitch, .-sendSetSwitch
	.align	2
	.global	sendReadSensor
	.type	sendReadSensor, %function
sendReadSensor:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L42
.L41:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L37
.L38:
	ldr	r3, [fp, #-28]
	add	r2, r3, #20
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L37:
	ldr	r3, [fp, #-20]
	cmp	r3, #5
	ble	.L38
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #404]
	ldr	r2, [fp, #-24]
	mov	r3, #10
	str	r3, [r2, #400]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L42+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #12
	mov	r3, #133
	bl	baseIOprintf(PLT)
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	_GLOBAL_OFFSET_TABLE_-(.L41+8)
	.word	.LC0(GOTOFF)
	.size	sendReadSensor, .-sendReadSensor
	.align	2
	.global	sendTrainCmd
	.type	sendTrainCmd, %function
sendTrainCmd:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L45
	.p2align 2
.L51:
	b	.L46
	b	.L47
	b	.L48
	b	.L49
	b	.L50
.L46:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	sendSetTrainSpeed(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L52
.L47:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	sendSetTrainReverse(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L52
.L48:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	sendSetTrainReverseDirection(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L52
.L49:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	sendSetSwitch(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L52
.L50:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	sendReadSensor(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L52
.L45:
	mvn	r3, #0
	str	r3, [fp, #-24]
.L52:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	sendTrainCmd, .-sendTrainCmd
	.align	2
	.global	trainIOHeartBeat
	.type	trainIOHeartBeat, %function
trainIOHeartBeat:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #400]
	cmp	r3, #0
	ble	.L55
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	sub	r2, fp, #17
	mov	r0, r3
	mov	r1, r2
	bl	readChar(PLT)
	mov	r3, r0
	cmn	r3, #1
	beq	.L55
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #400]
	sub	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #400]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #404]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #400]
	rsb	r2, r3, #10
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #404]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #8
	str	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #404]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #400]
	rsb	r2, r3, #10
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r0, r1, r3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #404]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	orr	r3, r2, r3
	str	r3, [r0, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #400]
	cmp	r3, #0
	bne	.L55
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #404]
	add	r2, r3, #20
	mov	r3, #1
	str	r3, [r2, #0]
.L55:
	bl	getTime(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #396]
	add	r2, r3, #150
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bls	.L59
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L61
.L59:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #392]
	cmp	r3, #0
	bne	.L62
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #388]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcs	.L62
	ldr	r3, [fp, #-24]
	add	r3, r3, #376
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	sendTrainCmd(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #392]
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #396]
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L61
.L62:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #372]
	cmp	r3, #0
	bne	.L65
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L61
.L65:
	ldr	r3, [fp, #-24]
	add	r1, r3, #4
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #364]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	sendTrainCmd(PLT)
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #396]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #372]
	sub	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #372]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #364]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #364]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #364]
	cmp	r3, #29
	ble	.L67
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #364]
.L67:
	mov	r3, #1
	str	r3, [fp, #-28]
.L61:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	trainIOHeartBeat, .-trainIOHeartBeat
	.align	2
	.global	getTrainIO
	.type	getTrainIO, %function
getTrainIO:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L73
.L72:
	add	sl, pc, sl
	ldr	r3, .L73+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	_trainIO(GOT)
	.size	getTrainIO, .-getTrainIO
	.ident	"GCC: (GNU) 4.0.2"
