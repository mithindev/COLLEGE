#include <stdio.h>
#include <stdlib.h>

struct Node {
  int data;
  struct Node* next;
  struct Node* prev;
};

// Creating a node

struct Node* createNode (int data) {
  struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
  newNode->data = data;
  newNode->next = NULL;
  newNode->prev = NULL;
  return newNode;
}

//Write a function to insert a node at the beginning of the double linked list.

void insertFirst (struct Node** head, int data) {
  struct Node* newNode = createNode(data);
  newNode->next = *head;
  if (*head != NULL) {
    (*head)->prev = newNode;
  } else {
    *head = newNode;
  }
}

//Write a function to insert a node after a given node (value) in the double linked list.

void insertAfterNode(struct Node** head, int data, int val) {
  struct Node* newNode = createNode(data);
  struct Node* temp = *head;

  while (temp != NULL && temp->data != val) {
    temp = temp->next;
  }

  if (temp == NULL) {
    printf("Value Not Found!\n");
    return;
  }

  newNode->next = temp->next;
  newNode->prev = temp;
  
  if (temp->next != NULL) {
        temp->next->prev = newNode;
  }
  temp->next = newNode;
}

//Write a function to delete the last node of the double linked list

void deleteLast(struct Node** head) {
  if (*head == NULL) {
    printf("List is Empty!\n");
    return;
  }

  struct Node* temp = *head;

  while (temp->next != NULL) {
    temp = temp->next;
  }

  temp->prev->next = NULL;
  free(temp);
}

// Write a function to find the length of a linked list and print address of all nodes.

void LengthAndAddresses (struct Node* head) {
  if (head == NULL) {
        printf("List is empty.\n");
        return;
    }

    int length = 0;
    struct Node* temp = head;

     while (temp != NULL) {
        printf("Node %d: Data = %d, Address = %p\n", length + 1, temp->data, temp);
        temp = temp->next;
        length++;
    }

    printf("List Length: %d\n", length);
}

void deleteNode(struct Node** head, struct Node* node) {
  if (*head == NULL || node == NULL) {
        printf("Invalid arguments.\n");
        return;
    }

    if (*head == node) {
      *head = node->next;
    }
    if (node->next != NULL) {
        node->next->prev = node->prev;
    }
    if (node->prev != NULL) {
      node->prev->next = node->next;
    }

    free(node);
}