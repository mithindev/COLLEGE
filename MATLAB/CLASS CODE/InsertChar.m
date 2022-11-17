% Insert char function

clc; clear all; close all;

function [output] = insertChar(set, ch)
No_Of_Iterations = length(set) + 1;
output = [];


for i = 1:No_Of_Iterations
    if i == 1
        a = strcat(ch, set);
    elseif i < No_Of_Iterations
        a = strcat(a(1:i-1), ch);
        a = strcat(a, a(i:end));
    else
        a = strcat(set, ch);
    end
    S = [S; a];
    a = [];
end


end