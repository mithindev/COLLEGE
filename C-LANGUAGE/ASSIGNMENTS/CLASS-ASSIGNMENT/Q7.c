#include <stdio.h>


// QUESTION-6] Program to print ’n
// th’ terms of the Fibonacci Sequence.(use
// recursive function).

int fibo(int n);

void main() {
  int num;
  printf("Enter the number :");
  scanf("%d", &num);
  for (int i = 0; i<num+1; i++) {
    int ans = fibo(i);
    printf("%d, ",ans);
  }
  // int ans = fibo(8);
  // printf("%d, ",ans);
}

int fibo(int n) {
  if (n == 0) {
    return 0;
  }
  else if( n == 1 || n == 2 ){
    return 1;
  } else {
    return fibo(n-1) + fibo(n-2);
  }
}