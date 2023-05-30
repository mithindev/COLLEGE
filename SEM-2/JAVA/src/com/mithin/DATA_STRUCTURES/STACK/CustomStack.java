package com.mithin.DATA_STRUCTURES.STACK;

public class CustomStack {
    protected int[] data;
    private static final int DEFAULT_SIZE = 10;

    int ptr  = -1;

    public CustomStack() {
        this(DEFAULT_SIZE);
    }

    public CustomStack(int size) {
        this.data = new int[size];
    }

    public boolean push (int item) {
        if (isFull()) {
            System.out.println("Stack is Full!!");
            return false;
        }

        ptr++;
        data[ptr] = item;
        return true;
    }

    public int pop() {
        if (isEmpty()) {
            System.out.println("Stack is Empty!!");
        }

//        int popped = data[ptr];
//
//        ptr--;
//
//        return popped;

        return data[ptr--];
    }

    public boolean isFull() {
        return ptr == data.length - 1;
    }

    public boolean isEmpty() {
        return ptr == -1;
    }
}
