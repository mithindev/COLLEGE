clc;clear; close all;

w = linspace(0.5,10,1000);
C = 60*w.^2+800./w;
Cp = 120*w-800./(w.^2);
Cpp = 120+1600./(w.^3);
plot(w,C)
hold on;
plot(w,Cp)
hold on;
plot([0 10],[0,0])
hold on;
plot(w,Cpp)