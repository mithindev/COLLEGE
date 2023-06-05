package com.mithin.GENERAL;

public class Main1 {
    public static void main(String[] args) {
        try {
            System.out.println("Before!!");
            throw new ArithmeticException();
        } catch (ArithmeticException e) {
            System.out.println("Caught!!");
        }
    }
}
