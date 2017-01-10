	.file	"sensorHistory.c"
	.global	tmpTime
	.bss
	.align	2
	.type	tmpTime, %object
	.size	tmpTime, 4
tmpTime:
	.space	4
	.global	result
	.align	2
	.type	result, %object
	.size	result, 4
result:
	.space	4
	.text
	.align	2
	.global	initSensorHistory
	.type	initSensorHistory, %function
initSensorHistory:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #60]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #64]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #148]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #152]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #156]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #60]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r2, #12
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #5
	ble	.L3
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L5
.L6:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #64]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r2, #12
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L5:
	ldr	r3, [fp, #-16]
	cmp	r3, #5
	ble	.L6
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #160]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initSensorHistory, .-initSensorHistory
	.align	2
	.global	sensorHistoryPushHistory
	.type	sensorHistoryPushHistory, %function
sensorHistoryPushHistory:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	mov	r3, r1
	str	r2, [fp, #-24]
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #152]
	ldr	r2, [fp, #-16]
	mov	r1, #68
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r2, r3, r1
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #152]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-16]
	mov	r1, #72
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #152]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #152]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #152]
	cmp	r3, #9
	ble	.L10
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #152]
.L10:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #152]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #148]
	cmp	r2, r3
	bne	.L12
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #148]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #148]
.L12:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #148]
	cmp	r3, #9
	ble	.L14
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #148]
.L14:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	sensorHistoryPushHistory, .-sensorHistoryPushHistory
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC1:
	.ascii	"%c%d \000"
	.text
	.align	2
	.global	sensorHistoryPrint
	.type	sensorHistoryPrint, %function
sensorHistoryPrint:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L25+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #148]
	str	r3, [fp, #-20]
	b	.L18
.L19:
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r1, #68
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	lr, r3
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r1, #72
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	ip, [r3, #0]
	ldr	r3, .L25+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, lr
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	ble	.L20
	mvn	r3, #0
	str	r3, [fp, #-20]
.L20:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L18:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #152]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L19
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	sensorHistoryPrint, .-sensorHistoryPrint
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\012\015sensor: %d  \000"
	.text
	.align	2
	.global	sensorHistoryHeartBeat
	.type	sensorHistoryHeartBeat, %function
sensorHistoryHeartBeat:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	ldr	sl, .L49
.L48:
	add	sl, pc, sl
	str	r0, [fp, #-60]
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #160]
	cmp	r3, #0
	beq	.L28
	bl	getTime(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-60]
	ldr	r2, [r2, #156]
	cmp	r3, r2
	bls	.L30
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L49+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-60]
	mov	r3, #0
	str	r3, [r2, #160]
	mov	r3, #4
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-60]
	add	r1, r3, #12
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r1, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-60]
	add	r1, r3, #12
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r1, r3
	add	r2, r3, #20
	mov	r3, #0
	str	r3, [r2, #0]
	bl	getTrainIO(PLT)
	mov	r3, r0
	sub	r2, fp, #56
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	mov	r3, #2
	str	r3, [fp, #-64]
	b	.L32
.L30:
	mov	r3, #0
	str	r3, [fp, #-64]
	b	.L32
.L28:
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #64]
	ldr	r1, [fp, #-60]
	mov	r0, #32
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L33
	ldr	r3, [fp, #-60]
	ldr	r4, [r3, #0]
	bl	getTime(PLT)
	mov	r2, r0
	ldr	r3, .L49+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	rsb	r2, r3, r2
	mov	r0, r4
	ldr	r3, .L49+8
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L35
.L36:
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #60]
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-60]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r2, #12
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	ip, [r3, #0]
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #64]
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-60]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r2, #12
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	eor	r3, ip, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L37
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #32768
	str	r3, [fp, #-24]
	b	.L39
.L40:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-24]
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L41
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #64]
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-60]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r2, #12
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-28]
	mov	r3, #32768
	mov	r3, r3, asr r2
	and	r3, r1, r3
	cmp	r3, #0
	beq	.L41
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	add	r3, r3, #65
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldr	r0, [fp, #-60]
	mov	r1, r2
	mov	r2, r3
	bl	sensorHistoryPushHistory(PLT)
	mov	r3, #1
	str	r3, [fp, #-44]
.L41:
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L39:
	ldr	r3, [fp, #-28]
	cmp	r3, #15
	bls	.L40
.L37:
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L35:
	ldr	r3, [fp, #-40]
	cmp	r3, #4
	ble	.L36
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L45
	ldr	r0, [fp, #-60]
	bl	sensorHistoryPrint(PLT)
.L45:
	bl	getTime(PLT)
	mov	r3, r0
	add	r2, r3, #200
	ldr	r3, [fp, #-60]
	str	r2, [r3, #156]
	ldr	r2, [fp, #-60]
	mov	r3, #1
	str	r3, [r2, #160]
	ldr	r3, [fp, #-60]
	add	r1, r3, #12
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r1, r3
	add	r2, r3, #20
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #64]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-60]
	ldr	r2, [r3, #60]
	ldr	r3, [fp, #-60]
	str	r2, [r3, #64]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #60]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-64]
	b	.L32
.L33:
	mov	r3, #0
	str	r3, [fp, #-64]
.L32:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L50:
	.align	2
.L49:
	.word	_GLOBAL_OFFSET_TABLE_-(.L48+8)
	.word	tmpTime(GOT)
	.word	.LC2(GOTOFF)
	.size	sensorHistoryHeartBeat, .-sensorHistoryHeartBeat
	.ident	"GCC: (GNU) 4.0.2"
