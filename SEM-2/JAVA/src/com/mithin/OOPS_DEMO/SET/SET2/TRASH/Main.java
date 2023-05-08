package com.mithin.OOPS_DEMO.SET.SET2.TRASH;

public class Main {
    public static void main(String[] args) {
        Test o1 = new Test();
        Test.add();
        Test o2 = new Test();
        Test.add();

        System.out.println(Test.count);
    }

    /*
     Note:
     If the variable is static the just ust `class.var_name`
    */
}