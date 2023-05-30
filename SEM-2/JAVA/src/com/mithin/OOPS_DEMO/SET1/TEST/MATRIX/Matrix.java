package com.mithin.OOPS_DEMO.SET1.TEST.MATRIX;

import java.util.Scanner;

public class Matrix {
    int m;
    int n;

    Scanner in = new Scanner(System.in);

    int[][] matrix;

    Matrix (int m, int n) {
        this.m = m;
        this.n = n;

        this.matrix = new int[m][n];
    }

    void read() {
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("Enter value :");
                matrix[i][j] = in.nextInt();
            }
        }
    }

    void display() {
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print(matrix[i][j] + ", ");
            }
            System.out.println();
        }
    }

}
