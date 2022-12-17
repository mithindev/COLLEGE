% Search Function

clc; clear;

%A = magic(3)
A = [1, 1, 2;2, 2, 3; 5 5 9];
Z = [];

for i = 1:size(A)
    for j = 1:size(A)
        if Count(A, A(i,j)) > 1 
            Z = [Z;A(i, j)];      
            
        end
    end
end

disp(Z)


function output = Count(matrix, target)

count = 0;

for i = 1:size(matrix)
    for j = 1:size(matrix)
        if matrix(i, j) == target
            count = count+1;
        end
    end
end

output = count;

end
