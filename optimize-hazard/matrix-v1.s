  .data

a:    .word      1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4
b:    .word      4,4,4,4,3,3,3,3,2,2,2,2,1,1,1,1
c:    .word      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
len:  .word      4

control: .word32 0x10000
data:    .word32 0x10008

      .text
start: 
      daddi r17,r0,0
      ld r16,len(r0)
      daddi r21,r0,a  ;; De-coupling
      daddi r22,r0,b
      daddi r23,r0,c
loop1: 
      slt r8,r17,r16
      ;; nop
      ;; nop
      beq r8,r0,exit1
BB3:
      daddi r19,r0,0  ;; De-coupling
      ;; nop
loop2: 
      slt r8,r19,r16
      ;; nop
      ;; nop
      beq r8,r0,exit2
BB5:
      dsll r4,r17,2
      dadd r13,r4,r19  ;; 2RAW
      ;; nop
      ;; nop
      dsll r14,r13,3   ;; 2RAW
      ;; nop
      ;; nop
      dadd r9,r14,r21  ;; 2RAW
      dadd r10,r14,r22  
      daddi r19,r19,1
      ld r15,0(r9)
      ld r16,0(r10)
      dadd r11,r14,r23 
      ;; nop
      dadd r12,r15,r16 ;; 1RAW
      sd r12,0(r11)
      ;; nop
      ;; nop
      j loop2

exit2: 
      daddi r17,r17,1
      ;; nop
      ;; nop
      j loop1
exit1: 
      halt
