package com.mithin.OOPS_DEMO.SET1.SET.SET2.SAMPLE1.Q9;

import java.util.Arrays;

public class H3 extends XMA{
    String HR;
    static String[] department;

    H3 (String chairperson, String HR, String[] departments) {
        super(chairperson);
        this.HR = HR;

        department = departments;
    }

    static void display() {
        System.out.println(Arrays.toString(department));
    }
}
