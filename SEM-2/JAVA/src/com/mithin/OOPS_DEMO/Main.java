package com.mithin.OOPS_DEMO;

public class Main {
    public static void main(String[] args) {

    }

    static String mergeAlternately(String word1, String word2) {
        StringBuilder ans = new StringBuilder();

        int i = 0;
        int j = 0;

        while (i < word1.length() && j < word2.length()) {
            ans.append(word1.charAt(i));
            i++;
            ans.append(word2.charAt(i));
            j++;
        }

        while (i < word1.length()) {
            ans.append(word1.charAt(i));
            i++;
        }

        while (j < word2.length()) {
            ans.append(word2.charAt(j));
            j++;
        }

        return ans.toString();
    }
}
