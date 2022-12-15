#include <stdio.h>

// Q-19]C program to input the angles of a triangle and check whether the triangle is valid or not.

void main() {
  int a1,a2,a3;
  printf("enter angle1 in degrees :");
  scanf("%d",&a1);
  printf("enter angle2 in degrees :");
  scanf("%d",&a2);
  printf("enter angle3 in degrees :");
  scanf("%d",&a3);
  if (a1+a2+a3 == 180) {
    printf("The triangle is valid");  
  } else {
    printf("The triangle is invalid");
  }
}