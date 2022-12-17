%Sum of squares of numbers divisible by 2 or 3 in a matrix

clc; clear;
A = magic(3);
disp(A)
sum = 0;
for i = 1:size(A)
    for j = 1:size(A)
        if (mod(A(i,j),2) == 0 || (mod(A(i,j),3))
            sum = A(i, j) * A(i, j);
            
        end
    end
end

disp(sum)