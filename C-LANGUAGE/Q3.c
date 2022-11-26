#include <stdio.h>

// Q-3]C Program to multiply and two floating point numbers entered bythe user and display the result.

int main() {
  float num1,num2,product;
  printf("Enter num1 :");
  scanf("%f",&num1);
  printf("\nEnter num2 :");
  scanf("%f",&num2);
  product = num1*num2;
  printf("\nProduct = %f",product);

  return 0;
}