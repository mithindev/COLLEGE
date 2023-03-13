%2) Upper triangular matrix from a given square matrix

clc; clear;
A = magic(3);
disp(A)

for i = 1:size(A)
    for j = 1:size(A)
        if (i>=j)
            A(i, j) = 0;
        end
    end
end

disp(A)