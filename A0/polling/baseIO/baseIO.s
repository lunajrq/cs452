	.file	"baseIO.c"
	.global	COM1IO
	.bss
	.align	2
	.type	COM1IO, %object
	.size	COM1IO, 4
COM1IO:
	.space	4
	.global	COM2IO
	.align	2
	.type	COM2IO, %object
	.size	COM2IO, 4
COM2IO:
	.space	4
	.text
	.align	2
	.global	baseIOsetfifo
	.type	baseIOsetfifo, %function
baseIOsetfifo:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L4
	b	.L2
.L3:
	ldr	r3, .L11
	str	r3, [fp, #-20]
	b	.L5
.L4:
	ldr	r3, .L11+4
	str	r3, [fp, #-20]
	b	.L5
.L2:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L6
.L5:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-16]
	orr	r3, r3, #16
	str	r3, [fp, #-32]
	b	.L9
.L7:
	ldr	r3, [fp, #-16]
	bic	r3, r3, #16
	str	r3, [fp, #-32]
.L9:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
.L6:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	-2138308600
	.word	-2138243064
	.size	baseIOsetfifo, .-baseIOsetfifo
	.align	2
	.global	baseIOBootstrap
	.type	baseIOBootstrap, %function
baseIOBootstrap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, .L16+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, .L16+8
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	str	r3, [r2, #516]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #516]
	str	r3, [r2, #520]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #524]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #528
	str	r3, [r2, #1040]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #1040]
	str	r3, [r2, #1044]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #1048]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+12
	str	r3, [r2, #1052]
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+16
	str	r3, [r2, #1056]
	mov	r0, #1
	mov	r1, #0
	bl	baseIOsetfifo(PLT)
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	str	r3, [r2, #516]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #516]
	str	r3, [r2, #520]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #524]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #528
	str	r3, [r2, #1040]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #1040]
	str	r3, [r2, #1044]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #1048]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+20
	str	r3, [r2, #1052]
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L16+24
	str	r3, [r2, #1056]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	COM1IO(GOT)
	.word	COM2IO(GOT)
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	baseIOBootstrap, .-baseIOBootstrap
	.align	2
	.global	getBaseIO
	.type	getBaseIO, %function
getBaseIO:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L26
.L25:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L19
	ldr	r3, .L26+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L21
.L19:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L22
	ldr	r3, .L26+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L21
.L22:
	mov	r3, #0
	str	r3, [fp, #-24]
.L21:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	COM1IO(GOT)
	.word	COM2IO(GOT)
	.size	getBaseIO, .-getBaseIO
	.align	2
	.global	writeChar
	.type	writeChar, %function
writeChar:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #524]
	cmp	r3, #512
	bne	.L29
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L31
.L29:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #520]
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #520]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #520]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #524]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #524]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #520]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	add	r3, r3, #512
	cmp	r2, r3
	bcc	.L32
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-16]
	str	r2, [r3, #520]
.L32:
	mov	r3, #0
	str	r3, [fp, #-24]
.L31:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	writeChar, .-writeChar
	.align	2
	.global	writeStr
	.type	writeStr, %function
writeStr:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L36
.L37:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	writeChar(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	bne	.L38
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L40
.L38:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L36:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L37
	mov	r3, #0
	str	r3, [fp, #-32]
.L40:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	writeStr, .-writeStr
	.align	2
	.global	readChar
	.type	readChar, %function
readChar:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1048]
	cmp	r3, #0
	bne	.L44
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L46
.L44:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1040]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1040]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1040]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1048]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1048]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1040]
	ldr	r3, [fp, #-16]
	add	r3, r3, #528
	add	r3, r3, #512
	cmp	r2, r3
	bcc	.L47
	ldr	r3, [fp, #-16]
	add	r2, r3, #528
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1040]
.L47:
	mov	r3, #0
	str	r3, [fp, #-24]
.L46:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	readChar, .-readChar
	.align	2
	.global	buffer2port
	.type	buffer2port, %function
buffer2port:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #524]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1052]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L51
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1056]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #516]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #524]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #524]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #516]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	add	r3, r3, #512
	cmp	r2, r3
	bcc	.L54
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-16]
	str	r2, [r3, #516]
.L54:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L56
.L51:
	mov	r3, #0
	str	r3, [fp, #-20]
.L56:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	buffer2port, .-buffer2port
	.align	2
	.global	port2buffer
	.type	port2buffer, %function
port2buffer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1048]
	cmp	r3, #512
	beq	.L59
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1052]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L59
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1044]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1056]
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1044]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1044]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1048]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1048]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1044]
	ldr	r3, [fp, #-16]
	add	r3, r3, #528
	add	r3, r3, #512
	cmp	r2, r3
	bcc	.L62
	ldr	r3, [fp, #-16]
	add	r2, r3, #528
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1044]
.L62:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L64
.L59:
	mov	r3, #0
	str	r3, [fp, #-20]
.L64:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	port2buffer, .-port2buffer
	.align	2
	.global	c2x
	.type	c2x, %function
c2x:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bhi	.L67
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L69
.L67:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L69:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	c2x, .-c2x
	.align	2
	.global	baseIOputx
	.type	baseIOputx, %function
baseIOputx:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	writeChar(PLT)
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	writeChar(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOputx, .-baseIOputx
	.align	2
	.global	baseIOputr
	.type	baseIOputr, %function
baseIOputr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	sub	r3, fp, #28
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L74
.L75:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	baseIOputx(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L74:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L75
	ldr	r0, [fp, #-24]
	mov	r1, #32
	bl	writeChar(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOputr, .-baseIOputr
	.align	2
	.global	baseIOputstr
	.type	baseIOputstr, %function
baseIOputstr:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L79
.L80:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	writeChar(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L81
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L83
.L81:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L79:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L80
	mov	r3, #0
	str	r3, [fp, #-24]
.L83:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOputstr, .-baseIOputstr
	.align	2
	.global	baseIOputw
	.type	baseIOputw, %function
baseIOputw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L87
.L88:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L87:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L91
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L88
	b	.L91
.L92:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	writeChar(PLT)
.L91:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L92
	b	.L94
.L95:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	writeChar(PLT)
.L94:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L95
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOputw, .-baseIOputw
	.align	2
	.global	baseIOa2d
	.type	baseIOa2d, %function
baseIOa2d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L99
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L99
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L102
.L99:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L103
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L103
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L102
.L103:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L106
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L106
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L102
.L106:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L102:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOa2d, .-baseIOa2d
	.align	2
	.global	baseIOa2i
	.type	baseIOa2i, %function
baseIOa2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L111
.L112:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L113
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L111:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	baseIOa2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L112
.L113:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOa2i, .-baseIOa2i
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	baseIOui2a
	.type	baseIOui2a, %function
baseIOui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L117
.L118:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L117:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L118
	b	.L130
.L121:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L122
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L120
.L122:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L125
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L127
.L125:
	mov	r3, #87
	str	r3, [fp, #-40]
.L127:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L120:
.L130:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L121
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOui2a, .-baseIOui2a
	.align	2
	.global	baseIOi2a
	.type	baseIOi2a, %function
baseIOi2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L132
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L132:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	baseIOui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOi2a, .-baseIOi2a
	.align	2
	.global	baseIOformat
	.type	baseIOformat, %function
baseIOformat:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	b	.L154
.L137:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L138
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	writeChar(PLT)
	b	.L136
.L138:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L141
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L140
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L140
	b	.L142
.L141:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L140
.L142:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #40
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	baseIOa2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L140:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L147
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L150
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L145
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L151
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L153
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L144
	b	.L136
.L151:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L146
	b	.L136
.L150:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L148
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L149
	b	.L136
.L145:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	writeChar(PLT)
	b	.L136
.L147:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #0
	bl	baseIOputw(PLT)
	b	.L136
.L148:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	baseIOui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	baseIOputw(PLT)
	b	.L136
.L146:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	baseIOi2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	baseIOputw(PLT)
	b	.L136
.L149:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	baseIOui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	baseIOputw(PLT)
	b	.L136
.L144:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	writeChar(PLT)
.L136:
.L154:
	ldr	r1, [fp, #-40]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-40]
	cmp	r2, #0
	bne	.L137
.L153:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOformat, .-baseIOformat
	.align	2
	.global	baseIOprintf
	.type	baseIOprintf, %function
baseIOprintf:
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #-16]
	bl	baseIOformat(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	baseIOprintf, .-baseIOprintf
	.ident	"GCC: (GNU) 4.0.2"
