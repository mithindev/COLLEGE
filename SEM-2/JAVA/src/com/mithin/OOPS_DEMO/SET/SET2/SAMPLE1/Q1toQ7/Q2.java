package com.mithin.OOPS_DEMO.SET.SET2.SAMPLE1.Q1toQ7;

import java.util.Arrays;
import java.util.Scanner;

public class Q2 {
    public static void main(String[] args) {
        int target = getData();
        int[] arr = {1, 2, 3, 4, 5};

        System.out.println(search(arr, target));
    }

    static int getData() {
        System.out.print("Enter the target :");
        Scanner in = new Scanner(System.in);
        return in.nextInt();
    }

    static boolean search(int[] arr, int target) {
        Arrays.sort(arr);

        int s = 0;
        int e = arr.length - 1;

        while (s <= e) {
            int mid = s + (e - s)/2;

            if (arr[mid] == target) {
                return true;
            }
            if (target < arr[mid]) {
                e = mid - 1;
            } else {
                s = mid + 1;
            }
        }
        return false;
    }
}
