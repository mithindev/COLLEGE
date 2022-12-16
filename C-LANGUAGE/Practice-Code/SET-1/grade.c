#include <stdio.h>

void main() {
  int marks;
  printf("Enter your marks :");
  scanf("%d", &marks);
  if (marks > 100) {
    printf("Invalid Marks!");
  }
  else if (marks > 40) {
    printf("Passed!/n");
    if (marks > 80) {
      printf("Grade is A! \n");
    }
    else if (marks >= 60) {
      printf("Grade is B! \n");
    }
    else if (marks >= 40)
    {
      printf("Grade is C! \n");
    }
  }
  else {
    printf("Failed !/n");
    printf("Grade is D");
  }
}