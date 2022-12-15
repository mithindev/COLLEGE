#include <stdio.h>

// Q-21]C program to create a Simple Calculator using switch case.

void main() {
  int num1,num2;
  char operator;
  printf("operator (+, -, *, /) :");
  scanf("%c", &operator);
  printf("enter number1 :");
  scanf("%d",&num1);
  printf("enter number2 :");
  scanf("%d",&num2);

  switch(operator) {
    case '+':
      printf("Ans = %d", num1 + num2);
      break;

    case '-':
      printf("Ans = %d", num1 - num2);
      break;

    case '/':
      printf("Ans = %d", num1 / num2);
      break;

    case '*':
      printf("Ans = %d", num1 * num2);
      break;
    
    default:
      printf("Invalid operator!");
    }
}