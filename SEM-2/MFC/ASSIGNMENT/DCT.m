clc; clear; close all;

theta = [];
n = 4;
i = 0;
while i<n
    theta(i+1) = (i*(pi/n)) + (pi/(2*n));
    i=i+1;
end

theta
bases = [cos(0*theta)/norm(cos(0*theta));cos(1*theta)/norm(cos(1*theta));cos(2*theta)/norm(cos(2*theta));cos(3*theta)/norm(cos(3*theta))]
signal = [1 2 3 4];
dctnew = bases * signal'
a = bases'*dctnew

ortho = bases*bases'
dct1 = dct(eye(n))

