clc; clear; close all;

x = 0:0.01:2*pi;
y = sin(x);
dx = x(2) - x(1);
% dy = (sin(x(2:end)) - sin(x(1:end-1)))./dx;
dy = diff(sin(x))./ dx;
dy = [0, dy];

plot (x,y);
hold on
plot (x,dy);