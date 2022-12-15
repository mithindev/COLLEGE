#include <stdio.h>


// QUESTION-5]C Program to find the sum of first ’n’ natural numbers (use
// recursive function)

void NumTill(int n);

void main() {
  int num;
  printf("Enter the number :");
  scanf("%d", &num);
  NumTill(num);
}

void NumTill(int n) {
  for (int i = 1;i < n+1;i++) {
    printf("%d, ",i);
  }
}