package com.mithin.OOPS_DEMO.SET.SET1.EX1.EX4;

public class Shape {
    int length;
    int breadth;
    int area;

    Shape(int length, int breadth) {
        this.length = length;
        this.breadth = breadth;
        area = 1;
    }

    void area() {
        area = length * breadth;
        System.out.println("Area is :" + area);
    }
}
