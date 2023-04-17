package com.mithin.OOPS_DEMO.INHERITANCE;

public class Student extends Person{
    int grade;
    String school;

    public Student (String name, int age, int grade, String school) {
        super(name, age);

        this.grade = grade;
        this.school = school;
    }

    public void info () {
        super.speak();

        System.out.println(name + " , " + age + " , " + grade + " , " + school);
    }
}
