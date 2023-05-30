package com.mithin.OOPS_DEMO.SET1.TEST.SHAPE;

public class Rectangle extends Shape{
    Rectangle(int a, int b) {
        super.a = a;
        super.b = b;
    }

    @Override
    void printArea() {
        System.out.println(a*b);
    }
}
