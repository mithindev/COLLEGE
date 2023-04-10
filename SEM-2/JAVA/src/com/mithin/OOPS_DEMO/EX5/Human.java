package com.mithin.OOPS_DEMO.EX5;

public class Human {
    final int nose = 1;
    final int legs = 2;

    private String gender;

    public void setGender (String g) {
        this.gender = g;
    }

    public void getGender () {
        System.out.println(this.gender);
    }
}
