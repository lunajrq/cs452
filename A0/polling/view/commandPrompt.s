	.file	"commandPrompt.c"
	.text
	.align	2
	.global	initCommandStr
	.type	initCommandStr, %function
initCommandStr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	strb	r3, [r2, #8]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	initCommandStr, .-initCommandStr
	.align	2
	.global	commandStrPush
	.type	commandStrPush, %function
commandStrPush:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	cmp	r3, #30
	beq	.L6
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #8
	add	r3, r1, r3
	add	r2, r3, r2
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #8
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
.L6:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	commandStrPush, .-commandStrPush
	.align	2
	.global	commandStrPop
	.type	commandStrPop, %function
commandStrPop:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #8
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
.L10:
	ldmfd	sp, {r3, fp, sp, pc}
	.size	commandStrPop, .-commandStrPop
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC1:
	.ascii	"$ \000"
	.text
	.align	2
	.global	initCommandPrompt
	.type	initCommandPrompt, %function
initCommandPrompt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L14
.L13:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-20]
	add	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #48]
	ldr	r3, [fp, #-20]
	add	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #52]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #56]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	initCommandStr(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L14+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #56]
	mov	r0, r3
	ldr	r3, .L14+8
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initCommandPrompt, .-initCommandPrompt
	.align	2
	.global	commandPromptHeartBeat
	.type	commandPromptHeartBeat, %function
commandPromptHeartBeat:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L29
.L28:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #56]
	sub	r2, fp, #21
	mov	r0, r3
	mov	r1, r2
	bl	readChar(PLT)
	mov	r3, r0
	cmn	r3, #1
	bne	.L17
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L19
.L17:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L20
	bl	getCommandHandler(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	add	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	bl	commandHandlerSetCommand(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #56]
	ldr	r3, [fp, #-28]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L29+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L22
.L23:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #56]
	mov	r0, r3
	mov	r1, #32
	bl	writeChar(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L23
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	initCommandStr(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L19
.L20:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L25
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	mov	r0, r3
	bl	commandStrPop(PLT)
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #56]
	ldr	r3, [fp, #-28]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #4]
	add	r3, r2, r3
	add	r3, r3, #2
	str	r3, [sp, #0]
	mov	r0, r1
	ldr	r3, .L29+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #56]
	mov	r0, r3
	mov	r1, #32
	bl	writeChar(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L19
.L25:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #48]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	commandStrPush(PLT)
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #56]
	ldr	r3, [fp, #-28]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #4]
	add	r3, r2, r3
	add	r3, r3, #1
	str	r3, [sp, #0]
	mov	r0, r1
	ldr	r3, .L29+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-28]
	ldr	r0, [r3, #56]
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #48]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #4]
	sub	r3, r3, #1
	mov	r2, #8
	add	r3, r3, r1
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	bl	writeChar(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
.L19:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.L28+8)
	.word	.LC0(GOTOFF)
	.size	commandPromptHeartBeat, .-commandPromptHeartBeat
	.align	2
	.global	repositionCursor
	.type	repositionCursor, %function
repositionCursor:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #56]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	ldr	r3, [r3, #4]
	add	r3, r2, r3
	add	r3, r3, #2
	str	r3, [sp, #0]
	mov	r0, r1
	ldr	r3, .L34+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	.LC0(GOTOFF)
	.size	repositionCursor, .-repositionCursor
	.ident	"GCC: (GNU) 4.0.2"
