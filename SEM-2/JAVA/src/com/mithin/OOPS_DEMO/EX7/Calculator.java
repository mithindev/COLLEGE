package com.mithin.OOPS_DEMO.EX7;

public class Calculator {
    int a;
    int b;
    int total;

    int result;

    Calculator(int a, int b) {
        this.a = a;
        this.b = b;
    }

    void add() {
        System.out.println(a + b);
    }
    void sub() {
        System.out.println(a - b);
    }
    void div() {
        if (b == 0) {
            System.out.println("0 Error");
        } else {
            System.out.println(a/b);
        }
    }
    void multiply () {
        System.out.println(a * b);
    }
}
