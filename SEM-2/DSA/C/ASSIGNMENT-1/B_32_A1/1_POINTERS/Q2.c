#include<stdio.h>

int Sum(int *a, int *b){
    return *a + *b;
}

int main() {

    int num1, num2;
    printf ("Enter two numbers: ");
    scanf ("%d%d",&num1,&num2);
    int sum = Sum (&num1, &num2);
    
    printf("The sum is %d",sum);
}