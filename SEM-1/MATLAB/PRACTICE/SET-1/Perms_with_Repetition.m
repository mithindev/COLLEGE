% prems with repetition

clc; clear all; close all;

A = ['abcd'];
Perms = [];
[m, n] = size(A);
for i = 1:n
    for j =1:n
        for k = 1:n
            for l = 1:n
                Perms = [Perms;A(i), A(j), A(k), A(l)];
            end
        end
    end
end

disp(Perms)