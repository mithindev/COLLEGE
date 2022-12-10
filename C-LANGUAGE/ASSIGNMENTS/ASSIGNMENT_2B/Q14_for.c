#include <stdio.h>
#include <math.h>

// Q-14]Write a program in C to display the sum of n terms of the series[9+99+999+9999+···].

// Formula used :(10/9)*(10^n - 1) - n

int number(int n);

void main()
{
  printf("Enter a number :");
  int num, sum;
  scanf("%d", &num);
  int var;
  sum = 0;

  for (int i = 1; i <= num; i++)
  {
    var = number(i);
    printf("%d, ", var);
  }

  for (int i = 1; i <= num; i++)
  {
    sum = sum + number(i);
  }
  printf("\n%d is the sum!", sum);
}

int number(int n)
{
  int sum = 0;
  int var1;
  int var2;
  for (int i = 0; i < n; i++)
  {
    var1 = pow(10, i);
    var2 = 9 * var1;
    sum += var2;
  }
  return sum;
}
