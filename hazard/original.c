
int foo (int A[4][4], int B[4][4], int C[4][4]) {
  for(int i = 0; i< 4; i++)
  for(int j = 0; j < 4; j++)
    C[i][j] = A[i][j] + B[i][j];
}
