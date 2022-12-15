#include <stdio.h>

// Q14. Write a C program to display Pascal’s triangle. Take the number of rows in the triangle
// as input from the user.
// 1
// 1 1
// 1 2 1
// 1 3 3 1
// 1 4 6 4 1
// Use a user-defined recursive function call to print Pascal’s triangle.

int fact(int n);
void pTriangle(int n);

void main() {
  printf("Enter the no. of rows :");
  int n;
  scanf("%d",&n);
  pTriangle(n);
}

void pTriangle(int n) {
  printf("%d\n",1);
  for (int i = 1;i <= n;i++) {
    for (int j = 0;j <= i;j++){
      int ans = fact(i)/(fact(j)*fact(i-j));
      printf("%d ",ans);
    }
    printf("\n");
  }
}

int fact(int n) {
  if (n < 2) {
    return 1;
  } 
  return n*fact(n-1);
}