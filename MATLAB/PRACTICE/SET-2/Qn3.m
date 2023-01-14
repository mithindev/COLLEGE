clc; clear; close all;

x = linspace(3.5,10,100);

A = (3/2)*(x.*x)./((x-3));
Ad = (3/2)*((x.*x)-6*x)./((x-3).^2);

plot(x,A);
hold on
plot(x,Ad);

