	.file	"switchTable.c"
	.text
	.align	2
	.global	initSwitchTable
	.type	initSwitchTable, %function
initSwitchTable:
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
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initSwitchTable, .-initSwitchTable
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC1:
	.ascii	"SWITCHID|  STATUS\012\015\000"
	.align	2
.LC2:
	.ascii	"   %d\011|\000"
	.align	2
.LC3:
	.ascii	"  Curved \012\015\000"
	.align	2
.LC4:
	.ascii	" Straight\012\015\000"
	.align	2
.LC5:
	.ascii	"  %d\011|\000"
	.text
	.align	2
	.global	switchTableHeartBeat
	.type	switchTableHeartBeat, %function
switchTableHeartBeat:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	bl	getTrainSwitchStatus(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L4
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #24]
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	ip, [r3, #8]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r3, .L21+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, ip
	bl	baseIOprintf(PLT)
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	baseIOprintf(PLT)
	b	.L6
.L7:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	baseIOprintf(PLT)
	bl	getTrainSwitchStatus(PLT)
	mov	r3, r0
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	readSwitchStatus(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+16
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
	b	.L10
.L8:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+20
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
.L10:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L6:
	ldr	r3, [fp, #-20]
	cmp	r3, #18
	ble	.L7
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L12
.L13:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	ip, r3, #152
	mov	r0, r2
	ldr	r3, .L21+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	bl	baseIOprintf(PLT)
	bl	getTrainSwitchStatus(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-20]
	add	r3, r3, #152
	mov	r0, r2
	mov	r1, r3
	bl	readSwitchStatus(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+16
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
	b	.L16
.L14:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r3, .L21+20
	add	r3, sl, r3
	mov	r1, r3
	bl	baseIOprintf(PLT)
.L16:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L12:
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	ble	.L13
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L18
.L4:
	mov	r3, #0
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	switchTableHeartBeat, .-switchTableHeartBeat
	.ident	"GCC: (GNU) 4.0.2"
