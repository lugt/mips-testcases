	.text
foo:
	lw	r3,0(r4)
	lw	r2,0(r5)
	nop
	daddu	r2,r2,r3
	sw	r2,0(r6)
	lw	r7,4(r4)
	lw	r3,4(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,4(r6)
	lw	r7,8(r4)
	lw	r3,8(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,8(r6)
	lw	r7,12(r4)
	lw	r3,12(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,12(r6)
	lw	r7,16(r4)
	lw	r3,16(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,16(r6)
	lw	r7,20(r5)
	lw	r3,20(r4)
	nop
	daddu	r3,r3,r7
	sw	r3,20(r6)
	lw	r7,24(r5)
	lw	r3,24(r4)
	nop
	daddu	r3,r3,r7
	sw	r3,24(r6)
	lw	r7,28(r5)
	lw	r3,28(r4)
	nop
	daddu	r3,r3,r7
	sw	r3,28(r6)
	lw	r7,32(r5)
	lw	r3,32(r4)
	nop
	daddu	r3,r3,r7
	sw	r3,32(r6)
	lw	r7,36(r5)
	lw	r3,36(r4)
	nop
	daddu	r3,r3,r7
	sw	r3,36(r6)
	lw	r7,40(r5)
	lw	r3,40(r4)
	nop
	daddu	r3,r3,r7
	sw	r3,40(r6)
	lw	r3,44(r4)
	lw	r7,44(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,44(r6)
	lw	r3,48(r4)
	lw	r7,48(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,48(r6)
	lw	r3,52(r4)
	lw	r7,52(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,52(r6)
	lw	r3,56(r4)
	lw	r7,56(r5)
	nop
	daddu	r3,r3,r7
	sw	r3,56(r6)
	lw	r3,60(r4)
	lw	r4,60(r5)
	nop
	daddu	r3,r3,r4
    
	halt
	sw	r3,60(r6)
