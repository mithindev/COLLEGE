clc; close all; clear;

A = [4 2; 2 2];
x0 = [0; 0];
b = [-1; 1];

iteration_count = 0;
tolerance = 0.001;

while true
    gradient = A * x0 - b;
    
    alpha = (gradient' * gradient) / (gradient' * A * gradient);
    
    x0 = x0 - alpha * gradient;
    
    iteration_count = iteration_count + 1;
    
    if norm(A * x0 - b) < tolerance
        break
    end
end

disp(['Number of iterations: ' num2str(iteration_count)]);
disp(['Final solution (x0):']);
disp(x0);

x_values = -4:0.25:3;
y_values = -4:0.25:7;
[X1, X2] = meshgrid(x_values, y_values);
Z = 2 * X1.^2 + X2.^2 + 2 * X1.*X2 + X1 - X2;
contour(X1, X2, Z, 30);
