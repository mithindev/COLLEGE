#include <stdio.h>

// Q-1]C Program to find the average of n numbers using arrays

void main() {
  int n;
  
  printf("Enter the number of elements :");
  scanf ("%d", &n);
  float arr[n];

  for (int j = 0; j < n; j++){
    scanf("%f", &arr[j]);
  }
  
  float sum = 0;
  
  for (int i = 0; i < n; i++) {
    sum += arr[i];
  }
  float ans = sum/n;

  printf("%f", ans);
}