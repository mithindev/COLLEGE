% clc; clear; close all;

N = 4;
theta = ([0 1 2 3] * (pi/N)) + pi / (2 * N);

b1 = cos (0 * theta)/norm(cos(0*theta));
b2 = cos (1 * theta)/norm(cos(1*theta));
b3 = cos (2 * theta)/norm(cos(2*theta));
b4 = cos (3 * theta)/norm(cos(3*theta));

base = [b1;b2;b3;b4];

y = base * [1 2 3 4]';

disp(y);
disp(theta)

invX = base' * y;

disp(invX);

%%

