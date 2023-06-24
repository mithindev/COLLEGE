#include <stdio.h>
#include <string.h>

struct state{
    char name[30];
    int population;
    double area;
    char capital[30];
    char lang[20];
}

s[20];

void main() { 
    int i;
    int n;
    
    printf("Total number of states :");

    scanf("%d",&n);
    
    for ( i = 0;i < n;i++){ 
        printf("Enter the name of the state:");
        scanf("%s",&s[i].name);
        printf("Enter the official language:");
        scanf("%s",&s[i].lang);
        printf("Enter the population: ");
        scanf("%d",&s[i].population);
        printf("Enter the capital of state:");
        scanf("%s",&s[i].capital);
        printf("Enter the area in :");
        scanf("%lf",&s[i].area);
        printf("---------------\n");
    }
    char stname[30];
    printf("Enter the name of the state :");
    scanf("%s",&stname);
    for ( i = 0 ; i < n; i++){
        if ( stricmp(stname,s[i].name) == 0){ 
            printf("Name:%s\n",s[i].name);
            printf("Population:%d\n",s[i].population);
            printf("Area :%lf\n",s[i].area);
            printf("Capital:%s\n",s[i].capital);
            printf("Official Language:%s\n",s[i].lang);
        }
    } 
}