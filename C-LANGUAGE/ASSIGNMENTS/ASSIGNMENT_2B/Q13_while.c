#include <stdio.h>

// WHILE-LOOP
// Q13.  Write a program in C to display the n terms of odd natural number and their sum.

int Sum(int num);
void main() {
  int num, sum;
  printf("Enter num :");
  scanf("%d", &num);
  int i = 1;
  while (i <= num) {
    if (i%2 == 1){
      printf("%d, ", i);
    }
    i++;
  }
  sum = Sum(num);
  printf("\nThe sum is :%d", sum);
}

int Sum(int num) {
  int sum = 0;
  int j = 1;
  while (j <= num) {
    if (j%2 == 1){
      sum = sum + j;
    }
    j++;
    }
  return sum;
}