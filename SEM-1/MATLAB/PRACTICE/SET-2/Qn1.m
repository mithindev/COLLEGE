clc; clear; close all;
x = linspace(0,4,100);

V = x.*(8-2*x).*(12-2*x);
Vd = (12*x.*x)-(80*x)+96;
% Vd = 12*x.^2 -80*x+96;
Vdd = 24*x-80;


plot(x,V);
hold on
plot(x,Vd);
hold on
plot(x,Vdd);
hold on
hold on 
plot([0 4],[0 0])
