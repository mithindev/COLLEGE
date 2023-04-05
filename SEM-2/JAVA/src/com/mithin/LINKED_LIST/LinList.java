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

    public void insertRec (int val, int index) {
        Node temp = head;
        if (index - 1 == 0) {
            Node node = new Node(val);
            node.next = temp.next;
            temp.next = node;
        } else {
            
        }
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
