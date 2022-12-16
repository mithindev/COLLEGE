#include <stdio.h>

void main() {
  int nr;
  printf("Enter the number of rows :");
  scanf("%d",&nr);
  for (int row = 1;row<=nr;row++) {
    for (int col = 1; col<=row; col++) {
      printf("* ");
    }
    printf("\n");
  }
}