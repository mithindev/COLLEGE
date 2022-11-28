#include <stdio.h>

int main() {
  int row, col;
  for (row = 1; row <= 9; row++)
  {
    if (row == 1 || row == 9) {
      printf("  ######  \n");      
    }
    else if (row == 2 || row == 8) {
      printf("##      ##\n");
    }
    else {
      printf("#\n");
    }
  }
  
  return 0;
}