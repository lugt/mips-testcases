.data
mes:  .asciiz "Hello Computer Systems (III) 2017152003!\n"

CONTROL: .word32 0x10000
DATA:    .word32 0x10008

PDATR:   .word32 0xBEADFEED
QDATR:   .word32 0xFEADFADE

.text
multime:
	daddui	r29,r29,-8
	sw	r30,4(r29)
	dadd r30,r29,r0
	sw	r4,8(r30)
	sw	r5,12(r30)
	lw  r3,8(r30)
	lw	r2,12(r30)
	nop
	daddu	r2,r3,r2
	dadd	r29,r30,r0
	lw	r30,4(r29)
	daddui	r29,r29,8
	halt
	nop
