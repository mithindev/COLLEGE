clear; clc; close all;

x = 0:0.01:2*pi;
delx = x(2) - x(1);
y = sin(x);
plot(x, y);
hold on;
inty = cumsum(y)*delx-1;
plot(x, inty);
hold on;

