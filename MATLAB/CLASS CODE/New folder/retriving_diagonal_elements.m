%3)Retrieving diagonal elements of a given square matrix as a vector

clc; clear;
A = magic(3);
disp(A)

for i = 1:size(A)
    for j = 1:size(A)
        if (i>j)
            A(i, j) = 0;
        end
    end
end

for i = 1:size(A)
    for j = 1:size(A)
        if (i<j)
            A(i, j) = 0;
        end
    end
end

disp(A)
