#include <stdio.h>

// Q-12]C Program to check if a number is even or odd (withoutusing conditional statements).

void main()
{
  int num, b;
  printf("Enter the given number :");
  scanf("%d", &num);
  (num % 2 == 0) ? printf("Even") : printf("Odd");

  // (age >= 18) ? printf("Can Vote") : printf("Cannot Vote");
}