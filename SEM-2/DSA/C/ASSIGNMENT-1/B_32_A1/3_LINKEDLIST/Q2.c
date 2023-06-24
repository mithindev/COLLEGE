#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

void insertLast(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }

    struct Node* temp = *head;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = newNode;
}

void swap(struct Node** head) {

    //Largest
    struct Node* prevLargest = NULL;
    struct Node* largest = *head;
    struct Node* curr = *head;
    while (curr->next != NULL) {
        if (curr->next->data > largest->data) {
            prevLargest = curr;
            largest = curr->next;
        }
        curr = curr->next;
    }

    //Smallest
    struct Node* prevSmallest = NULL;
    struct Node* smallest = *head;
    curr = *head;
    while (curr->next != NULL) {
        if (curr->next->data < smallest->data) {
            prevSmallest = curr;
            smallest = curr->next;
        }
        curr = curr->next;
    }

    if (prevLargest != NULL)
        prevLargest->next = smallest;
    else
        *head = smallest;
    if (prevSmallest != NULL)
        prevSmallest->next = largest;
    else
        *head = largest;
    struct Node* temp = largest->next;
    largest->next = smallest->next;
    smallest->next = temp;
}

void displayList(struct Node* head) {
    struct Node* temp = head;
    while (temp != NULL) {
        printf("%d ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

void freeList(struct Node* head) {
    struct Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    struct Node* head = NULL;

    insertLast(&head, 10);
    insertLast(&head, 20);
    insertLast(&head, 30);
    insertLast(&head, 40);
    insertLast(&head, 50);

    printf("Original: ");
    displayList(head);

    swap(&head);

    printf("Modified: ");
    displayList(head);

    freeList(head);

    return 0;
}
