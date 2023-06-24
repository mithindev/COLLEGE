#include <stdio.h>
#include <stdlib.h>

struct Node {
    int row;
    int col;
    int value;
    struct Node* next;
};

void insertAtEnd(struct Node** head_ref, int row, int col, int value) {
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    new_node->row = row;
    new_node->col = col;
    new_node->value = value;
    new_node->next = NULL;
    if (*head_ref == NULL) {
        *head_ref = new_node;
    } else {
        struct Node* current = *head_ref;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = new_node;
    }
}

void displayMatrix(struct Node* head, int rows, int cols) {
    struct Node* current = head;
    int matrix[rows][cols];
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            matrix[i][j] = 0;
        }
    }
    while (current != NULL) {
        matrix[current->row][current->col] = current->value;
        current = current->next;
    }
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int rows, cols, num_non_zero;
    printf("Enter number of rows: ");
    scanf("%d", &rows);
    printf("Enter number of columns: ");
    scanf("%d", &cols);
    printf("Enter number of non-zero entries: ");
    scanf("%d", &num_non_zero);
    struct Node* head = NULL;
    for (int i = 0; i < num_non_zero; i++) {
        int row, col, value;
        printf("Enter row, column, and value of non-zero entry %d: ", i+1);
        scanf("%d %d %d", &row, &col, &value);
        if(row>rows || col>cols || row<0 || col<0){
            printf("Invalid row or column\n");
            break;
        }
        insertAtEnd(&head, row, col, value);
    }
    printf("Sparse matrix:\n");
    displayMatrix(head, rows, cols);
    return 0;
}