	.text
multime:
	daddui	r29,r29,-160
	sw	r30,156(r29)
	dadd	r30,r29,r0
	sw	r4,160(r30)
	sw	r5,164(r30)
	sw	r0,8(r30)
	sw	r0,12(r30)
	daddi	r2,r0,1
	sw	r2,16(r30)
	sw	r0,8(r30)
	j	$L2
	nop

$L3:
	lw	r3,12(r30)
	lw	r2,8(r30)
	nop
	daddu	r2,r3,r2
	sw	r2,12(r30)
	lw	r2,8(r30)
	nop
	dsll r2,r2,2
	daddui	r3,r30,8
	daddu	r2,r3,r2
	sw	r0,12(r2)
	lw	r2,8(r30)
	nop
	daddui	r2,r2,1
	sw	r2,8(r30)
$L2:
	lw	r2,8(r30)
	nop
	slti	r2,r2,32
	bne	r2,r0,$L3
	nop

	sw	r0,8(r30)
	j	$L4
	nop

$L5:
	lw	r3,12(r30)
	lw	r2,8(r30)
	nop
	dsrl	r2,r3,3
	andi	r2,r2,0x1
	daddui	r3,r2,48
	lw	r2,8(r30)
	nop
	dsll r2,r2,2
	daddui	r4,r30,8
	daddu	r2,r4,r2
	sw	r3,12(r2)
	lw	r2,8(r30)
	nop
	daddui	r2,r2,1
	sw	r2,8(r30)
$L4:
	lw	r2,8(r30)
	nop
	slti 	r2,r2,32
	bne	r2,r0,$L5
	nop

	sw	r0,148(r30)
	lw	r2,12(r30)
	dadd	r29,r30,r0
	lw	r30,156(r29)
	daddui	r29,r29,160
	halt
	nop

