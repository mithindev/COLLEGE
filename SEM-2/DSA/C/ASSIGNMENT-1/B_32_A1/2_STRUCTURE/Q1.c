#include <stdio.h>

//DEFINING STRUCTURE

struct student {
    char name[50];
    int roll_no;
    char address[100];
    int marks[6];
    char elective[50];
};

int main() {

    int ch,n;

    printf("Enter the number of students: ");
    
    scanf("%d",&n);

    // CREATING ARRAY FOR STUDENT STRUCTURE
    
    struct student students[n];

    // READING INFO FROM USER
    for (int i = 0; i < n; i++) {
        printf("\nEnter information for Student %d:\n", i + 1);
        printf("Name: ");
        scanf("%s", students[i].name);
        printf("Roll No: ");
        scanf("%d", &students[i].roll_no);
        printf("Address: ");
        scanf("%s", students[i].address);
        printf("Elective Subject Name: ");
        scanf("%s", students[i].elective);
        printf("Enter marks for 6 subjects:\n");
        for (int j = 0; j < 6; j++) {
            printf("Subject %d: ", j + 1);
            scanf("%d", &students[i].marks[j]);
        }
    }

    // DISPLAY INFORMATION
    printf("\nStudent Information:\n");
    for (int i = 0; i < n; i++) {
        printf("\nName: %s\n", students[i].name);
        printf("Roll No: %d\n", students[i].roll_no);
        printf("Address: %s\n", students[i].address);
        printf("Elective Subject Name: %s\n", students[i].elective);
        printf("Marks:\n");
        for (int j = 0; j < 6; j++) {
            printf("Subject %d: %d\n", j + 1, students[i].marks[j]);
        }
    }

    //3 OPTIONS FOR DISPLAYING ROLL NO.ADDRESS AND 1 SUBJECT MARK

    int exit=0;
    while(exit==0) {

    printf("Enter 1 for displaying roll no\n");
    printf("Enter 2 for displaying address\n");
    printf("Enter 3 for displaying mark of one subject\n");
    printf("Enter 4 for exit\n");

    printf("ENTER THE OPTION :");
    scanf("%d",&ch);

    if (ch==1){

    printf("\nDisplay Roll Numbers:\n\n");
    for (int i = 0; i < n; i++) {
        printf("The roll number of student%d is %d\n", i+1,students[i].roll_no);
    }}

    else if (ch==2){

    printf("\nDisplay address:\n\n");
    for (int i = 0; i < n; i++) {
        printf("The address of student %d is %s\n", i+1,students[i].address);
    }}

    else if (ch==3){

    printf("\nDisplay mark of one subject:\n\n");
    for (int i = 0; i < n; i++) {
        printf("The mark of student %d in 1st subject is %d\n", i+1,students[i].marks[1]);
    }}

    else if (ch==4){
        exit=3;;
    }

    printf("\n");
   }
    return 0;
}