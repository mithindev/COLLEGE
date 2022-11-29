#include <stdio.h>

// Q-9]C Program to swap two numbers.

void main()
{
  int num1,num2,temp;
  print("Enter a number :");
  scanf("%d",&num1);
  print("Enter a number :");
  scanf("%d",&num2);
  printf("num1 = %d, num2 = %d",num1,num2);
  temp = num1;
  num1 = num2;
  num2 = temp;

  printf("After swapping num1 = %d, num2 = %d",num1,num2);
}