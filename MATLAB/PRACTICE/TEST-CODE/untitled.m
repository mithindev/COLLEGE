clc; clear; close all;

count = 0;
for i = 9:101
    if mod(i, 10) == 0
        count = count+1;
    end
end

count
