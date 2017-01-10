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
	.global	baseIOsetspeed
	.type	baseIOsetspeed, %function
baseIOsetspeed:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L15
	ldr	r2, [fp, #-36]
	cmp	r2, #1
	beq	.L16
	b	.L14
.L15:
	ldr	r3, .L23
	str	r3, [fp, #-20]
	ldr	r3, .L23+4
	str	r3, [fp, #-16]
	b	.L17
.L16:
	ldr	r3, .L23+8
	str	r3, [fp, #-20]
	ldr	r3, .L23+12
	str	r3, [fp, #-16]
	b	.L17
.L14:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L18
.L17:
	ldr	r2, [fp, #-28]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #2400
	beq	.L20
	ldr	r3, .L23+16
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	beq	.L21
	b	.L19
.L21:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #3
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L18
.L20:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #191
	str	r3, [r2, #0]
	mov	r2, #0
	str	r2, [fp, #-32]
	b	.L18
.L19:
	mvn	r3, #0
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	-2138308596
	.word	-2138308592
	.word	-2138243060
	.word	-2138243056
	.word	115200
	.size	baseIOsetspeed, .-baseIOsetspeed
	.align	2
	.global	baseIOBootstrap
	.type	baseIOBootstrap, %function
baseIOBootstrap:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L28
.L27:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, .L28+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r3, .L28+8
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	mov	r0, #0
	mov	r1, #0
	bl	baseIOsetfifo(PLT)
	mov	r0, #0
	mov	r1, #2400
	bl	baseIOsetspeed(PLT)
	ldr	r3, .L28+12
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r2, r3, #96
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	bic	r2, r3, #2
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	str	r3, [r2, #516]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #516]
	str	r3, [r2, #520]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #524]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #528
	str	r3, [r2, #1040]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #1040]
	str	r3, [r2, #1044]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #1048]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+16
	str	r3, [r2, #1052]
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+20
	str	r3, [r2, #1056]
	mov	r0, #1
	mov	r1, #0
	bl	baseIOsetfifo(PLT)
	mov	r0, #1
	ldr	r1, .L28+24
	bl	baseIOsetspeed(PLT)
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	str	r3, [r2, #516]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #516]
	str	r3, [r2, #520]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #524]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #528
	str	r3, [r2, #1040]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #1040]
	str	r3, [r2, #1044]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #1048]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+28
	str	r3, [r2, #1052]
	ldr	r3, .L28+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L28+32
	str	r3, [r2, #1056]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	_GLOBAL_OFFSET_TABLE_-(.L27+8)
	.word	COM1IO(GOT)
	.word	COM2IO(GOT)
	.word	-2138308600
	.word	-2138308584
	.word	-2138308608
	.word	115200
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
	ldr	sl, .L38
.L37:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L31
	ldr	r3, .L38+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L33
.L31:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L34
	ldr	r3, .L38+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L33
.L34:
	mov	r3, #0
	str	r3, [fp, #-24]
.L33:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L39:
	.align	2
.L38:
	.word	_GLOBAL_OFFSET_TABLE_-(.L37+8)
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
	bne	.L41
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L43
.L41:
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
	bcc	.L44
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-16]
	str	r2, [r3, #520]
.L44:
	mov	r3, #0
	str	r3, [fp, #-24]
.L43:
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
	b	.L48
.L49:
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
	bne	.L50
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L52
.L50:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L48:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L49
	mov	r3, #0
	str	r3, [fp, #-32]
.L52:
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
	bne	.L56
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L58
.L56:
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
	bcc	.L59
	ldr	r3, [fp, #-16]
	add	r2, r3, #528
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1040]
.L59:
	mov	r3, #0
	str	r3, [fp, #-24]
.L58:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	readChar, .-readChar
	.align	2
	.global	buffer2port
	.type	buffer2port, %function
buffer2port:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1052]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L63
	ldr	r3, [fp, #-16]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L63
	mvn	r3, #1
	str	r3, [fp, #-24]
	b	.L66
.L63:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #524]
	cmp	r3, #0
	beq	.L67
	ldr	r3, [fp, #-16]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L67
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1056]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #516]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #516]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #516]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #524]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #524]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #516]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	add	r3, r3, #512
	cmp	r2, r3
	bcc	.L70
	ldr	r3, [fp, #-20]
	add	r2, r3, #4
	ldr	r3, [fp, #-20]
	str	r2, [r3, #516]
.L70:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L66
.L67:
	mov	r3, #0
	str	r3, [fp, #-24]
.L66:
	ldr	r3, [fp, #-24]
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
	beq	.L74
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1052]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L74
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
	bcc	.L77
	ldr	r3, [fp, #-16]
	add	r2, r3, #528
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1044]
.L77:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L79
.L74:
	mov	r3, #0
	str	r3, [fp, #-20]
.L79:
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
	bhi	.L82
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L84
.L82:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L84:
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
	b	.L89
.L90:
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
.L89:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L90
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
	b	.L94
.L95:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	writeChar(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L96
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L98
.L96:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L94:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L95
	mov	r3, #0
	str	r3, [fp, #-24]
.L98:
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
	b	.L102
.L103:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L102:
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
	bne	.L106
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L103
	b	.L106
.L107:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	writeChar(PLT)
.L106:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L107
	b	.L109
.L110:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	writeChar(PLT)
.L109:
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
	bne	.L110
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
	bls	.L114
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L114
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L117
.L114:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L118
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L118
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L117
.L118:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L121
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L121
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L117
.L121:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L117:
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
	b	.L126
.L127:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L128
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
.L126:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	baseIOa2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L127
.L128:
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
	b	.L132
.L133:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L132:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L133
	b	.L145
.L136:
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
	bne	.L137
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L137
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L135
.L137:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L140
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L142
.L140:
	mov	r3, #87
	str	r3, [fp, #-40]
.L142:
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
.L135:
.L145:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L136
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
	bge	.L147
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L147:
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
	b	.L169
.L152:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L153
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	writeChar(PLT)
	b	.L151
.L153:
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
	beq	.L156
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L155
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L155
	b	.L157
.L156:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L155
.L157:
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
.L155:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L162
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L165
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L160
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L166
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L168
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L159
	b	.L151
.L166:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L161
	b	.L151
.L165:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L163
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L164
	b	.L151
.L160:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	writeChar(PLT)
	b	.L151
.L162:
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
	b	.L151
.L163:
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
	b	.L151
.L161:
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
	b	.L151
.L164:
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
	b	.L151
.L159:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	writeChar(PLT)
.L151:
.L169:
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
	bne	.L152
.L168:
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
