#include <stdio.h>
#include <math.h>

// Q-14]Write a program in C to display the sum of n terms of the series[9+99+999+9999+···].

// Formula used :(10/9)*(10^n - 1) - n

int number(int n);

void main() {
  printf("Enter a number :");
  int num, sum;
  scanf("%d", &num);
  int var;
  sum = 0;

  int i = 1;
  while ( i <= num )  {
    var = number(i);
    printf("%d, ", var);
    i++;
  }
  int j = 1;
  while (i <= num )
  {
    sum = sum + number(i);
  }
  printf("\n%d is the sum!", sum);
  j++;
}

int number(int n) {
  int sum = 0;
  int var1;
  int var2;
  int k = 0;
  while (k < n) {
    var1 = pow(10, k);
    var2 = 9 * var1;
    sum += var2;
    k++;
  }
  return sum;
}