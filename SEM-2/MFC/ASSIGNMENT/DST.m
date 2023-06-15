clc; clear; close all;

theta = [];
n = 4;
i = 0;
while i<n
    theta(i+1) = (i*(pi/n)) + (pi/(2*n));
    i=i+1;
end

theta
bases = [sin(1*theta)/norm(sin(1*theta));sin(2*theta)/norm(sin(2*theta));sin(3*theta)/norm(sin(3*theta));sin(4*theta)/norm(sin(4*theta))];
signal = [1 2 3 4];
dctnew = bases * signal'
a = bases'*dctnew

ortho = bases*bases'
dst1 = dst(eye(n))