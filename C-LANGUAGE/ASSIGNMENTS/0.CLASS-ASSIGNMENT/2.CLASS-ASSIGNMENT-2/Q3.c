#include <stdio.h>

// Q-3] C Program to sort the entered array in descending order.

void bSort(int arr[], int n);
void main() {
  int arr[] = {1, 2, 3, 4, 5};
  int n = sizeof(arr) / sizeof(arr[0]);
  for (int i = 0; i < n; i++) {
    printf("%d ", arr[i]);
  }
  printf("%c\n", "");
  bSort(arr, n);
  for (int i = 0; i < n; i++){
    printf("%d ", arr[i]);
  }
}

void bSort(int arr[], int n) {
  for (int i = 0; i < n;i++) {
    for (int j = 1; j < n - i; j++) {
      if (arr[j-1] < arr[j]) {
        int temp = arr[j - 1];
        arr[j - 1] = arr[j];
        arr[j] = temp;
      }
      
    }
  }
}