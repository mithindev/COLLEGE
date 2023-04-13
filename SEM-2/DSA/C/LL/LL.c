#include <stdio.h>
#include <stdlib.h>

struct Node {
  int val;
  struct Node *next;
};

int l = 0;

void insertFirst (struct Node **head, int val) {
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

void delNode (struct Node **head, int index) {
  struct Node *temp = *head;
  if (index == 1) {
    *head = (*head) -> next;
  } else {
    for (int i = 0; i < index - 1; i++) {
      temp = temp -> next;
    }
    struct Node *node = temp->next;

    temp -> next = node -> next;
  }
}

// 1]Print mid node

void displayMid(struct Node *node)
{
  int i = 0;

  // as linked list will end when Node is Null
  while (i < l/2)
    {
      node = node->next;
      i++;
    }
    printf ("Mid value :%d", node->val);
  printf ("\n");
}

//2]delete even nodes




void main() {
  struct Node *head = NULL;

  insertFirst(&head, 3);
  insertFirst(&head, 6);
  insertFirst(&head, 7);
  insertFirst(&head, 1);
  insertFirst(&head, 2);
  insertFirst(&head, 5);
  insertFirst(&head, 10);
  display(head);
  printf("\n");
  displayMid(head);
  printf("\n");

  //2]delete even nodes

  for (int i = 0; i < l; i += 2) {
    delNode (&head, i);
  }
  display(head);

}


