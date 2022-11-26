#include <stdio.h>

void main() {
  int n1,n2,q,r;
  printf("Enter number :");
  scanf("%d \n",&n1);
  printf("Enter number :");
  scanf("%d",&n2);
  q = n1/n2;
  r = n1%n2;
  printf("qu = %d, rem = %r",q,r);


}