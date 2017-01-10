	.file	"trainStatus.c"
	.global	_trainSpeed
	.bss
	.align	2
	.type	_trainSpeed, %object
	.size	_trainSpeed, 4
_trainSpeed:
	.space	4
	.global	_trainSwitchStatus
	.align	2
	.type	_trainSwitchStatus, %object
	.size	_trainSwitchStatus, 4
_trainSwitchStatus:
	.space	4
	.text
	.align	2
	.global	trainSpeedBootstrap
	.type	trainSpeedBootstrap, %function
trainSpeedBootstrap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L7
.L6:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, r1, asl #2]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #80
	ble	.L3
	ldr	r3, .L7+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	_trainSpeed(GOT)
	.size	trainSpeedBootstrap, .-trainSpeedBootstrap
	.align	2
	.global	TrainSwitchStatusBootstrap
	.type	TrainSwitchStatusBootstrap, %function
TrainSwitchStatusBootstrap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L15
.L14:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L10
.L11:
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L10:
	ldr	r3, [fp, #-20]
	cmp	r3, #18
	ble	.L11
	ldr	r2, [fp, #-24]
	mov	r3, #1
	strb	r3, [r2, #20]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	strb	r3, [r2, #21]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	strb	r3, [r2, #22]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	strb	r3, [r2, #23]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #24]
	ldr	r3, .L15+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.L14+8)
	.word	_trainSwitchStatus(GOT)
	.size	TrainSwitchStatusBootstrap, .-TrainSwitchStatusBootstrap
	.align	2
	.global	setTrainSpeed
	.type	setTrainSpeed, %function
setTrainSpeed:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, r1, asl #2]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	setTrainSpeed, .-setTrainSpeed
	.align	2
	.global	readTrainSpeed
	.type	readTrainSpeed, %function
readTrainSpeed:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	readTrainSpeed, .-readTrainSpeed
	.align	2
	.global	setSwitchStatus
	.type	setSwitchStatus, %function
setSwitchStatus:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	str	r2, [r3, #24]
	ldr	r3, [fp, #-20]
	cmp	r3, #99
	ble	.L22
	ldr	r3, [fp, #-20]
	sub	r1, r3, #152
	ldr	r3, [fp, #-24]
	and	r0, r3, #255
	ldr	r3, [fp, #-16]
	mov	r2, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #3]
	b	.L25
.L22:
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	ldr	r2, [fp, #-16]
	strb	r3, [r2, r1]
.L25:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	setSwitchStatus, .-setSwitchStatus
	.align	2
	.global	readSwitchStatus
	.type	readSwitchStatus, %function
readSwitchStatus:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #99
	ble	.L27
	ldr	r3, [fp, #-20]
	sub	r1, r3, #152
	ldr	r3, [fp, #-16]
	mov	r2, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	b	.L29
.L27:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
.L29:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	readSwitchStatus, .-readSwitchStatus
	.align	2
	.global	getTrainSpeed
	.type	getTrainSpeed, %function
getTrainSpeed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	ldr	r3, .L34+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	_trainSpeed(GOT)
	.size	getTrainSpeed, .-getTrainSpeed
	.align	2
	.global	getTrainSwitchStatus
	.type	getTrainSwitchStatus, %function
getTrainSwitchStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L39
.L38:
	add	sl, pc, sl
	ldr	r3, .L39+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
	.word	_trainSwitchStatus(GOT)
	.size	getTrainSwitchStatus, .-getTrainSwitchStatus
	.ident	"GCC: (GNU) 4.0.2"
