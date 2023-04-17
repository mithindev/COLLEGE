package com.mithin.LINKED_LIST.TRY1;

public class Double_Lin_List {
    private Node head;

    public void insertFirst (int val) {
        Node node = new Node(val);

        node.next = head;
        node.prev = null;
        if (head != null) {
            head.prev = node;
        }
        head = node;
    }

    public void insertLast (int val) {
        Node node = new Node(val);
        Node temp = head;

        if (head == null) {
            node.prev = null;
            node.next = null;
            head = node;
            return;
        }

        while (temp.next != null) {
            temp = temp.next;
        }

        temp.next = node;
        node.next = null;
        node.prev = temp;
    }

    public void insert (int val, int index) {
        Node node = new Node(val);
        if (index == 1) {
            insertFirst(val);
        }
    }
    public void display() {
        Node node = head;
        Node last = null;

        while (node != null) {
            System.out.print(node.value + " -> ");
            last = node;
            node = node.next;
        }
        System.out.println("END");

        while (last != null) {
            System.out.print(last.value + " -> ");
            last = last.prev;
        }
        System.out.println("START");
    }

    public Node get (int index) {
        Node temp = head;
        for (int i = 0; i < index; i++) {
            temp = temp.next;
        }
        return temp;
    }

    private class Node {
        int value;
        Node next;
        Node prev;

        Node (int val) {
            this.value = val;
        }

        Node (int val, Node next, Node prev) {
            this.value = val;
            this.next = next;
            this.prev= prev;
        }
    }
}
