$LC0:
	.ascii	"Mult-complex - Jason : \000"
$LC1:
	.ascii	" Num - LHS : \000"
$LC2:
	.ascii	" Num - RHS : \000"
$LC3:
	.ascii	"Cycle: \000"
$LC4:
	.ascii	"Output: \000"
	.text
multime:
	daddui	r29,r29,-40
	sw	r30,36(r29)
	dadd	r30,r29,r0
	sw	r4,40(r30)
	sw	r5,44(r30)
	daddi	r2,r0,65536			# 0x10000
	sw	r2,16(r30)
	daddi	r2,r0,65536			# 0x10000
	ori	r2,r2,0x8
	sw	r2,20(r30)
	lw r2, $LC0
	nop
	daddui	r3,r2,%lo($LC0)
	lw	r2,16(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,4			# 0x4
	sw	r3,0(r2)
	lw r2, $LC1
	nop
	daddui	r3,r2,%lo($LC1)
	lw	r2,16(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,4			# 0x4
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,2			# 0x2
	sw	r3,0(r2)
	lw	r2,16(r30)
	nop
	lw	r2,0(r2)
	nop
	sw	r2,40(r30)
	lw r2, $LC2
	nop
	daddui	r3,r2,%lo($LC2)
	lw	r2,16(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,4			# 0x4
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,2			# 0x2
	sw	r3,0(r2)
	lw	r2,16(r30)
	nop
	lw	r2,0(r2)
	nop
	sw	r2,44(r30)
	sw	r0,8(r30)
	sw	r0,12(r30)
	lw	r2,40(r30)
	nop
	sw	r2,24(r30)
	lw	r2,44(r30)
	nop
	sw	r2,28(r30)
	sw	r0,8(r30)
	j	$L2
	nop

$L4:
	lw	r2,28(r30)
	nop
	andi	r2,r2,0x1
	beq	r2,r0,$L3
	nop

	lw	r3,12(r30)
	lw	r2,24(r30)
	nop
	daddu	r2,r3,r2
	sw	r2,12(r30)
$L3:
	lw r2, $LC3
	nop
	daddui	r3,r2,%lo($LC3)
	lw	r2,16(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,4			# 0x4
	sw	r3,0(r2)
	lw	r2,16(r30)
	lw	r3,24(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,2			# 0x2
	sw	r3,0(r2)
	lw	r2,16(r30)
	lw	r3,28(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,2			# 0x2
	sw	r3,0(r2)
	lw	r2,16(r30)
	lw	r3,12(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,2			# 0x2
	sw	r3,0(r2)
	lw	r2,8(r30)
	nop
	daddui	r2,r2,1
	sw	r2,8(r30)
$L2:
	lw	r2,8(r30)
	nop
	slt	r2,r2,32
	bne	r2,r0,$L4
	nop

	lw r2, $LC4
	nop
	daddui	r3,r2,%lo($LC4)
	lw	r2,16(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,4			# 0x4
	sw	r3,0(r2)
	lw	r2,16(r30)
	lw	r3,12(r30)
	nop
	sw	r3,0(r2)
	lw	r2,20(r30)
	daddi	r3,r0,2			# 0x2
	sw	r3,0(r2)
	lw	r2,12(r30)
	dadd	r29,r30,r0
	lw	r30,36(r29)
	daddui	r29,r29,40
	halt
	nop

