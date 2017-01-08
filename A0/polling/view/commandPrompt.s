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
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	commandStrPush, .-commandStrPush
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
	ldr	sl, .L8
.L7:
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
	str	r2, [r3, #328]
	ldr	r3, [fp, #-20]
	add	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #332]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #336]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #328]
	mov	r0, r3
	bl	initCommandStr(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #336]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L8+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #336]
	mov	r0, r3
	ldr	r3, .L8+8
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initCommandPrompt, .-initCommandPrompt
	.align	2
	.global	commandPromptHeartBeat
	.type	commandPromptHeartBeat, %function
commandPromptHeartBeat:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L18
.L17:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #336]
	sub	r2, fp, #17
	mov	r0, r3
	mov	r1, r2
	bl	readChar(PLT)
	mov	r3, r0
	cmn	r3, #1
	bne	.L11
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L13
.L11:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L14
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L13
.L14:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #328]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	commandStrPush(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #336]
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L18+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #336]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #328]
	add	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	bl	writeStr(PLT)
	mov	r3, #1
	str	r3, [fp, #-28]
.L13:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.L17+8)
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
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #336]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #328]
	ldr	r3, [r3, #4]
	add	r3, r2, r3
	add	r3, r3, #2
	str	r3, [sp, #0]
	mov	r0, r1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	.LC0(GOTOFF)
	.size	repositionCursor, .-repositionCursor
	.ident	"GCC: (GNU) 4.0.2"
