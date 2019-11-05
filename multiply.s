.data
mes:  .asciiz "Hello Computer Systems (III) 2017152003!\n"

CONTROL: .word32 0x10000
DATA:    .word32 0x10008

PDATR:   .word32 0xBEADFEED
QDATR:   .word32 0xFEADFADE

.text
main:
lwu r8,PDATR(r0)
lwu r9,QDATR(r0)


;;;
daddi r12, r8, 0x0
slli r12, r12, 31
srli r12, r12, 31
beqz r12, r0

;;;

lwu r8,DATA(r0)    ; get data
lwu r9,CONTROL(r0) ; and control registers
       
daddi r16,r0,4       ; set for ascii output
daddi r17,r0,mes
sd r17,0(r8)           ; write address of message to DATA register
sd r16,0(r9)           ; make it happen

halt


