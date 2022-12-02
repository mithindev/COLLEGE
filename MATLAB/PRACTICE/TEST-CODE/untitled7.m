clc; clear all; close all;
count = 0;
for i = 5:211
    if mod(nthroot(i,2), 1) == 0 && mod(nthroot(i, 2),2) ~=0
        count = count+1;
    end
end

count
        