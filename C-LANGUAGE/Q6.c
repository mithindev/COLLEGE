#include <stdio.h>

// Q-6]C program to enter length and breadth of a rectangle and find itsperimeter and area.

int main() {
  float perimeter,length,breadth,area;
  printf("Enter length :");
  scanf("%f",&length);
  printf("Enter breadth :");
  scanf("%f",&breadth);
  area=length*breadth;
  perimeter=2*(length+breadth);
  printf("\nArea = %f,Perimeter = %f",area,perimeter);

  return 0;

}