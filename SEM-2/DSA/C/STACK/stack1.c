#include <stdio.h>

#define SIZE = 5; 

int stack[5];
int top = -1;

void push(int val);
int pop();
void display();


void main() {
  push(1);
  push(2);
  push(3);
  push(4);
  push(5);

  display();

  pop();
  display();  

}

void push(int val) {
  if (top >= 4) {
    printf("Stack is Full\n");
    return;
  } else {
    top++;
  }

  stack[top] = val;
}

int pop() {
  if (top == -1) {
    printf("Stack Underflow\n");
    return -1;
  }

  int val = stack[top];
    top--;
    return val;
}

void display() {
  printf("Stack :");
  for (int i = 0; i <= top; i++) {
    printf("%d <- ", stack[i]);
  }
  printf("\n");
}

void peek() {
  if (top == -1) {
    printf("\nStack Underflow");
  } else {
    printf("Top : %d", stack[top]);
  }
}