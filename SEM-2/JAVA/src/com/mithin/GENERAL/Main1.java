package com.mithin.GENERAL;

public class Main1 {
    void divide(int num,int denom) throws ArithmeticException
    {
        System.out.println(num/denom);
    }

}

public class ThrowsExample
{

    public static void main(String[] args)throws ArithmeticException
    {
        Demo obj=new Demo();
        obj.divide(6, 2);
        obj.divide(6, 0);

    }

}
