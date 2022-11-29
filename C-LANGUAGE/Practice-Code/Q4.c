#include <stdio.h>

// Q-4]C Program to find the quotient and reminder of two integersentered by the user.

int main() {
  int num1,num2,quotient,rem;
  printf("Enter num1 :");
  scanf("%d",&num1);
  printf("\nEnter num2 :");
  scanf("%d",&num2);
  quotient = num1/num2;
  rem = num1%num2;
  printf("\nQuotient = %d, remainder = %d",quotient,rem);

  return 0;
}