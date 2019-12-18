	.text
foo:
	lw	r2,0(r4)
	lw	r3,0(r5)
	lw	r12,16(r29)
	ddiv	r0,r2,r3
1:
	lw	r11,20(r29)
	lw	r10,24(r29)
	lw	r9,28(r29)
	lw	r8,32(r29)
	lw	r5,36(r29)
	;;mflo	r3
	sw	r3,0(r4)
	lw	r3,0(r6)
	lw	r4,0(r7)
	nop
	ddiv	r0,r3, r4
2:
	;;mflo	r3
	sw	r3,0(r6)
	lw	r3,0(r12)
	nop
	daddui	r3,r3,1
	sw	r3,0(r12)
	lw	r3,0(r11)
	nop
	daddui	r3,r3,1
	sw	r3,0(r11)
	lw	r3,0(r10)
	nop
	daddui	r3,r3,1
	sw	r3,0(r10)
	lw	r3,0(r9)
	nop
	daddui	r3,r3,1
	sw	r3,0(r9)
	lw	r3,0(r8)
	nop
	daddui	r3,r3,1
	sw	r3,0(r8)
	lw	r3,0(r5)
	nop
	daddui	r3,r3,1
	halt
	sw	r3,0(r5)
