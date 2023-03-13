clc; clear; close all;
%program for even or odd

prompt = "Enter a number :";
a = input(prompt);
if mod(a,2) == 0
    disp("even")
else 
    disp("Odd")
end

%%
% 

clc; clear; close all;
prompt = "Enter a number :";
a = input(prompt);
i = 2;
while i <= a/2
    if a == 0 || a == 1
        disp("np")
        break
    elseif mod(a,i) == 0
        disp("np")
        break
    else
        i=i+1;
    end

    disp("p")
end

%%
% generate a random integer and find enen/odd

clc; clear; close all;

num = randi(1000);
disp(num);
if mod(num,2) == 0
    disp("even")
else 
    disp("Odd")
end

%%
%

clc; clear; close all;

num = randi(100);
disp(num)

if num <25
    disp("small");
elseif num <75
    disp("medium");
else
    disp("large");
end





