clc;clear; close all
x1 = linspace(3.5,10,100);
A = 0.5*x1.*(3*x1./(x1-3));
plot(x1,A)
