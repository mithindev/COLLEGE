#include <stdio.h>

void main() {
  char ch,temp = 'A';
  printf("Enter a character :");
  scanf("%c",&ch);
  for (int i = 0; i < 51; i++){
    if (i <= 25) {
      if (ch == 'A' + i)
      {
        printf("Upper Case");
        break;
      }
    } else {
      printf("Lower case");
      break;
      }
    } 
    
}
  
  

