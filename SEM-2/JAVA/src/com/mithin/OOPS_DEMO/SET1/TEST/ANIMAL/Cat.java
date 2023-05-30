package com.mithin.OOPS_DEMO.SET1.TEST.ANIMAL;

public class Cat extends Animal {

    @Override
    void sound() {
        System.out.println("Cat: Meows");
    }

    Cat() {
        System.out.println("THis is child Class");
    }
}
