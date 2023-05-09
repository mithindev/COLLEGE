package com.mithin.OOPS_DEMO.TEST;

import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int[] arr = new int[5];

        for (int i = 0; i < 5; i++) {
            System.out.println("Enter the " + (i+1) + " Element :");
            arr[i] = in.nextInt();
        }
        System.out.println("Initial :" + Arrays.toString(arr));

//        int[] arr = {1, 2, 3, 4, 5};

        System.out.println("Enter n :");
        int n = in.nextInt();

        int[] ans = rotate(arr, 3);
        System.out.println("Rotated :" + Arrays.toString(ans));

        System.out.println("Enter Element to Search :");
        int target = in.nextInt();

        int p = position(arr, 5);
        System.out.println("Position :" + p);

        printEven(arr);

    }

    // Qn-1

    static int[] rotate (int[] arr, int n) {
        int[] ans = new int[5];

        if (n == 0) {
            return arr;
        }

        for (int i = n - 1, j = 0; i < 5; i++) {
            ans[j++] = arr[i];

        }

        for (int i = 0, j = n - 1; i < n; i++) {
            ans[j] = arr[i];
            j++;
        }
        return ans;
    }

    //Qn-2

    static int position (int[] arr, int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                return i;
            }
        }
        return -99;
    }

    //Qn-3

    static void printEven (int[] arr) {
        System.out.println("Even nos :");
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                System.out.print(arr[i] + ", ");
            }
        }
    }
}
