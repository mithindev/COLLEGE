clc; clear; close all;

% printing a pattern
prompt1 = "Total lines :";

n = input(prompt1);

for row = 1:n
    for col = 1:row
        fprintf("* ")
    end
    fprintf('\n')
end

