package com.mithin.OOPS_DEMO.SET2.SAMPLE1.Q8;

public class Employee extends Member{

    String specilization;
    String deaprtment;

    Employee (String name, int age, long phone, String address, int salary, String specilization, String deaprtment) {
        super(name, age, phone, address, salary);
        this.specilization = specilization;
        this.deaprtment = deaprtment;
    }



}
