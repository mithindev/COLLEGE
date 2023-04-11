package com.mithin.OOPS_DEMO.SET1.EX1.EX4;

public class Car {
    int year;
    String model;
    String make;

    public Car(int year, String model, String make) {
        this.year = year;
        this.model = model;
        this.make = make;
    }

    Car(int year, String model) {
        this.year = year;
        this.model = model;
    }

    public Car(int year) {
        this.year = year;
    }

    void disp () {
        System.out.println(this.year);
        System.out.println(this.model);
        System.out.println(this.make);
    }
}
