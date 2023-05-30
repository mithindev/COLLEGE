package com.mithin.OOPS_DEMO.SET1.TEST.THIS;

public class Shape {
    int l, b, area;

    Shape(int l, int b) {
        this.l = l;
        this.b = b;
        area = 1;
    }

    Shape() {

    }

    void area() {
        area = l * b;
        System.out.println("Area :" + area);
    }
}
