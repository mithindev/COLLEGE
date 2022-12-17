%%
%Conditional statement if
%% 
% if condition
%to check whether a number is even
clc;clear all;
a = input('Enter value of a')
if rem(a, 2) == 0
    disp('a is even')
end
%%
%if - random number is even or not
clear all;clc;

a = randi(50, 1);
% If it is even, divide by 2
if rem(a, 2) == 0
    disp('a is even')
    a
    b = a/2
end
%%
%if else
%to ckeck whether the number is odd or even 
clc;clear all;
a = input('Enter value of a')
if rem(a, 2) == 0
    disp('a is even')
else
    disp('a is odd')
end
%%
% if else to do two operation based on one condition
clc;clear all;
a = input('Enter value of a')
if a > 10
    disp('I am good')
else
    disp('I am fine')
end

%%
%if else or elseif
clear all;clc
a = randi(100, 1)

if a < 30
    disp('a is small')
elseif a < 80
    disp('a is medium')
else
    disp('a is large')
end

%%
%while loop for multiplication 2*6
clc;clear all;
a = 0;
i = 1;
while i <= 6
    i;
    a = a + 2;
    i = i +1;
end
a

%%
% using while loop to find factorial of a number
clc;clear all;
n = 4;
f = n;
while n > 1
    n = n-1;
    f = f*n;
end
f
%%
%while loop to find 3^4
clc;clear all;
n =4;
f = 3;
s = 3;
while n > 1
    f = f*s;
    n = n-1;   
end
f
%%
%usage of for loop to plot exponential function
clc;clear all
for i = 0:6
    
    s(i+1) = exp(i);
    
end
figure;plot(s);

%plotting exponential fumction using linspace with 100 points between 0 and
%6
x = linspace(0,6,100);
y = exp(x);
figure;plot(x,y);xlabel('x');ylabel('y');title('e^x')


%%
%sum of n numbers using for loop
clc;clear all;
a = 1:10;
sum_a = 0;
for i = 1:length(a)
    sum_a = sum_a + a(i);
end
disp(sum_a)

