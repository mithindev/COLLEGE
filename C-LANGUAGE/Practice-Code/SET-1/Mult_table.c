#include <stdio.h>

void main() {
  int n,temp;
  printf("Enter a number :");
  scanf("%d",&n);
  for (int i = 1;i < 11;i++) {
    temp = n*i;
    printf("%d * %d = %d\n",n,i,temp);
  }
}