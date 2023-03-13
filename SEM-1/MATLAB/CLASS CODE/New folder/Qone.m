% Implementing AND, OR, NOT

clc; clear all; close all;

prompt1 = "enter value of bit1 (0/1) :";
prompt2 = "enter value of bit2 (0/1) :";

a = input(prompt1)
b = input(prompt2)

AND = and(a, b);
OR = or(a, b);
NOT = not(a);
N = nand(a,b);

AND
OR
NOT
N