#include <stdio.h>

// Q13. C Program to take input from the user (circle/ rectangle/ square) and then calculate
// the circumference of the circle/ rectangle/ square according to the user’s choice. (use
// switch case and user-defined functions to calculate area)

float recArea(int l,int b);
float cirArea(int r); 

void main() {
  char shape;
  printf("Enter the polygon (C/S/R) :");
  scanf("%c", &shape);
  switch (shape) {
    case 'S':
      int l, b;
      printf("enter length :");
      scanf("%d",&l);
      printf("enter breadth :");
      scanf("%d",&b);
      float area1 = recArea(l, b);
      printf("Area is :%f sq.units",area1);
      break;
    case 'R':
      int l1, b1;
      printf("enter length :");
      scanf("%d",&l1);
      printf("enter breadth :");
      scanf("%d",&b1);
      float area3 = recArea(l1, b1);
      printf("Area is :%f sq.units",area3);
      break;
    case 'C':
      printf("Enter the radius :");
      int r;
      scanf("%d",&r);
      float area2 = cirArea(r);
      printf("Area is :%f sq.units",area2);
      break;
    default :
      printf("invalid! try again.");
  }

}

float recArea(int l,int b) {
  return l*b;
}

float cirArea(int r) {
  return 3.14*r*r;
}