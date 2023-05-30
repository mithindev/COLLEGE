package com.mithin.DATA_STRUCTURES.QUEUE;

public class CustomQueueArray {
    private int[] data;

    static final int DEFAULT_SIZE = 10;

    private int front;
    private int end;
    private int size;
    CustomQueueArray(int max) {
        this.data = new int[max];

        this.front = 0;
        this.end = -1;
        this.size = 0;
    }

    CustomQueueArray() {
        this(DEFAULT_SIZE);
    }

    public boolean isFull() {
        return size == data.length;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public boolean enQueue(int item) {
        if (isFull()) {
            System.out.println("House Full!!");
            return false;
        }

        end = (end + 1) % data.length;
        data[end] = item;
        size++;
        return true;
    }

    public int deQueue() throws Exception{
        if (isEmpty()) {
            throw new Exception("Queue is Empty!!");
        }

        int removed = data[front];
        front = (front + 1) % data.length;
        size--;

        return removed;
    }

    public void peek() {
        if (isEmpty()) {
            System.out.println("Empty!!");
        } else {
            System.out.println(data[front]);
        }
    }

    public void display() {
        if (isEmpty()) {
            System.out.println("Empty");
            return;
        }
        int i = front;

        do {
            System.out.print(data[i] + " -> ");
            i++;
            i = i % data.length;
        } while (i != end);
        System.out.print("END");
        System.out.println();
    }
}
