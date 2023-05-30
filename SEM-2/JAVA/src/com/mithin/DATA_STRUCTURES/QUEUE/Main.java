package com.mithin.DATA_STRUCTURES.QUEUE;

public class Main {
    public static void main(String[] args) throws Exception {
        CustomQueueArray Q = new CustomQueueArray(5);

        Q.display();

        Q.enQueue(1);
        Q.enQueue(1);

        Q.enQueue(1);
        Q.enQueue(1);
        Q.enQueue(1);

        Q.display();

        System.out.println(Q.deQueue());
    }
}
