	.text
multime:
	daddui	r29,r29,-32
	sw	r30,28(r29)
	dadd	r30,r29,r0
	sw	r4,32(r30)
	sw	r5,36(r30)
	sw	r0,8(r30)
	sw	r0,12(r30)
	lw	r2,32(r30)
	nop
	sw	r2,16(r30)
	lw	r2,36(r30)
	nop
	sw	r2,20(r30)
	sw	r0,8(r30)
	b	$L2
	nop

$L4:
	lw	r2,20(r30)
	nop
	andi	r2,r2,0x1
	beq	r2,r0,$L3
	nop

	lw	r3,12(r30)
	lw	r2,16(r30)
	nop
	daddu	r2,r3,r2
	sw	r2,12(r30)
$L3:
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

	lw	r2,12(r30)
	dadd	r29,r30,r0
	lw	r30,28(r29)
	daddui	r29,r29,32
	halt
	nop

