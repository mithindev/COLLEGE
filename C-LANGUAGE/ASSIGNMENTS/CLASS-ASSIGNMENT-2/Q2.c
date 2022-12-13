#include <stdio.h>

int length(int arr[]);
void bSort(int arr[]);

void main(){
  int arr[] = {5, 4, 3, 2, 1};
  bSort(arr);
}

void bSort(int arr[]) {

  for (int i = 0; i < length(arr); i++) {
    for (int j = 1; j < length(arr); j ++ ){
      if (arr[j-1] > arr[j]) {
        int temp = arr[j-1];
        arr[j-1] = arr[j];
        arr[j] = temp;
      }
    }
  }

}

int length (int arr[]) {
  return (sizeof(arr) / sizeof(arr[0]));
}
