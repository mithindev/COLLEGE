package com.mithin.OOPS_DEMO.SET.SET2.SAMPLE1.Q8;

public class Manager extends Member{

    String specilization;
    String deaprtment;

    Manager (String name, int age, long phone, String address, int salary, String specilization, String deaprtment) {
        super(name, age, phone, address, salary);
        this.specilization = specilization;
        this.deaprtment = deaprtment;
    }
}
