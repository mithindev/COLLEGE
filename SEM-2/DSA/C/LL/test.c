#include<stdio.h>
#include<stdlib.h>

struct Node
{
  int data;
  struct Node *next;
};


void insertStart(struct Node **head, int data)
{

  // dynamically create memory for this newNode
  struct Node *newNode = (struct Node *) malloc (sizeof (struct Node));

  // assign data value
  newNode->data = data;
  // change the next node of this newNode 
  // to current head of Linked List
  newNode->next = *head;

  //re-assign head to this newNode
  *head = newNode;
  printf ("\n%d Inserted\n", newNode->data);
}

void deletepos(struct Node **head, int pos)
{
    struct Node *temp = *head; // Creating a temporary variable pointing to head
    int i;

    if (pos == 1) 
   {
        printf("\nElement deleted is : %d\n", temp->data);
        *head = (*head)->next; // move head to next node
	  temp->next = NULL;
	  free(temp);
    }
    else 
    {
        for (i = 1; i < pos - 1 ; i++) 
			temp = temp->next;
        
        // Now temp pointer points to the previous node of the node to be deleted
        
        struct Node *del = temp->next; // del pointer points to the node
             
        temp->next = del->next; // temp is pointing its next to next pointer
   
        printf("\nElement deleted is : %d\n", del->data);
        del->next = NULL;
        free(del); // Node is deleted
    }
    
    
}

void reverse(struct Node** head_ref)
{
    struct Node* prev = NULL;
    struct Node* current = *head_ref;
    struct Node* next = NULL;
    while (current != NULL) {
        // Store next
        next = current->next;
 
        // Reverse current node's pointer
        current->next = prev;
 
        // Move pointers one position ahead.
        prev = current;
        current = next;
    }
    *head_ref = prev;
}



void display(struct Node *node)
{
  printf ("\nLinked List: ");

  // as linked list will end when Node is Null
  while (node != NULL)
    {
      printf ("%d ", node->data);
      node = node->next;
    }
  printf ("\n");
}

int main ()
{
     int option = 0, input_data, pos;
     struct Node *head = NULL;

     while(option < 5) 
	{

  		printf("\nOptions\n");
    		printf("1 : Insert into Linked List at first\n");
    		printf("2 : Delete from Linked List by position\n");
   		printf("3 : Display Linked List\n");
    		printf("4 : Reverse Linked List\n");
   		printf("Others : Exit()\n");
    		printf("Enter your option:");
    		scanf("%d", &option);
    		switch (option) 
		{
      		case 1:
				printf("Enter the value:\n");
  				scanf("%d",&input_data);
       			insertStart(&head, input_data);
        			break;
      		case 2:
				printf("Enter the position:\n");
  				scanf("%d",&pos);
				deletepos(&head, pos);
       			break;
     			case 3:
    			      display(head);
      			break;
      		case 4:
				reverse(&head);
        			break;
      		default:
				 exit(0);
       			 break;
    		}
 
	}
  return 0;
}