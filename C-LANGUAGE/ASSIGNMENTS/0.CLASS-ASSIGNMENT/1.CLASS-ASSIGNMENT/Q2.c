#include <stdio.h>


// QUESTION-2]C program to find the cube of a number. (use a user defined
// function to function to find the cube).

int cube(int num);

void main() {
  int num, ans;
  printf("Enter a number to cube :");
  scanf("%d", &num);
  ans = cube(num);
  printf("The ans is : %d", ans);

}

int cube(int num) {
  return num*num*num;
}