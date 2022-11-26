#include <stdio.h>

// Q-7]C program to enter radius of a circle and find its diameter,circumference and area.

int main() {
  float radius,diameter,circumference,area;
  printf("Enter radius :");
  scanf("%f",&radius);
  diameter = 2*radius;
  circumference = 3.14*diameter;
  area=3.14*radius*radius;
  printf("Diameter = %f,circumference = %f, area = %f",diameter,circumference,area);

  return 0;
}
