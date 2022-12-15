#include <stdio.h>

void main() {
  int n = 5;
  int arr[];
  for (int i = 0; i < n; i++) {
    scanf("%d",&arr[i]);
  }
  for (int i = 0; i < n; i++) {
    printf("%d",arr[i]);
  }
}