#include <stdio.h>

void Sort(int arr[], int n);

void main() {
  int arr[] = {5, 4, 3, 2, 1};
  int n = sizeof(arr)/sizeof(arr[0]);
  for (int i = 0; i < n; i++) {
    printf("%d",arr[i]);
  }
  Sort(arr, n);
  printf("\n");
  for (int i = 0; i < n; i++) {
    printf("%d ",arr[i]);
  }

}

void Sort(int arr[], int n) {
  
  for (int i = 0;i<n; i++) {
    for (int j = 1; j < n-i;j++) {
      int temp = arr[j-1];
      arr[j-1] = arr[j];
      arr[j] = temp;
    }
  }
}