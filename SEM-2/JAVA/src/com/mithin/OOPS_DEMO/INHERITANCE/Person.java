package com.mithin.OOPS_DEMO.INHERITANCE;

public class Person {
    protected String name;
    protected int age;

//    public Person() {
//
//    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    void speak () {
        System.out.println("Hello, my name is " + name + " and I'm " + age + " years old.");
    }
}
