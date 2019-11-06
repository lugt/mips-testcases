int multime(int a, int b) {
  int display[33];
  int i = 0, result = 0, mask = 1;
  for (i = 0; i < 32; i++) {
    result += i;
    display[i] = 0;
  }
  for (i = 0; i < 32; i++) {
    display[i] = '0' + ((result >> i) & 0x1);
  }
  display[32] = 0;
  return result;
}
