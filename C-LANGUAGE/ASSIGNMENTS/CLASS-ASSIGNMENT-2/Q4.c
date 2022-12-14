#include <stdio.h>

// Q-4C Program to display the largest and second largest elements in a user-entered array.

void bSort(int arr[], int n);

void main() {
  int n;
  printf("Enter the number of elements :");
  scanf ("%d", &n);
  int arr[n];
  for (int i = 0; i < n; i++){
    scanf ("%d", &arr[i]);
  }
  for (int j = 0; j < n; j++){
    printf("%d ", arr[j]);
  }
  bSort(arr,n);
  printf("\nLargent element is :%d\n",arr[n-1]);
  printf("Second Largent element is :%d",arr[n-2]);
}

void bSort(int arr[], int n) {
  for (int i = 0; i < n;i++) {
    for (int j = 1; j < n - i; j++) {
      if (arr[j-1] > arr[j]) {
        int temp = arr[j - 1];
        arr[j - 1] = arr[j];
        arr[j] = temp;
      }
      
    }
  }
}

