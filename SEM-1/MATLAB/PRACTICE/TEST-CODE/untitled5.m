clc; clear all; close all;

count = 0;
for i = 150:-1:1
    if mod(i, 7) == 0
        count = count+1;
    end
end

count