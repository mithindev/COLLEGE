clc; clear; close all;

w = linspace(0.1,10,100);
V = (0.5)*(5*w - w.*w.*w);
Vd = (0.5)*(5 - 3*w.*w);
Vdd = -3*w;

plot(w,V);
hold on
plot(w,Vd);
hold on
plot(w,Vdd);
