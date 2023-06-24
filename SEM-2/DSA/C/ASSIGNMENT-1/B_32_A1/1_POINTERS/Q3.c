#include<stdio.h>

void swap(int *a,int *b);

int main(){
    int num1,num2;

    printf("Enter the numbers : ");
    scanf("%d%d",&num1,&num2);
    
    printf("%d - %d",num1,num2);
    
    swap(&num1,&num2);
    
    printf("\n%d - %d",num1,num2);
}

void swap(int *a,int *b) {
    int temp = *b;
    *b = *a;
    *a = temp;
}