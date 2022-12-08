#include <stdio.h>


// QUESTION-6]C Program to find the factorial of ’n’ (use recursive function)

int fact(int n);

void main() {
  int num;
  printf("Enter the number :");
  scanf("%d", &num);
  int ans = fact(num);
  printf("%d", ans);
}

int fact(int n) {
  if ( n < 2) {
    return 1;
  } else {
    return n*fact(n-1);
  }
}