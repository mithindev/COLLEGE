#include <stdio.h>
#include <math.h>


// QUESTION-2]C program to find the power of a number , x^
// y
// (use a user defined
// function to function to find the power).

int power(int x, int y);

void main()
{
  int x, y, ans;
  printf("Base :");
  scanf("%d", &x);
  printf("Power :");
  scanf("%d", &y);
  ans = power(x, y);
  printf("%d", ans);
}

int power(int x, int y) {
  return pow(x, y);
}
