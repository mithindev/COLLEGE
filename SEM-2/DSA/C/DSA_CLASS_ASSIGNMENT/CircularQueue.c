#include<stdio.h>

#define MAX 5

int front=-1,rear=-1;
int array[MAX];

void Enqueue(int x){
    if(front==-1){
        front++;
        rear++;
        array[0] = x;
        return;
    }

    if((rear+1)%MAX != front){
    rear = (rear+1)%MAX;
    array[rear] = x;
    }
    else{
        printf("\nERROR : Queue is full.");
    }

}

void Dequeue(){
    if(front==-1){
        printf("\nERROR : Queue is empty.");
        return;
    }
    if(front==rear){
        front = -1;
        rear = -1;
        return;
    }

    front = (front+1)%MAX;
}

void Peek(){
    if(front==-1){
        printf("\nERROR : Queue is empty.");
        return;
    }

    printf("\nThe front element is : %d",array[front]);
}

void Display(){
    printf("\nThe queue is : ");
    
    int i;
    for(i=0;i<MAX;i++){

        int k =0 ;
        if(rear<front){
            if(i<front && i>rear){
                printf(" |");
                k++;
            }
        }
        else if(front<rear){
            if(i<front || i>rear){
                printf(" |");
                k++;
            }
        }
        else{
            if(i != front){
                printf(" |");
                k++;
            }
        }

        if(k==0){
        printf("%d|",array[i]);
        }

    }

        printf("\nFront element : %d",array[front]);
        printf("\nRear element : %d",array[rear]);
}

int main(){

    int query,val;

    for(;;){
            printf("\nEnter the operation to be performed :\n   1)Enqueue\n   2)Dequeue\n   3)Peek\n   4)Display\n   5)Exit\nEnter : ");
            scanf("%d",&query);
        
        switch(query){

            case 1 : printf("\nEnter the number to be Enqueued : ");
                     scanf("%d",&val);
                     Enqueue(val);
                     printf("Enqueued\n");
                     break;

            case 2 : Dequeue();
                     printf("Disqueued\n");
                     break;

            case 3 : Peek();
                     printf("\n");
                     break;
                    
            case 4 : Display();
                     printf("\n");
                     break;

            case 5 : goto label;
                     break;

            default : printf("\nEnter he correct case number.");
        }
    }

    label : 
    printf("");
}