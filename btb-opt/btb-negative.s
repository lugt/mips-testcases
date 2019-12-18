	.text
foo:
	daddui	r29,r29,-16
	sw	r30,12(r29)
	dadd	r30,r29,r0
	sw	r4,16(r30)
	sw	r5,20(r30)
	sw	r6,24(r30)
	sw	r0,0(r30)
	j	$L2
	nop

$L5:
	sw	r0,4(r30)
	j	$L3
	nop

$L4:
	lw	r2,0(r30)
	nop
	sll	r2,r2,4
	lw	r3,24(r30)
	nop
	daddu	r4,r3,r2
	lw	r2,0(r30)
	nop
	sll	r2,r2,4
	lw	r3,16(r30)
	nop
	daddu	r3,r3,r2
	lw	r2,4(r30)
	nop
	sll	r2,r2,2
	daddu	r2,r3,r2
	lw	r3,0(r2)
	lw	r2,0(r30)
	nop
	sll	r2,r2,4
	lw	r5,20(r30)
	nop
	daddu	r5,r5,r2
	lw	r2,4(r30)
	nop
	sll	r2,r2,2
	daddu	r2,r5,r2
	lw	r2,0(r2)
	nop
	daddu	r3,r3,r2
	lw	r2,4(r30)
	nop
	sll	r2,r2,2
	daddu	r2,r4,r2
	sw	r3,0(r2)
	lw	r2,4(r30)
	nop
	daddui	r2,r2,1
	sw	r2,4(r30)
$L3:
	lw	r2,4(r30)
	nop
	blez	r2,$L4
	nop

	lw	r2,0(r30)
	nop
	daddui	r2,r2,1
	sw	r2,0(r30)
$L2:
	lw	r2,0(r30)
	nop
	blez	r2,$L5
	nop

	nop
	dadd	r29,r30,r0
	lw	r30,12(r29)
	daddui	r29,r29,16
	halt
	nop
