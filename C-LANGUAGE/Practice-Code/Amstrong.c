#include <stdio.h>


int isAmstrong (int num);
int count(int num);
int isprime(int num);

void main() {
  int num;
  printf("Enter the num to check :");
  scanf("%d",&num);
  if (isprime(num) == 1) {
    printf("Number is prime");
  }
  else if (isAmstrong(num) == 1) {
    printf("Number is Amstrong")
  }

}

int isPerfect (int num) {
  for (int i = 1;i*i < num;i++) {
    if (i*i == num) {
      return 1;
    }
  }
  return 0;
}

int isprime(int num) {
  for (int i = 2;i*i < num;i++){
    if (num%i == 0) {
      return 0;
    }
  }
  return 1;
}

int isAmstrong (int num) {
  int x = num;
  int c = count(num);
  int sum = 0;
  while (x > 0) {
    int temp = x%10;
    sum += temp*temp*temp;
    x = x/10;
  }
  if (sum == num) {
    return 1;
  } else {
    return 0;
  }
}

int count(int num) {
  int ans = 0;
  while (num > 0) {
    ans += 1;
    num = num/10;
  }
  return num;
}