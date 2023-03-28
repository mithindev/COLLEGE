package com.Mithin.DSA;

import java.util.Scanner;

public class Calc {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Enter the operator :");
        String ch = in.next();
        System.out.print("Num 1:");
        int num1 = in.nextInt();
        System.out.print("Num 2:");
        int num2 = in.nextInt();

        switch (ch) {
            case "+":
                System.out.println("Ans :" + num1+num2);
                break;
            case "-":
                System.out.println("Ans :" + num1  + (-1 * num2));
                break;
            case "*":
                if (num1 == 0 || num2 == 0) {
                    System.out.println("Invalid!");
                } else {
                    System.out.println("Ans :" + num1*num2);
                }
                break;
            case "/":
                if(num2!=0) {
                    System.out.println("Ans :" + num1/num2);
                } else {
                    System.out.println("Invalid!");
                }
                break;
            default:
                System.out.println("Invalid!");
        }
    }

    static int sum (int num) {
        int ans = 0;
        while (num > 0) {
            ans += ans%10;
            ans = ans/10;
        }
        return ans;
    }

}
