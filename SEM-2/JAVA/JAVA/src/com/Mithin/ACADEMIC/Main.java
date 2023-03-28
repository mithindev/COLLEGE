package com.Mithin.ACADEMIC;

public class Main {
    public static void main(String[] args) {

        Student mithin = new Student();

        mithin.math = 10;
        mithin.science = 20;
        mithin.name = "Mithin Dev";

        mithin.intro();
        mithin.total();

        System.out.println(mithin.marks);
    }
}
