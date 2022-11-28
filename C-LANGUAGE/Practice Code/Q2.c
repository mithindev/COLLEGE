#include <stdio.h>

// Q-2]C program to enter two numbers and find their sum.

int main() {
  int num1,num2,sum;
  printf("Enter num1 :");
  scanf("%d",&num1);
  printf("\nEnter num2 :");
  scanf("%d",&num2);
  sum = num1+num2;
  printf("\nSum = %d",sum);

  return 0;
}