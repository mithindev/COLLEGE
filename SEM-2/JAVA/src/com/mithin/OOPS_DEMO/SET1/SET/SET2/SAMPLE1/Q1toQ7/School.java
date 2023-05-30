package com.mithin.OOPS_DEMO.SET1.SET.SET2.SAMPLE1.Q1toQ7;

import java.util.ArrayList;

public class School {
    ArrayList<String> students;
    ArrayList<String> teachers;
    ArrayList<String> classes;

    School() {
        students = new ArrayList<>();
        teachers = new ArrayList<>();
        classes = new ArrayList<>();
    }

    void addStudent(String student) {
        students.add(student);
    }
}
