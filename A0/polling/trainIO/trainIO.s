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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #364]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #368]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #372]
	ldr	r3, .L6+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #392]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #396]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #408]
.L2:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	sub	r2, fp, #17
	mov	r0, r3
	mov	r1, r2
	bl	readChar(PLT)
	mov	r3, r0
	cmn	r3, #1
	bne	.L2
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
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
	bne	.L9
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L11
.L9:
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
	ble	.L12
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #368]
.L12:
	mov	r3, #1
	str	r3, [fp, #-24]
.L11:
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
	ldr	sl, .L18
.L17:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L18+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.L17+8)
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
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L23+4
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
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
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
	ldr	sl, .L28
.L27:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L28+4
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
.L29:
	.align	2
.L28:
	.word	_GLOBAL_OFFSET_TABLE_-(.L27+8)
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
	ldr	sl, .L36
.L35:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L36+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #33
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
	b	.L33
.L31:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L36+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #34
	ldr	r3, [fp, #-24]
	bl	baseIOprintf(PLT)
.L33:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
	.word	.LC0(GOTOFF)
	.size	sendSetSwitch, .-sendSetSwitch
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%c\000"
	.text
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
	ldr	sl, .L44
.L43:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L39
.L40:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L39:
	ldr	r3, [fp, #-20]
	cmp	r3, #5
	ble	.L40
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #404]
	ldr	r2, [fp, #-24]
	mov	r3, #10
	str	r3, [r2, #400]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L44+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #133
	bl	baseIOprintf(PLT)
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L43+8)
	.word	.LC1(GOTOFF)
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
	b	.L47
	.p2align 2
.L53:
	b	.L48
	b	.L49
	b	.L50
	b	.L51
	b	.L52
.L48:
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
	b	.L54
.L49:
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
	b	.L54
.L50:
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
	b	.L54
.L51:
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
	b	.L54
.L52:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	sendReadSensor(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L54
.L47:
	mvn	r3, #0
	str	r3, [fp, #-24]
.L54:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	sendTrainCmd, .-sendTrainCmd
	.align	2
	.global	trainIOHeartBeat
	.type	trainIOHeartBeat, %function
trainIOHeartBeat:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #400]
	cmp	r3, #0
	ble	.L57
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #29
	mov	r0, r3
	mov	r1, r2
	bl	readChar(PLT)
	mov	r3, r0
	cmn	r3, #1
	beq	.L57
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #400]
	rsb	r2, r3, #10
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #400]
	rsb	r2, r3, #11
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #31
	add	r3, r2, r1
	and	r3, r3, #1
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #404]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	add	r0, r2, r3
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #404]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r2, asl r3
	add	r3, r1, r3
	str	r3, [r0, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #400]
	sub	r2, r3, #1
	ldr	r3, [fp, #-36]
	str	r2, [r3, #400]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #400]
	cmp	r3, #0
	bne	.L57
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #404]
	add	r2, r3, #20
	mov	r3, #1
	str	r3, [r2, #0]
.L57:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #524]
	cmp	r3, #0
	beq	.L61
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-36]
	str	r2, [r3, #408]
.L61:
	bl	getTime(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #408]
	add	r2, r3, #50
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bls	.L63
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L65
.L63:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #392]
	cmp	r3, #0
	bne	.L66
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #388]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bcs	.L66
	ldr	r3, [fp, #-36]
	add	r3, r3, #376
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	sendTrainCmd(PLT)
	ldr	r2, [fp, #-36]
	mov	r3, #1
	str	r3, [r2, #392]
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-36]
	str	r2, [r3, #396]
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L65
.L66:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #372]
	cmp	r3, #0
	bne	.L69
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L65
.L69:
	ldr	r3, [fp, #-36]
	add	r1, r3, #4
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #364]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	sendTrainCmd(PLT)
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-36]
	str	r2, [r3, #396]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #372]
	sub	r2, r3, #1
	ldr	r3, [fp, #-36]
	str	r2, [r3, #372]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #364]
	add	r2, r3, #1
	ldr	r3, [fp, #-36]
	str	r2, [r3, #364]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #364]
	cmp	r3, #29
	ble	.L71
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #364]
.L71:
	mov	r3, #1
	str	r3, [fp, #-40]
.L65:
	ldr	r3, [fp, #-40]
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
	ldr	sl, .L77
.L76:
	add	sl, pc, sl
	ldr	r3, .L77+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	_trainIO(GOT)
	.size	getTrainIO, .-getTrainIO
	.ident	"GCC: (GNU) 4.0.2"
