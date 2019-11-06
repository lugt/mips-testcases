int multime(int a, int b) {
  int i = 0, result = 0;
  int lhs = a, rhs = b;
  for (i = 0; i < 32; i++) {
    if (rhs & 0x1) {
      result += lhs;
    }
    rhs << 1;
    lhs >> 1;
  }
  return result;
}
