%Linear index of all the  maximal element in matrix (Assume matrix contains more than one maximum value)

clc; clear;
A = magic(3);
disp(A)

Ans = -1;

for i = 1:size(A)
    for j = 1:size(A)
        if A(i, j) > Ans
            Ans = A(i, j);
        end
    end
end

disp(Ans)