package com.Mithin.OOPS;

public class Person extends Human {
    String name;
    String Job;

    public Person() {
        this.intro(null, null);
    }


    public Person(String name) {
        this.name = name;
    }

    public Person(String name, String job) {
        this.name = name;
        Job = job;
    }

    void intro (String name, String job) {
        System.out.println("My name is " + name + "and my job is " + job);
    }
}
