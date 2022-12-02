clc; clear; close all;

count1 = 0;
count2 = 0;

for i = 1:500
    if mod(i,3) == 0 || mod(i,5) == 0
        count1 = count1+1;
    end
    if mod(i,3) == 0 && mod(i,5) == 0
            count2 = count2+1;
    end

end

count1-count2