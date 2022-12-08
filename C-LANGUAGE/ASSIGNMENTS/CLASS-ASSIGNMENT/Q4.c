#include <stdio.h>


// QUESTION-4]C Program to take input from the user (circle/ rectangle/ square)
// and then calculate the area of circle/ rectangle/ square according
// to the users choice. (use switch case and user defined functions
// to calculate area)

int area_r_s(int s1, int s2);

float area_circle(int r);

void main() {
  char shape;
  printf("Enter the shape :");
  scanf("%c", &shape);

  switch (shape) {
    case 'S':
      int s1, s2, ans1;
      printf("Enter Side1 :");
      scanf("%d",&s1);
      printf("Enter Side2 :");
      scanf("%d",&s2);
      ans1 = area_r_s(s1, s2);
      printf("Area = %d", ans1);
      break;
    
    case 'R':
      int side1, side2, ans2;
      printf("Enter Side1 :");
      scanf("%d",&side1);
      printf("Enter Side2 :");
      scanf("%d",&side2);
      ans2 = area_r_s(side1, side2);
      printf("Area = %d", ans2);
      break;
    
    case 'C':
      int radius;
      printf("Enter radius :");
      scanf("%d",&radius);
      float ans3 = area_circle(radius);
      printf("Area = %f", ans3);
  }

}


int area_r_s(int s1, int s2) {
  return s1*s2;
}

float area_circle(int r) {
  return 3.14*r*r;
}