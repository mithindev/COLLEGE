clear; clc; close all;

% x = 0:0.01:2*pi;
x = linspace(0, 2*pi, 1000000);
y = sin(x);
dx = 1/1000000;
dy = (sin(x+dx)-sin(x)./ dx;
dy = [0, dy];

plot (x,y);
hold on
plot (x,dy);



