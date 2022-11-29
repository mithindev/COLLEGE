#include <stdio.h>
#include <math.h>

// Q-5]C program to find power of any numberxy.

int main() {
  int a,b,c;
  printf("Enter Number1 :");
  scanf("%d",&a);
  printf("\nEnter Number2 :");
  scanf("%d",&b);
  c = pow(a,b);
  printf("Ans = %d",c);
}