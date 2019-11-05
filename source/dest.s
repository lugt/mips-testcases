main:
	addiu	r29,r29,-8
	sw	r30,4(r29)
	move	r30,r29
	li	r2,1			# 0x1
	move	r29,r30
	lw	r30,4(r29)
	addiu	r29,r29,8
	j	r31
	nop

