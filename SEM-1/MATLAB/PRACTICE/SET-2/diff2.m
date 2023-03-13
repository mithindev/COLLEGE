clear; clc; close all;

x = 0:0.01:2*pi;
delx = 0.00001;
y = sin(x);
plot(x, y);
hold on
ydash = (sin(x+delx) - sin(x))/delx;
plot(x, ydash);
hold on
plot([0 2*pi], [0 0]);


