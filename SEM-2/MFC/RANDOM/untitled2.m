clc; clear all; close all;

theta = [];

for i = 1 : 4
    theta (1, i) = (i - 1) * pi/2;
end

disp(theta)

bases = [cos(0 * theta) + j*sin(0 * theta); cos(1 * theta) + j*sin(1 * theta); cos(2 * theta) + j*sin(2 * theta); cos(3 * theta) + j*sin(3 * theta)];

disp(bases)

x = [1 2 3 4];

x = (x' * norm(bases)) * bases;

disp(x)

