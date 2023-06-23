package com.mithin.GENERAL;

public class MAin implements Runnable{

    public static void main(String[] args) {
        MAin obj = new MAin();

        Thread thread = new Thread(obj);

        thread.run();
        System.out.println("Inside main");
    }

    @Override
    public void run() {
        System.out.println("running from thread");
    }

}
