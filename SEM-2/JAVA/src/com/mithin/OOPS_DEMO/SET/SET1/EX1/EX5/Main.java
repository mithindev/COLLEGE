package com.mithin.OOPS_DEMO.SET.SET1.EX1.EX5;


public class Main {
    public static void main(String[] args) {
        Calculator cal = new Calculator(5, 6);

        int num = cal.add(1, 5);
        System.out.println(num);

        Human person = new Human();
        person.setGender("Male");
        person.getGender();
    }
}
