package com.mithin.OOPS_DEMO.SET2.SAMPLE1.Q1toQ7;

import java.util.Scanner;

public class Q4 {
    double a;
    double b;
    char operation;

    public Q4(double a, double b, char operation) {
        this.a = a;
        this.b = b;
        this.operation = operation;
    }

    void add() {
        System.out.println(a + b);
    }
    void subtract() {
        System.out.println(a - b);
    }
    void divide() {
        System.out.println(a/b);
    }
    void multiply() {
        System.out.println(a*b);
    }
}

class fi {
    public static void main(String[] args) {
        double num1, num2;
        char operation;

        Scanner in = new Scanner(System.in);

        System.out.println("Enter number 1 :");
        num1 = in.nextDouble();

        System.out.println("Enter number 2 :");
        num2 = in.nextDouble();

        System.out.println("Enter the operation :");
        operation = in.next().charAt(0);

        Q4 calculator = new Q4(num1, num2, operation);

        switch (operation) {
            case '+':
                calculator.add();
                break;
            case '-':
                calculator.subtract();
                break;
            case '/':
                calculator.divide();
                break;
            case '*':
                calculator.multiply();
                break;
            default:
                System.out.println("Invalid operator.");
        }
        in.close();
    }
}
