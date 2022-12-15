#include <stdio.h>

// FOR-LOOP
// Q13.  Write a program in C to display the n terms of odd natural number and their sum.

int Sum(int num);
void main() {
  int num, sum;
  printf("Enter num :");
  scanf("%d", &num);
  for (int i = 1;i <= num; i++) {
    if (i%2 == 1){
      printf("%d, ", i);
    }
  }
  sum = Sum(num);
  printf("\nThe sum is :%d", sum);
}

int Sum(int num) {
  int sum = 0;
  for (int i = 1;i <= num; i++) {
    if (i%2 == 1){
      sum = sum + i;
    }
    
  }
  return sum;
}