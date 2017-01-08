	.file	"UI.c"
	.text
	.align	2
	.global	initUI
	.type	initUI, %function
initUI:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #12
	mov	r0, r3
	ldr	r1, [fp, #-20]
	mov	r2, #1
	mov	r3, #3
	bl	initCommandPrompt(PLT)
	ldr	r3, [fp, #-16]
	add	r3, r3, #352
	mov	r0, r3
	ldr	r1, [fp, #-20]
	mov	r2, #1
	mov	r3, #1
	bl	initClock(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initUI, .-initUI
	.align	2
	.global	UIHeartBeat
	.type	UIHeartBeat, %function
UIHeartBeat:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #12
	mov	r0, r3
	bl	commandPromptHeartBeat(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #352
	mov	r0, r3
	bl	clockHeartBeat(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	beq	.L4
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L7
.L4:
	ldr	r3, [fp, #-24]
	add	r3, r3, #12
	mov	r0, r3
	bl	repositionCursor(PLT)
.L7:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	UIHeartBeat, .-UIHeartBeat
	.ident	"GCC: (GNU) 4.0.2"
