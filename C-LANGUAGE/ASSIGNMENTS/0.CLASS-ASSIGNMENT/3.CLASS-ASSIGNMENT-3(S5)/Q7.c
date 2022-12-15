#include <stdio.h>

float avg(int arr[], int n);

void main() {
  printf("Enter n :");
  int n;
  scanf("%d",&n);
  int arr[n];
  for (int i = 0; i < n; i++) {
    scanf("%d",&arr[i]);
  }
  float ans = avg(arr, n);
  printf("%f", ans);

}

float avg(int arr[], int n) {
  int sum = 0;
  for (int i = 0; i < n; i++) {
    sum += arr[i];
  }
  float ans = sum/n;
  return ans;
}