package com.mithin.OOPS_DEMO.SET1.TEST.HUMAN;

public class Student extends Human{

    int age;
    Student() {
        age = 28;
        super.name = "mithin";
        System.out.println("Child");
    }

    void display() {
        System.out.println(this.name + this.age);
    }

}
