package com.Mithin.ACADEMIC;

public class Student {

    String name;
    int math;
    int science;
    int marks;

    void total () {
        this.marks = this.math + this.science;
    }

    void intro () {
        System.out.println("Hi! I am " + this.name);
    }

}
