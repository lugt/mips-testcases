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
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$0,8($fp)
	sw	$0,12($fp)
	lw	$2,32($fp)
	nop
	sw	$2,16($fp)
	lw	$2,36($fp)
	nop
	sw	$2,20($fp)
	sw	$0,8($fp)
	b	$L2
	nop

$L4:
	lw	$2,20($fp)
	nop
	andi	$2,$2,0x1
	beq	$2,$0,$L3
	nop

	lw	$3,12($fp)
	lw	$2,16($fp)
	nop
	addu	$2,$3,$2
	sw	$2,12($fp)
$L3:
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

	lw	$2,12($fp)
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	multime
	.size	multime, .-multime
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
