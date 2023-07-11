clc; close all;

N = 4;
x= [1 2 3 4];
for n = 0:N-1
    theta(n+1) = n*(pi/N) + pi/(2*N);
    n = n+1;
end

x1 = cos(0*theta)/norm(cos(0*theta));
x2 = cos(1*theta)/norm(cos(1*theta));
x3 = cos(2*theta)/norm(cos(2*theta));
x4 = cos(3*theta)/norm(cos(3*theta));

bases = [x1;x2;x3;x4];

Check = bases * bases'

y = bases * x';
disp(y)

xx = bases'*y;
disp(xx)