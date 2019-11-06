	.file	1 "b.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Mult-complex - Jason : \000"
	.align	2
$LC1:
	.ascii	" Num - LHS : \000"
	.align	2
$LC2:
	.ascii	" Num - RHS : \000"
	.align	2
$LC3:
	.ascii	"Cycle: \000"
	.align	2
$LC4:
	.ascii	"Output: \000"
	.text
	.align	2
	.globl	multime
	.set	nomips16
	.set	nomicromips
	.ent	multime
	.type	multime, @function
multime:
	.frame	$fp,40,$31		# vars= 24, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$fp,36($sp)
	move	$fp,$sp
	.cprestore	0
	sw	$4,40($fp)
	sw	$5,44($fp)
	li	$2,65536			# 0x10000
	sw	$2,16($fp)
	li	$2,65536			# 0x10000
	ori	$2,$2,0x8
	sw	$2,20($fp)
	lw	$2,%got($LC0)($28)
	nop
	addiu	$3,$2,%lo($LC0)
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,4			# 0x4
	sw	$3,0($2)
	lw	$2,%got($LC1)($28)
	nop
	addiu	$3,$2,%lo($LC1)
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,4			# 0x4
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,2			# 0x2
	sw	$3,0($2)
	lw	$2,16($fp)
	nop
	lw	$2,0($2)
	nop
	sw	$2,40($fp)
	lw	$2,%got($LC2)($28)
	nop
	addiu	$3,$2,%lo($LC2)
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,4			# 0x4
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,2			# 0x2
	sw	$3,0($2)
	lw	$2,16($fp)
	nop
	lw	$2,0($2)
	nop
	sw	$2,44($fp)
	sw	$0,8($fp)
	sw	$0,12($fp)
	lw	$2,40($fp)
	nop
	sw	$2,24($fp)
	lw	$2,44($fp)
	nop
	sw	$2,28($fp)
	sw	$0,8($fp)
	b	$L2
	nop

$L4:
	lw	$2,28($fp)
	nop
	andi	$2,$2,0x1
	beq	$2,$0,$L3
	nop

	lw	$3,12($fp)
	lw	$2,24($fp)
	nop
	addu	$2,$3,$2
	sw	$2,12($fp)
$L3:
	lw	$2,%got($LC3)($28)
	nop
	addiu	$3,$2,%lo($LC3)
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,4			# 0x4
	sw	$3,0($2)
	lw	$2,16($fp)
	lw	$3,24($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,2			# 0x2
	sw	$3,0($2)
	lw	$2,16($fp)
	lw	$3,28($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,2			# 0x2
	sw	$3,0($2)
	lw	$2,16($fp)
	lw	$3,12($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,2			# 0x2
	sw	$3,0($2)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$2,8($fp)
	nop
	slt	$2,$2,32
	bne	$2,$0,$L4
	nop

	lw	$2,%got($LC4)($28)
	nop
	addiu	$3,$2,%lo($LC4)
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,4			# 0x4
	sw	$3,0($2)
	lw	$2,16($fp)
	lw	$3,12($fp)
	nop
	sw	$3,0($2)
	lw	$2,20($fp)
	li	$3,2			# 0x2
	sw	$3,0($2)
	lw	$2,12($fp)
	move	$sp,$fp
	lw	$fp,36($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	multime
	.size	multime, .-multime
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
