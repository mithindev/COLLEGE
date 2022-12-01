#include <stdio.h>

void main() {
  int n;
  n=2;
  while (n%2 == 0) {
    printf("Enter a number :");
    scanf("%d",&n);
    printf("%d",n);
  }

  printf("you've entered an odd number");
}