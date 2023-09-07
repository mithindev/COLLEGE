clc; close all; clear;

x_range = -4:0.25:4;
y_range = -4:0.25:4;

[x1, x2] = meshgrid(x_range, y_range);

z = 2 * x1.^2 + x2.^2 + 2 * x1.*x2 + x1 - x2;

contour(x1, x2, z, 30);

A = [4 2;
     2 2];
b = [-1 1]';

x0 = [4, 4]';

vals = [x0];

g = A * x0 - b;
steps = 0;

while norm(A * x0 - b) > 0.001
    g = A * x0 - b;
    alpha = (g' * g) / (g' * A * g);
    x1 = x0 - alpha * g;
    vals = [vals x1];
    x0 = x1;
    steps = steps + 1;
end

disp("Steps : ")
disp(steps)

hold on;
plot(vals(1, :), vals(2, :), 'ro-', 'MarkerFaceColor', 'r', 'LineWidth', 1);
hold off;
