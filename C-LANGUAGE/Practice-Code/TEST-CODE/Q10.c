#include <stdio.h>

// Q-10C program to enter two angles of a triangle and find the thirdangle

int main() {
  float a1,a2,a3;
  printf("Enter first angle :");
  scanf("%f",a1);
  printf("Enter first angle :");
  scanf("%f",a2);
  a3 = 180-(a1+a2);
  printf("The third aqngle is %f",a3);

  return 0;

}
