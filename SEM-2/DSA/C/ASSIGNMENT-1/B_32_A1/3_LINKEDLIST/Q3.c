#include <stdio.h>
#include <stdlib.h>

struct node {
    int coeff;
    int exp;
    struct node *next;
};

typedef struct node NODE;

NODE *create_poly(NODE *head, int coeff, int exp) {
    NODE *ptr, *new_node;
    new_node = (NODE *) malloc(sizeof(NODE));
    new_node->coeff = coeff;
    new_node->exp = exp;
    new_node->next = NULL;
    if (head == NULL) {
        head = new_node;
        return head;
    }
    ptr = head;
    while (ptr->next != NULL)
        ptr = ptr->next;
    ptr->next = new_node;
    return head;
}

void display_poly(NODE *head) {
    NODE *ptr;
    ptr = head;
    while (ptr != NULL) {
        printf("%dx^%d", ptr->coeff, ptr->exp);
        ptr = ptr->next;
        if (ptr != NULL)
            printf(" + ");
    }
}

NODE *add_poly(NODE *head1, NODE *head2) {
    NODE *ptr1, *ptr2, *head3;
    int coeff3, exp3;
    head3 = NULL;
    ptr1 = head1;
    while (ptr1 != NULL) {
        ptr2 = head2;
        while (ptr2 != NULL) {
            if (ptr1->exp == ptr2->exp) {
                coeff3 = ptr1->coeff + ptr2->coeff;
                exp3 = ptr1->exp;
                head3 = create_poly(head3, coeff3, exp3);
            }
            ptr2 = ptr2->next;
        }
        ptr1 = ptr1->next;
    }
    ptr1 = head1;
    while (ptr1 != NULL) {
        int flag = 0;
        ptr2 = head2;
        while (ptr2 != NULL) {
            if (ptr1->exp == ptr2->exp) {
                flag = 1;
                break;
            }
            ptr2 = ptr2->next;
        }
        if (flag == 0) {
            head3 = create_poly(head3, ptr1->coeff, ptr1->exp);
        }
        ptr1 = ptr1->next;
    }
    ptr2 = head2;
    while (ptr2 != NULL) {
        int flag = 0;
        ptr1 = head1;
        while (ptr1 != NULL) {
            if (ptr2->exp == ptr1->exp) {
                flag = 1;
                break;
            }
            ptr1 = ptr1->next;
        }
        if (flag == 0) {
            head3 = create_poly(head3, ptr2->coeff, ptr2->exp);
        }
        ptr2 = ptr2->next;
    }
    return head3;
}

int main() {
    NODE *head1, *head2, *head3;
    head1 = NULL;
    head2 = NULL;
    head3 = NULL;
    int x, y;
    int f1 = 1, f2 = 1;
    while(f1 == 1){
     printf("Enter the coefficient followed by the power :");
     scanf("%d %d",&x, &y);
     head1 = create_poly(head1, x, y);
     printf("Enter 1 if you want to add more terms to the first polynomial : ");
     scanf("%d",&f1);
    }
    while(f2 == 1){
     printf("Enter the coefficient followed by the power :");
     scanf("%d %d",&x, &y);
     head2 = create_poly(head2, x, y);
     printf("Enter 1 if you want to add more terms to the second polynomial : ");
     scanf("%d", &f2);
    }
    printf("First polynomial: ");
    display_poly(head1);
    printf("\nSecond polynomial: ");
    display_poly(head2);
    head3 = add_poly(head1, head2);
    printf("\nResultant polynomial: ");
    display_poly(head3);
    return 0;
}
