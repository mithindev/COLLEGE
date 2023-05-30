package com.mithin.OOPS_DEMO.SET1.TEST.COMPLEX;

public class Complex {
    int real;
    int complex;

    Complex() {

    }

    Complex(int real, int complex) {
        this.real = real;
        this.complex = complex;
    }

    void add(Complex c1, Complex c2) {
        System.out.println((c1.real + c2.real) + " + " + (c1.complex + c2.complex) + "i");
    }

}
