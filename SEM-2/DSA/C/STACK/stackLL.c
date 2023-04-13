#include <stdio.h>
#include <stdlib.h>

struct Node {
  int val;
  struct Node *next;
};

int l = 0;

void push(struct Node **head, int val) {
  struct Node *node = (struct Node *) malloc (sizeof (struct Node));

  node->val = val;
  node->next = *head;

  *head = node;
}

void display(struct Node *temp) {
  while (temp != NULL) {
    printf("%d ->", temp -> val);
    temp = temp -> next;
    l += 1;
  }
  printf("END");
}


void pop(struct Node **head) {
  *head = (*head)->next;
}

void main() {
  struct Node *head = NULL;

  push(&head, 3);
  push(&head, 6);
  push(&head, 7);
  push(&head, 1);
  push(&head, 2);
  push(&head, 5);
  push(&head, 10);
  display(head);
  printf("\n");

  pop(&head);
  display(head);
  printf("\n");

}