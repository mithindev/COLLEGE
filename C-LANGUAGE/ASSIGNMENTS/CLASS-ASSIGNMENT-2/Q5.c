#include <stdio.h>


void main() {
  int n;
  char week[7][10] = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
  int temp[7];
  for (int i = 0; i < 7; i++){
    printf("\nEnter the temp of %s :",week[i]);
    scanf ("%d", &temp[i]);
  }
  for (int ans = 0; ans < 7; ans++){
    printf("Temp on %s : %d \n", week[ans], temp[ans]);
  }
}