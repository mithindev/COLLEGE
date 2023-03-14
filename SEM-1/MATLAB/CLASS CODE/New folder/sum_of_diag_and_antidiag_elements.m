%Total Sum of diagonal and anti-diagonal elements of a square matrix

clc; clear;
A = magic(3)
Diag = [];
Anti_Diag = [];

for i = 1:size(A)
    for j = size(A):-1:1
        if (i+j == size(A)+1)
            Diag = [Diag;A(i, j)];
        end            
    end
end

for i = 1:size(A)
    for j = 1:size(A)
        if (i==j)
            Anti_Diag = [Anti_Diag; A(i, j)];
        end
    end
end

disp(Diag)
disp(Anti_Diag)


