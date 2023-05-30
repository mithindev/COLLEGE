package com.mithin.OOPS_DEMO.SET1.TEST.COMPLEX;

public class Main {
    public static void main(String[] args) {
        Complex c1 = new Complex(1, 2);
        Complex c2 = new Complex(1, 2);

        c1.add(c1, c2);
    }

//    static void add(Complex c1, Complex c2) {
//        System.out.println((c1.real + c2.real) + " + " + (c1.complex + c2.complex) + "i");
//    }


}
