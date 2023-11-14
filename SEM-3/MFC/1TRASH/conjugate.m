clc; clear; close all

A = [4 2; 2 2];
x0 = [5; 5];
b = [-1; 1];
count = 0;

r0 = b - A * x0;
p = r0;

while true
    temp1 = ((b - A * x0)' * (b - A * x0)) / (p' * A * p);
    x0 = x0 + temp1 * p;
    r1 = (b - A * x0) - temp1 * A * p;
    temp2 = (r1' * r1) / ((b - A * x0)' * (b - A * x0));
    p = r1 + temp2 * p;
    r0 = r1;
    count = count + 1;
    if norm(r1) < 0.00001
        break
    end
end

disp(count)
disp(x0)