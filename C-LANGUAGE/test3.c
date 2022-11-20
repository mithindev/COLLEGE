#include <stdio.h>

int main() {
  // char var_name;
  // printf("enter a character :");
  // scanf("%c", &var_name);

  // double ch;
  // printf("enter a ch to get its ASCII :");
  // scanf("%1f \n", &ch);
  // printf("value :%1f", ch);

  int a;
  float b;
  printf("Enter numbers a, b :");
  // printf("\b"); // it adds a backsace

  scanf("%d%f", &a, &b);
  printf("You entered %d and %f", a, b);

  printf("\b");

  return 0;
}