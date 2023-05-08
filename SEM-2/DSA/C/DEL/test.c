#include <stdio.h>
#include <string.h>

struct person {
    char name[50];
    int age;
    float height;
};

void main () {
    struct person p1;

    strcpy(p1.name, "mithin");
    p1.age = 19;
    p1.height = 2;

    printf("Name: %s\n", p1.name);
    printf("Age: %d\n", p1.age);
    printf("Height: %f\n", p1.height);
}