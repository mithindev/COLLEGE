clc
% Jacobi 
A = [-4, 2, 1, 0, 0;
     1, -4, 1, 1, 0;
     2, 1, -4, 1, 2;
     0, 1, 1, -4, 1;
     0, 0, 1, 2, -4];

b = [-4 11 -16 11 -4]';

x = zeros(size(b));

disp(norm(A*x-b))


iterations = 1000;
x_new = x;
tolerance = 0.000001;

bool = 0;

for i = 1:iterations
    if bool == 1
        break
    end
    for j = 1:length(x)
        x_new(j) = (b(j) - A(j, [1:j-1, j+1:end]) * x([1:j-1, j+1:end])) / A(j, j);
    end
    if norm(A*x_new -b) < tolerance
        disp("Jacobi : ")
        disp(x_new)
        disp("Number of Iterations : ")
        disp(i)
        bool = 1;
    end
    x = x_new;
end
%%
% Gauss Seidel
A = [-4, 2, 1, 0, 0;
     1, -4, 1, 1, 0;
     2, 1, -4, 1, 2;
     0, 1, 1, -4, 1;
     0, 0, 1, 2, -4];

b = [-4 11 -16 11 -4]';

x = zeros(size(b));

disp("Original Norm : ")
disp(norm(A*x-b))


iterations = 1000;
tolerance = 0.000001;

bool = 0;


for i = 1:iterations
    if bool == 1
        break
    end
    for j = 1:length(x)
        x(j) = (b(j) - A(j, [1:j-1, j+1:end]) * x([1:j-1, j+1:end])) / A(j, j);
    end
    if norm(A*x-b) < tolerance
        disp("Gauss-Seidel :")
        disp(x_new)
        disp("Number of Iterations : ")
        disp(i)
        bool = 1;
    end
end

%%
% SOR 
A = [-4, 2, 1, 0, 0;
     1, -4, 1, 1, 0;
     2, 1, -4, 1, 2;
     0, 1, 1, -4, 1;
     0, 0, 1, 2, -4];

b = [-4 11 -16 11 -4]';

x = zeros(size(b));
disp("Original Norm : ")
disp(norm(A*x-b))


iterations = 100000;
tolerance = 0.000001;
omega = 1.6;

bool = 0;

for i = 1:iterations
    if bool == 1
        break
    end
    for j = 1:length(x)
        x(j) = (1-omega)*x(j) + (((b(j) - A(j, [1:j-1, j+1:end]) * x([1:j-1, j+1:end])) * omega) / A(j, j));
    end
    if norm(A*x-b) < tolerance
        disp("SOR : ")
        disp(x)
        disp("Number of Iterations : ")
        disp(i)
        bool = 1;
    end
end