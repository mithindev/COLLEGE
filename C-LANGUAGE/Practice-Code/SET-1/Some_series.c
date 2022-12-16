#include <stdio.h>
#include <math.h>

int fact(int n);
float root (float num, float i);

void main() {
  printf("Enter n :");
  int n;
  scanf("%d",&n);
  float sum = 1;
  printf("Enter x :");
  int x;
  scanf("%d",&x);
  for (int i = 2;i < n+1;i++){
    sum += (i*root(x,1/i))/fact(i);
  }
  printf("%f",sum);

}

float root (float num, float i) {
  float ans = pow(num,i);
  return ans;
}

int fact(int n) {
  if (n<2) {
    return 1;
  } else {
    return n*fact(n-1);
  }
}