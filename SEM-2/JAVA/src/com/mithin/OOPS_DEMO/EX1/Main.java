package com.mithin.OOPS_DEMO.EX1;

import com.mithin.OOPS_DEMO.EX1.Student;

public class Main {
    public static void main(String[] args) {
        Student s1 = new Student();
        s1.name = "Mithin Dev A";
        s1.age = 18;
        s1.getInfo();

        Student s2 = new Student();
        s2.name = "Noah";
        s2.age = 18;
        s2.getInfo();
    }
}
