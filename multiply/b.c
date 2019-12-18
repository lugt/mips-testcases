int multime(int a, int b) {
  //int mask = 1;
  //int display[33];
  //  display[i] = 0;
  int i = 0, result = 0;
  for (i = 0; i < 32; i++) {
    result += i;
  }

  /*
  for (i = 0; i < 32; i++) {
    display[i] = '0' + ((result >> i) & 0x1);
  }
  display[32] = 0;
  */

  return result;
}
