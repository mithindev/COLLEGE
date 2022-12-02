clc; clear; close all;

count = 0;
for i = 50:250
    if mod(nthroot(i, 2), 1) == 0
        count = count+1;
    end
end

count