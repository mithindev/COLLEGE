#include <stdio.h>

void main() {
  int n,temp = 0;
  int temp1;

  printf("Enter the number :");
  scanf("%d",&n);
  for (int i = 0;i <=n; i++) {
    printf("%d", i);
  }

  while (temp<=n) {
    printf("%d", temp);
    temp++;
  }

  do {
    printf("%d", temp1);
    temp1++;
  } while (temp1 <= n);
}