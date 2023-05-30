package com.mithin.DATA_STRUCTURES.LINKED_LIST.LL;

public class LL {

    class Node {
        int data;
        Node next;

        Node(int val) {
            this.data = val;
            this.next = null;
        }

        Node (Node next) {
            this.data = 0;
            this.next = next;
        }
    }

    private Node head;
    private Node tail;
    private int size;

    // Creating the template for node!

    LL () {
        this.size = 0;
    }

    public void display() {
        Node node = head;

        while (node != null) {
            System.out.print(node.data + " -> ");
            node = node.next;
        }

        System.out.println("END");
    }

    // Inserting at the beginning of the LL

    void insertFirst (int val) {
        Node node = new Node(val);

        node.next = head;
        head = node;
    }

    // Inserting at a given index of the LL

    void insert (int val, int index) {
        Node node = new Node(val);

        Node temp = head;

        for (int i = 0; i < index; i++) {
            temp = temp.next;
        }

        node.next = temp.next;
        temp.next = node;
    }

    // Inserting at the end of the LL

    void insertAtEnd (int val) {
        Node node = new Node(val);

        Node temp = head;

        while (temp.next!= null) {
            temp = temp.next;
        }

        temp.next = node;
        node.next = null;

    }
}
