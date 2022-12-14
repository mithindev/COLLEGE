#include <stdio.h>

void main() {
  // a 3x3 matrix

  int arr1[][] = {{1, 2, 3},{2, 3, 4},{3, 4, 5}};
  int arr2[][] = {{1, 2, 3},{2, 3, 4},{3, 4, 5}};
  

  int ans[3][3];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      ans[i][j] = arr1[i][j] + arr2[i][j];    
    }
  }
}