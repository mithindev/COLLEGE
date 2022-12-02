#include <stdio.h>

// Q-11]C Program to check if a number is divisible by 2 or not (withoutusing conditional statements).

void main() {
  int num, b;
  printf("Enter the given number :");
  scanf("%d",&num);
  (num % 2 == 0) ? printf("Even") : printf("Odd");

  // (age >= 18) ? printf("Can Vote") : printf("Cannot Vote");
}