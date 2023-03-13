clc;clear; close all
x1 = linspace(3.5,10,100);
dx = x1(2)-x1(1);
A = 0.5*x1.*(3*x1./(x1-3));
plot(x1,A)
hold on
plot([4, 10], [0, 0])
Ap = diff(A)/dx;
Ap(100) = Ap(99);
n = length(Ap);
x2 = linspace(4, 10, n);
plot([4, 10], [0, 0]);
hold on;
plot(x1, Ap);
