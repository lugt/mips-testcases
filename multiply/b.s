	.file	1 "b.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	multime
	.set	nomips16
	.set	nomicromips
	.ent	multime
	.type	multime, @function
multime:
	.frame	$fp,160,$31		# vars= 144, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160
	sw	$fp,156($sp)
	move	$fp,$sp
	sw	$4,160($fp)
	sw	$5,164($fp)
	sw	$0,8($fp)
	sw	$0,12($fp)
	li	$2,1			# 0x1
	sw	$2,16($fp)
	sw	$0,8($fp)
	b	$L2
	nop

$L3:
	lw	$3,12($fp)
	lw	$2,8($fp)
	nop
	addu	$2,$3,$2
	sw	$2,12($fp)
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	addiu	$3,$fp,8
	addu	$2,$3,$2
	sw	$0,12($2)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$2,8($fp)
	nop
	slt	$2,$2,32
	bne	$2,$0,$L3
	nop

	sw	$0,8($fp)
	b	$L4
	nop

$L5:
	lw	$3,12($fp)
	lw	$2,8($fp)
	nop
	sra	$2,$3,$2
	andi	$2,$2,0x1
	addiu	$3,$2,48
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	addiu	$4,$fp,8
	addu	$2,$4,$2
	sw	$3,12($2)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L4:
	lw	$2,8($fp)
	nop
	slt	$2,$2,32
	bne	$2,$0,$L5
	nop

	sw	$0,148($fp)
	lw	$2,12($fp)
	move	$sp,$fp
	lw	$fp,156($sp)
	addiu	$sp,$sp,160
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	multime
	.size	multime, .-multime
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
