#define E_INT 2
#define E_UINT 1
#define E_STR 4
#define E_CLEAR 6
#define E_READ 8
/*
; Set CONTROL = 1, Set DATA to Unsigned Integer to be output
; Set CONTROL = 2, Set DATA to Signed Integer to be output
; Set CONTROL = 3, Set DATA to Floating Point to be output
; Set CONTROL = 4, Set DATA to address of string to be output
; Set CONTROL = 5, Set DATA+5 to x coordinate, DATA+4 to y coordinate, and DATA to RGB colour to be output
; Set CONTROL = 6, Clears the terminal screen
; Set CONTROL = 7, Clears the graphics screen
; Set CONTROL = 8, read the DATA (either an integer or a floating-point) from the keyboard
; Set CONTROL = 9, read one byte from DATA, no character echo.
*/
int multime(int a, int b) {
  volatile int *DATA = (volatile int *) 0x10000;
  volatile int *CONTROL = (volatile int *) 0x10008;

  
  *DATA = (int) "Mult-complex - Jason : ";
  *CONTROL = (int) E_STR;

  *DATA = (int) " Num - LHS : ";
  *CONTROL = (int) E_STR;
  
  *CONTROL = (int) E_INT;
  a = *DATA;

  *DATA = (int) " Num - RHS : ";
  *CONTROL = (int) E_STR;
  
  *CONTROL = (int) E_INT;
  b = *DATA;

  int i = 0, result = 0;
  int lhs = a, rhs = b;
  for (i = 0; i < 32; i++) {
    if (rhs & 0x1) {
      result += lhs;
    }
    rhs >> 1;
    lhs << 1;
    
    *DATA = (int) "Cycle: ";
    *CONTROL = (int) E_STR;
  
    *DATA = (int) lhs;
    *CONTROL = (int) E_INT;

    *DATA = (int) rhs;
    *CONTROL = (int) E_INT;

    *DATA = (int) result;
    *CONTROL = (int) E_INT;
    
  }
  // print
  *DATA = (int) "Output: ";
  *CONTROL = (int) E_STR;
  
  *DATA = (int) result;
  *CONTROL = (int) E_INT;
  return result;
}
