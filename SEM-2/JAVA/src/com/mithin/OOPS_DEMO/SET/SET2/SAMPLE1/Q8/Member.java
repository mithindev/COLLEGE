package com.mithin.OOPS_DEMO.SET.SET2.SAMPLE1.Q8;

public class Member {
    String name;
    int age;
    long phone;
    String address;
    int salary;

    public Member(String name, int age, long phone, String address, int salary) {
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.address = address;
        this.salary = salary;
    }

    void printSalary() {
        System.out.println("Salary of" + this.name + "is :" + this.salary);
    }
}
