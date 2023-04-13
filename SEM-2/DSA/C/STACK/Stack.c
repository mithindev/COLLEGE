#include <stdio.h>

int stack[5];
int top = -1;

void push(int item);
int pop();
void display ();

void main() {

    push(1);
    push(2);
    push(3);
    push(4);

    display();
    
    push(1);
    push(2);
    push(3);
    push(4);
    pop()
    display()
   
}


void push(int val) {
  if (top <= 4) {
    top++;
  } else {
    printf("Stack is Full\n");
  }

   stack[top] = val;
}

int pop() {
    if (top < 0) {
        printf("Stack Underflow\n");
        return -1;
    }
    int val = stack[top];
    top--;
    return val;
}

void display () {
  printf("Stack: ");
    int i = 0;
    while (i < 4) {
        int val = pop();
        printf("%d -> ", val);
        i++;
    }
}
