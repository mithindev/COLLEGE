clc; clear; close all;

x = linspace(0.5, 10, 1000);
Vx = x.*(12-2*x).*(8-2*x);
plot(x,Vx)

