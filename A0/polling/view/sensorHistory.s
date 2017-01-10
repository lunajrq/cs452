	.file	"sensorHistory.c"
	.text
	.align	2
	.global	initSensorHistory
	.type	initSensorHistory, %function
initSensorHistory:
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
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #60]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #64]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #108]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #112]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #116]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #120]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initSensorHistory, .-initSensorHistory
	.section	.rodata
	.align	2
.LC0:
	.ascii	"12321321\000"
	.text
	.align	2
	.global	sensorHistoryBootstrap
	.type	sensorHistoryBootstrap, %function
sensorHistoryBootstrap:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L13
.L12:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #120]
	cmp	r3, #0
	beq	.L4
	bl	getTime(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-32]
	ldr	r2, [r2, #116]
	cmp	r3, r2
	bls	.L6
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #120]
	mov	r3, #4
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r1, r3, #12
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r1, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r1, r3, #12
	ldr	r3, [fp, #-32]
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
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	mov	r3, #2
	str	r3, [fp, #-36]
	b	.L8
.L6:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L8
.L4:
	ldr	r3, [fp, #-32]
	add	r1, r3, #12
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	add	r3, r1, r3
	add	r3, r3, #20
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L9
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L13+4
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L8
.L9:
	mov	r3, #0
	str	r3, [fp, #-36]
.L8:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.L12+8)
	.word	.LC0(GOTOFF)
	.size	sensorHistoryBootstrap, .-sensorHistoryBootstrap
	.ident	"GCC: (GNU) 4.0.2"
