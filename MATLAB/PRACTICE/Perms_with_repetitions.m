% perms with repetition

clc; clear;
A = ['ABCD'];

Possibilities = [];

for i = 1:length(A)
    for j = 1:length(A)
        for k = 1:length(A)
            for l = 1:length(A)
                Possibilities = [Possibilities; [A(i) A(j) A(k) A(l)]];
            end
        end
    end
end

disp(Possibilities)


    
