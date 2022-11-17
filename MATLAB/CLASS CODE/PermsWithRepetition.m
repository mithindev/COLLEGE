% PERMS WITH REPETITION
tic
clc; clear all; close all;

A = [11 12 13 14];
F = [];

for i = A
    for j = A
        for k = A
            for l = A
                F = [F; i j k l];
            end
        end
    end
end

disp(F)

toc