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
	bls	.L32
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
	bls	.L47
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
	bls	.L54
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
	bls	.L62
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
	.ident	"GCC: (GNU) 4.0.2"
