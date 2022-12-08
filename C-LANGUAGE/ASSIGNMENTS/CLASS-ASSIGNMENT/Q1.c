#include <stdio.h>


// QUESTION-1]C Program to check whether a number can be expressed as the
// sum of two prime numbers.(use user defined functions to find the
// sum and check whether prime or not .)

int prime();

void main() { 

  printf("Enter the number you wanna check :");
  int num;
  scanf("%d", &num);

  for (int i = 2; i*i  < num; i++) {
        if (prime(i) + prime(num-i) == 2) {
          printf("Yes it can be expressed as the sum of two prime numbers. ");
          printf("The primes are %d and %d", i, num-i);
        }    
    
    }

    int a = prime(9);
    printf("%d", a);
}

int prime(int num) {
  // if (num < 2) {
  //     return 0;
  // }
  // for (int i = 2; i * i <= num; i++) {
  //   if (num%i == 0) {
  //     return 0;      
  //   }
  // }
  // return 1;
  if (num <= 1) {
    return 0;
  }

  int c = 2;

  while (c * c <= num){
    if (num % c == 0)
    {
      return 0;
    }
    c++;
  }
  return 1;
}
