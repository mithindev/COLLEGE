package com.mithin.OOPS_DEMO.SET2.SAMPLE1;

import java.util.Scanner;

public class Q5 {
    int[][] matrix;
    int n;

    Q5 (int size) {
        this.n = size;
        matrix = new int[n][n];
    }

    public void read() {
        Scanner in = new Scanner(System.in);

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("Enter element at" + (i + 1) + ", " + (j + 1) + ":");
                matrix[i][j] = in.nextInt();
            }
        }
    }

    public void readMatrixFromUser() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the matrix elements:");

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("Enter element at position (" + (i + 1) + ", " + (j + 1) + "): ");
                matrix[i][j] = scanner.nextInt();
            }
        }
    }

//    int diagsum
}
