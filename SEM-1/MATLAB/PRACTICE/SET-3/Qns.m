%%
%Qn 3
clc;clear all;
x=linspace(0,2*pi,100);
y=sin(x);
plot(x,y)
%%
%Qn 4
clc;clear all;
y=0;
for x=1:100
    y=y+x;
end
y
%%
%Qn 5
clc;clear all;
y=0;
x=0;
while x<=100
    y=y+x;
    x = x+1;
end
y
%%
%Qn 6
clc;clear all;
y=0;
for x=1:100
    if (mod(x,2)==1)
        y=y+x;
    end
end
y
%%
%Qn 7
sum = 0;
i = 1;
while i <= 100
    if rem(i, 2) == 1 
        sum = sum + i;
    end
    i = i + 1;
end
disp(sum); 
%%
%Qn 9
clc;clear all;
result = sum(1:100)
%% 
%Qn 10
sum(find(mod(1:100,2)==0 | mod(1:100,5)==0))
%%
%Qn 11
clc;clear all;
n=50
a = 0;
b = 1;
x = n-1;
for i = 1:n %term for n
    
    fprintf('\t')
    fprintf('%d',a);
    c = a + b;
    a = b;
    b = c;
end
for i = n:x %term for n-1
    
    fprintf('\t')
    fprintf('%d',a);
    c = a + b;
    a = b;
    b = c;
    
end
%%
%Qn 12
clc;clear all;
a=0; 
b=1;
fprintf('%d\t%d',a,b);
n=3;
while n<=50
    c=a+b;
    a=b;b=c;
    n=n+1;
    fprintf('\t %d',c);
end
%%
%Qn13
    fibonacci_numbers = [0 1];
for i = 3:Inf
    next_fibonacci = fibonacci_numbers(i-1) + fibonacci_numbers(i-2);
    if next_fibonacci >= 5000
        break;
    end
    fibonacci_numbers(i) = next_fibonacci;
end
disp(fibonacci_numbers);
%%
%Qn14
clc;clear all;
fibonacci_numbers = [0 1];
i = 3;
while true
    next_fibonacci = fibonacci_numbers(i-1) + fibonacci_numbers(i-2);
    if next_fibonacci >= 5000
        break;
    end
    fibonacci_numbers(i) = next_fibonacci;
    i = i + 1;
end
disp(fibonacci_numbers);
%% 
%Qn 15
clc;clear all;
primes_10 = [2, 3, 5, 7];

x = false(1, 100);

for i = primes_10
    x(i*2:i:end) = true;
end

primes_100 = find(~x & (1:100) > 1);

disp(primes_100);
%%
%Qn16
primes_32 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31];

x = false(1, 1000);
for i = primes_32
    x(i*2:i:end) = true;
end
y = find(~x & (1:1000) >= 32);
disp(y);
%%
%Qn17
x=[1 2 3 4 5 6 7 8 9 10];
x=x.^2
%%
%Qn18
x=[1 2 3 4 5 6 7 8 9 10];
x=x./sqrt(x)
%%
%Qn19
x=[1 2 3 4 5 6 7 8 9 10];
x=(x.^2)./sqrt(x)
%%
%Qn20
x=[1 2 3 4 5 6 7 8 9 10];
x=(x.^-3)./sqrt(x)
%%
%Qn21
clc;clear all;
exponential = exp(0:10)
%%
%Qn22
clc;clear all;
sum = 0;
i = 1;
count =0 ;
while sum <= 1000
    if mod(i,3) == 0 || mod(i,5) == 0
        sum = sum + i;
        count=count + 1
    end
    i = i + 1;
end
sum
%%
%Qn23
clc;clear all;
sum = 0;
i = 1;
c=0;
while sum <= 1000
    if (mod(i,3) == 0 && mod(i,5) ~= 0) || (mod(i,3) ~= 0 && mod(i,5) == 0)
        sum = sum + i;
        c=c+1;
    end
    i = i + 1;
end
c
sum
%%
%Qn24
clc;clear all;
fib = [1, 1]; 
sum_fib = 2;  

while sum_fib < 5000
    next_fib = fib(end) + fib(end-1);
    if sum_fib > 5000
        break;
    else
    fib = [fib, next_fib];
    sum_fib = sum_fib + next_fib;  
    end
end
sum_fib = sum_fib - next_fib
x=length(fib);
for i=1:x-1
disp(fib(i))  
end
%%
%Qn25
clc;clear all;
a = 0; 
b = 1; 
fprintf('%d\n', a); 
while (b-a) < 1000 
    fprintf('%d\n', b); 
    c = a + b;
    a = b; 
    b = c; 
end
%%
%Qn26
primes = [];
cumulative_sum = 0;
n = 2; 

while cumulative_sum < 1000
    if isprime(n) 
        primes = [primes, n];
        cumulative_sum = sum(primes); 
    end
    n = n + 1; % Increment n
end

cumulative_sum
primes