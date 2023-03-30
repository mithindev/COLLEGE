package com.mithin.LINKED_LIST;

public class LinList {

    private Node head;
    private Node tail;
    private int size;

    LinList() {
        this.size = 0;
    }

    // Insert first;
    void insertFirst(int val) {
        Node node = new Node(val);
        node.next = head;
        head = node;

        if (tail == null) {
            tail = head;
        }
        size ++;

    }

    // Display
    void display() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.value + " -> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }


    private class Node {
        private int value;
        private Node next;

        Node (int value) {
            this.value = value;
        }
        Node (Node next) {
            this.next = next;
        }
    }
}
