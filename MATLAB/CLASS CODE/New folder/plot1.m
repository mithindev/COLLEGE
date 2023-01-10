clc; clear; close all;
n = 100;
dx = 4/n;

for i = 1:n
    x(i) = (i-1)*dx;
    v(i) = (12-2*x(i))*(8-2*x(i))*x(i);
    Vp(i) = 12*x(i)*x(i)-80*x(i)+96;
    V2p(i) = 24*x(i)-80;
end
plot(x, v);
hold on;
plot(x,Vp);
hold on;
plot([0 4],[0,0])
hold on;
plot(x,V2p)