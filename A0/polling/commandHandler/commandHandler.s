	.file	"commandHandler.c"
	.global	commandHandler
	.bss
	.align	2
	.type	commandHandler, %object
	.size	commandHandler, 4
commandHandler:
	.space	4
	.text
	.align	2
	.global	strCpy
	.type	strCpy, %function
strCpy:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	strCpy, .-strCpy
	.align	2
	.global	commandHandlerBootstrap
	.type	commandHandlerBootstrap, %function
commandHandlerBootstrap:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L9+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	commandHandler(GOT)
	.size	commandHandlerBootstrap, .-commandHandlerBootstrap
	.align	2
	.global	parseInt
	.type	parseInt, %function
parseInt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L12
.L13:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L12:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L13
	b	.L15
.L16:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	add	r3, r1, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L15:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L17
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L16
.L17:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parseInt, .-parseInt
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d---PPP\000"
	.text
	.align	2
	.global	commandHandlerHeartBeat
	.type	commandHandlerHeartBeat, %function
commandHandlerHeartBeat:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #104
	ldr	sl, .L49
.L48:
	add	sl, pc, sl
	str	r0, [fp, #-116]
	ldr	r3, [fp, #-116]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L21
	mov	r3, #0
	str	r3, [fp, #-120]
	b	.L23
.L21:
	ldr	r2, [fp, #-116]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #97
	cmp	r3, #19
	addls	pc, pc, r3, asl #2
	b	.L24
	.p2align 2
.L30:
	b	.L25
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L26
	b	.L27
	b	.L28
	b	.L29
.L26:
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L31
	mvn	r3, #1
	str	r3, [fp, #-120]
	b	.L23
.L31:
	mvn	r3, #0
	str	r3, [fp, #-120]
	b	.L23
.L29:
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #114
	bne	.L33
	ldr	r3, [fp, #-116]
	add	r3, r3, #4
	add	r3, r3, #2
	sub	r2, fp, #40
	mov	r0, r3
	mov	r1, r2
	bl	parseInt(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	sub	r3, fp, #44
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	parseInt(PLT)
	mov	r3, #0
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-48]
	bl	getTrainIO(PLT)
	mov	r3, r0
	sub	r2, fp, #56
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	bl	getTrainSpeed(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-40]
	ldr	ip, [fp, #-44]
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	setTrainSpeed(PLT)
	mov	r3, #1
	str	r3, [fp, #-120]
	b	.L23
.L33:
	mvn	r3, #0
	str	r3, [fp, #-120]
	b	.L23
.L27:
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #118
	bne	.L35
	ldr	r3, [fp, #-116]
	add	r3, r3, #4
	add	r3, r3, #2
	sub	r2, fp, #60
	mov	r0, r3
	mov	r1, r2
	bl	parseInt(PLT)
	bl	getTrainSpeed(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-60]
	mov	r0, r3
	mov	r1, r2
	bl	readTrainSpeed(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	bl	getBaseIO(PLT)
	mov	r3, r0
	mov	r0, r3
	ldr	r3, .L49+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	baseIOprintf(PLT)
	mov	r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-64]
	bl	getTrainIO(PLT)
	mov	r3, r0
	sub	r2, fp, #72
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	mov	r3, #1
	str	r3, [fp, #-120]
	b	.L23
.L35:
	mvn	r3, #0
	str	r3, [fp, #-120]
	b	.L23
.L28:
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #119
	bne	.L37
	ldr	r3, [fp, #-116]
	add	r3, r3, #4
	add	r3, r3, #2
	sub	r2, fp, #76
	mov	r0, r3
	mov	r1, r2
	bl	parseInt(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #3
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #83
	moveq	r3, #0
	movne	r3, #1
	str	r3, [fp, #-80]
	bl	getTrainIO(PLT)
	mov	r3, r0
	sub	r2, fp, #88
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	bl	getTrainSwitchStatus(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-76]
	ldr	ip, [fp, #-80]
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	setSwitchStatus(PLT)
	mov	r3, #1
	str	r3, [fp, #-120]
	b	.L23
.L37:
	mvn	r3, #0
	str	r3, [fp, #-120]
	b	.L23
.L25:
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L39
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L41
.L42:
	mov	r3, #3
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-92]
	bl	getTrainIO(PLT)
	mov	r3, r0
	sub	r2, fp, #100
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L41:
	ldr	r3, [fp, #-24]
	cmp	r3, #18
	ble	.L42
	b	.L44
.L39:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L45
.L46:
	mov	r3, #3
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-108]
	mov	r3, #1
	str	r3, [fp, #-104]
	bl	getTrainIO(PLT)
	mov	r3, r0
	sub	r2, fp, #112
	mov	r0, r3
	mov	r1, r2
	bl	pushTrainCmd(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L45:
	ldr	r3, [fp, #-20]
	cmp	r3, #18
	ble	.L46
.L44:
	mov	r3, #1
	str	r3, [fp, #-120]
	b	.L23
.L24:
	mvn	r3, #0
	str	r3, [fp, #-120]
.L23:
	ldr	r3, [fp, #-120]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L50:
	.align	2
.L49:
	.word	_GLOBAL_OFFSET_TABLE_-(.L48+8)
	.word	.LC0(GOTOFF)
	.size	commandHandlerHeartBeat, .-commandHandlerHeartBeat
	.align	2
	.global	commandHandlerSetCommand
	.type	commandHandlerSetCommand, %function
commandHandlerSetCommand:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	strCpy(PLT)
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	commandHandlerSetCommand, .-commandHandlerSetCommand
	.align	2
	.global	getCommandHandler
	.type	getCommandHandler, %function
getCommandHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L56
.L55:
	add	sl, pc, sl
	ldr	r3, .L56+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
	.word	commandHandler(GOT)
	.size	getCommandHandler, .-getCommandHandler
	.ident	"GCC: (GNU) 4.0.2"
