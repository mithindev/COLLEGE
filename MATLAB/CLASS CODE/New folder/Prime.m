clc; clear; close all;
prompt = "Enter a number :";
a = input(prompt);
i = 2;
out="prime";
while i <= a/2
    if a == 0 || a == 1
        out = "not prime";
        break
    elseif mod(a,i) == 0
        out = "not prime";
        break
    else
        i=i+1;
    end
end

disp(out)