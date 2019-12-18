.data
$LC0:
	.asciiz	"Mult-complex - Jason : \000"
$LC1:
	.asciiz	" Num - LHS : \000"
$LC2:
	.asciiz	" Num - RHS : \000"
$LC3:
	.asciiz	"Cycle: \000"
$LC4:
	.asciiz	"Output: \000"

mes:  .asciiz "Hello Computer Systems (III) 2017152003!\n"

CONTROL: .word32 0x10000
DATA:    .word32 0x10008

PDATR:   .word32 0xBEADFEED
QDATR:   .word32 0xFEADFADE

;
; Number multiplication demo
        .data
max:    .word 0         ; max number so far

title:  .asciiz "Guanting's Multiplier\n"
prompt:	.asciiz "Number-A= "
prompt2: .asciiz "Number-B= "
prompt3: .asciiz "Input= "
prompt4: .asciiz "RHS= "
prompt5: .asciiz "LHS= "
str:    .asciiz "Multiplied= "
errmsg:    .asciiz "Oops, here's a result overflow in GT's multiplier!!!"

;
; Memory Mapped I/O area
;
; Address of CONTROL and DATA registers
;
; Set CONTROL = 1, Set DATA to Unsigned Integer to be output
; Set CONTROL = 2, Set DATA to Signed Integer to be output
; Set CONTROL = 3, Set DATA to Floating Point to be output
; Set CONTROL = 4, Set DATA to address of string to be output
; Set CONTROL = 5, Set DATA+5 to x coordinate, DATA+4 to y coordinate, and DATA to RGB colour to be output
; Set CONTROL = 6, Clears the terminal screen
; Set CONTROL = 7, Clears the graphics screen
; Set CONTROL = 8, read the DATA (either an integer or a floating-point) from the keyboard
; Set CONTROL = 9, read one byte from DATA, no character echo.
;

CONTROL: .word32 0x10000
DATA:    .word32 0x10008

        .text
        lwu r8,DATA(r0)    ; get data
        lwu r9,CONTROL(r0) ; and control registers 	

		daddi r30, r0, 0x300   ;; mimic runtime
		daddi r29, r0, 0x250   ; mimic runtime

		daddi r11,r0,4     ; set for string output  
		daddi r12,r0,1   ; set for integer output

	    daddi r11,r0,4     ; set for string output  

        daddi r1,r0,title  ; get title address
        sd r1,(r8)         ; print title
        sd r11,(r9)
 
        daddi r1,r0,prompt ; get prompt address
        sd r1,0(r8)        ; print prompt
        sd r11,0(r9)     

        daddi r1,$zero,8   ; set for input
        sd r1,0(r9)	   ; get the hailstone start number 
        ld r1,0(r8)

		sw r1, 0(r29) ;save first to stack

        daddi r1,r0,prompt2 ; get prompt address
        sd r1,0(r8)        ; print prompt
        sd r11,0(r9)     

        daddi r1,$zero,8   ; set for input
        sd r1,0(r9)	   ; get the hailstone start number 
        ld r1,0(r8)
		
		sw r1, 4(r29) ; save second to stack, arg2
		
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
	daddi r2, r0, 0xffff
	dsll r2, r2, 25
	sw	r2,16(r30)
	lw	r2,36(r30)
	nop
	daddi r2, r0, 65535
	sw	r2,20(r30)
	sw	r0,8(r30)

	daddi r16, r0, 0
	j	$L2
	nop

$L4:
	lw	r2,20(r30)
	nop
	andi	r2,r2,0x1
	beq	r2,r0,$L3
	nop

	lw	r3,12(r30)

	daddi r1,r0,prompt3 ; get prompt address
    sd r1,0(r8)        ; print prompt
    sd r11,0(r9)     
	sd r3,(r8)       ; output result
	sd r12,(r9)

	lw	r2,16(r30)
	nop
	daddu	r15, r3, r2
	bne     r16, r0, skip
	sltu    r16, r15, r3
	beq     r16, r0, skip
skip:	
	daddui   r2, r15, 0
	sw	r2,12(r30)
$L3:
	lw	r2,20(r30)
	nop
	dsra	r2,r2,1
	sw	r2,20(r30)
	lw	r2,16(r30)
	nop
	dsll	r2,r2,1
	sw	r2,16(r30)
	lw	r2,8(r30)
	nop
	daddui	r2,r2,1
	sw	r2,8(r30)
$L2:
	lw	r2,8(r30)
	nop
	slti	r2,r2,32
	bne	r2,r0,$L4
	nop

	lw	r2,12(r30)
    daddi r1,r0,str  ; get address of "result= " string
    daddi r11,r0,4     ; set for string output  
	daddi r12,r0,1   ; set for integer output
        sd r1,(r8)       ; display "result"
        sd r11,(r9)
        sd r2,(r8)       ; output result
        sd r12,(r9)
ovwmsg:
    daddi r1,r0,errmsg  ; get address of "result= " string
        sd r1,(r8)       ; display "result"
        sd r11,(r9)

$L7:
    dadd	r29,r30,r0
	lw	r30,28(r29)
	daddui	r29,r29,32
	halt