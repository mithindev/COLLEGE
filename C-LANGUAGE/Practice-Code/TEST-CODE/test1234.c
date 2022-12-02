#include <stdio.h>

void main(){
  int num;
  printf("Enter the number :");
  scanf("%d", &num);
  switch (num > 0) {
    case 1 :
      pirntf("%d is positive", num);
      break;
    case 0 :
      switch (num<0) {
        case 1:
          printf("%d is negative",num);
          break;
        case 0:
          printf("%d is equal to 0", num);
          break;
      }
      break;
  }
}