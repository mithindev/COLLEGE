clc; clear; close all;

t = linspace(0.01,6,100);

st = (2)*(t.^3)-24*t+10;
vt = 6*(t.^2)-24;
at = 12*t;

%displacement
plot(t,st);
hold on
%velocity
plot(t,vt);
hold on
%accleration
plot(t,at);

