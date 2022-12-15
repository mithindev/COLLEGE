#include <stdio.h>

void main() {
  int arr1[],  arr2[];
  int m,n;
  printf("Enter m :");
  scanf("%d",&m);
  printf("Enter n :");
  scanf("%d",&n);

  for (int i = 0; i < m; i++){
    for (int j = 0;j < n;j++) {
      scanf("%d",arr1[i][j]);
    }
  }

}
