#include <stdio.h>
#include <math.h>

int main() {
  int x1,x2,y1,y2,dist;
  printf("Enter x1 :");
  scanf("%d",&x1);
  printf("Enter y1 :");
  scanf("%d",&y1);
  printf("Enter x2 :");
  scanf("%d",&x2);
  printf("Enter y2 :");
  scanf("%d",&y2);

  int p1[] = {x1, y1};
  int p2[] = {x2,y2};

  dist = sqrt(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));
  printf("The distance between the points is :%d units",dist);
}