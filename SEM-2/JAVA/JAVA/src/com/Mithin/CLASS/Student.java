package com.Mithin.CLASS;

public class Student extends Person{
    static int Marks = 100;

    static void intro() {
        System.out.println("Hello! I am " + Student.name + "My gender is :" + Student.gender + "My age is : " + Student.age + "My mark is :" + Student.Marks);
    }

    public static void main(String[] args) {
        Student s1 = new Student();
        s1.name = "Mithin Dev";
        s1.age = 18;
        s1.gender = "Male";

        Student.intro();
    }


}
