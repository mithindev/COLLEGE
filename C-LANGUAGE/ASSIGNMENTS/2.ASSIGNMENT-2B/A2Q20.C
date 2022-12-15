#include <stdio.h>

/*
Q-20]C program to input marks of five subjects Physics, Chemistry, Biology, Mathematics,
and Computer. Calculate the percentage in each subject, total marks, total marks in
percentage, and grade according to the following:
– Maximum marks = 50 for each subject
– Percentage ≥ 90% : Grade A
– Percentage ≥ 80% : Grade B
– Percentage ≥ 70% : Grade C
– Percentage ≥ 60% : Grade D
– Percentage ≥ 40% : Grade E
– Percentage < 40% : Grade F
*/

void main() {
  int p, c, b, m,cs;
  int p1,p2,p3,p4,p5;

  printf("Enter Physics Mark :");
  scanf("%d",&p);
  printf("Enter Chemistry Mark :");
  scanf("%d",&c);
  printf("Enter Biology Mark :");
  scanf("%d",&b);
  printf("Enter Math Mark :");
  scanf("%d",&m);
  printf("Enter Computer Mark :");
  scanf("%d",&cs);

  p1 = p;
  printf("Percentage in physics is :%d\n", p1);
  p2 = c;
  printf("Percentage in chemistry is :%d\n", p2);
  p3 = b;
  printf("Percentage in biology is :%d\n", p3);
  p4 = m;
  printf("Percentage in Math is :%d\n", p4);
  p5 = cs;
  printf("Percentage in cs is :%d\n", p5);

  int total_marks = p + c + b + m + cs;
  printf("Total marks is :%d\n", total_marks);

  float percentage = total_marks / 5;

  printf("Total percentage is :%f\n", percentage);

  if (percentage>90){
    printf("Grade A!");
  }
  else if (percentage >= 90)
  {
    printf("Grade A!");
  }
  else if (percentage >= 80)
  {
    printf("Grade B!");
  }
  else if (percentage >= 70)
  {
    printf("Grade C!");
  }
  else if (percentage >= 60)
  {
    printf("Grade D!");
  }
  else if (percentage >= 40)
  {
    printf("Grade E!");
  } else {
    printf("Grade F!");
  }
  
}