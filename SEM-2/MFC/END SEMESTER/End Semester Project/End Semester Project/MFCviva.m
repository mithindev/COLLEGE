%% Mathematics for Computing
%% 1
x=linspace(0,1,100);
%% 2
% (a) 
x=linspace(0,1,101);
x=x(1:100);
% (b)
x=(0:100-1)*1/100;
%% 3
x=linspace(0,2*pi,1000);
y=sin(x);
plot(x,y);
%% 4
sum=0;
for i=1:100
    sum=sum+i;
end
sum
%% 5
sum=0;
i=1;
while i<=100
    sum=sum+i;
    i=i+1;
end
sum
%% 6
sum=0;
for i=1:2:100
    sum=sum+i;
end
sum
%% 7
sum=0;
i=1;
while i<=100
    sum=sum+i;
    i=i+2;
end
sum
%% 8
x=1:100;
y=cumsum(x);
out=y(1,end);
%% 9
x=1:2:100;
y=cumsum(x);
out=y(1,end);
%% 10
x=unique([2:2:100 5:5:100]);
cumsum(x)
%% 11
N=50; 
fib=[];
fib(1)=0;
fib(2)=1;
for i= 3:50
    fib(i)=fib(i-1)+fib(i-2);
end
fib
%%
f1=0;
f2=1;
k=[f1 f2];
for i=3:50
    f3=f2+f1;
    f1=f2;
    f2=f3;
    k=[k f3];
end
k
%% 12
N=50; 
fib=[];
fib(1)=0;
fib(2)=1;
i=3;
while i<= 50
    fib(i)=fib(i-1)+fib(i-2);
    i=i+1;
end
fib
%% 
f1=0;
f2=1;
k=[f1 f2];
i=3;
while i<=50
    f3=f2+f1;
    f1=f2;
    f2=f3;
    k=[k f3];
    i=i+1;
end
k
%% 13
N=50; 
fib=[];
fib(1)=0;
fib(2)=1;
for i= 3:50
    if(fib(i-1)+fib(i-2)<5000)
        fib(i)=fib(i-1)+fib(i-2);
    else 
        break;
    end
    
end
fib
%% 14
N=50; 
fib=[];
fib(1)=0;
fib(2)=1;
i=3;
while fib(i-1)+fib(i-2)<5000
    fib(i)=fib(i-1)+fib(i-2);
    i=i+1;
end
fib
%% 15
x=[2 3 5 7];
k=[];
for i=10:100
    if (mod(i,2)~=0 & mod(i,3)~=0 & mod(i,5)~=0 & mod(i,7)~=0)
        k=[k i];
    end
end
k
%% 16
x=[2 3 5 7 11 13 17 19 23 29 31]
k=[];
for i=32:1000
    if (mod(i,2)~=0 & mod(i,3)~=0 & mod(i,5)~=0 & mod(i,7)~=0 & mod(i,11)~=0 & mod(i,13)~=0 & mod(i,17)~=0 &mod(i,19)~=0 & mod(i,23)~=0 & mod(i,29)~=0 & mod(i,31)~=0)
        k=[k i];
    end
end
k
%%
primes_32 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31];

x = false(1, 1000);
for i = primes_32
    x(i*2:i:end) = true;
end
y = find(~x & (1:1000) >= 32);
disp(y);
%% 17
x=0:10;
y=x.*x
%% 18
x=1:10;
y=x./sqrt(x)
%% 19
x=1:10;
y1=x.*x
y=y1./sqrt(x)
%% 20
x=1:10;
y=x./nthroot(x,3)
%% 21
x=0:10;
y=exp(x);
plot(x,y)
%% 22
num = 0;
sum = 0;
count = 0;
while sum <= 1000
    num = num + 1;
    if (mod(num,3) == 0) | (mod(num,5) == 0)
        sum = sum + num;
        count = count + 1;
    end
end
disp(count)
disp(sum)

%% 23
sum = 0;
count = 0;
while sum <= 1000
    count = count + 1;
    if mod(count, 3) == 0 && mod(count, 5) ~= 0 || mod(count, 3) ~= 0 && mod(count, 5) == 0
        sum = sum + count;
    end
end
fprintf("The sum is %d\n", sum);
fprintf("The number of values needed is %d\n", count);
%% 24
fib = [0 1];
sum = 1;
while sum < 5000
    fib1 = fib(end) + fib(end-1);
    if sum + fib1 > 5000
        break;
    end
    fib = [fib fib1];
    sum = sum + fib1;
end
disp(fib);
cumsum(fib)
%% 25
fib = [1 1];
while true
    fib1 = fib(end) + fib(end-1);
    if fib1 - fib(end) > 1000
        break;
    end
    fib = [fib fib1];
end
disp(fib);

%% 26
primes = [2];
sum = 2;
n = 3;
while sum <= 10000
    is_prime = true;
    for i = 1:length(primes)
        if mod(n, primes(i)) == 0
            is_prime = false;
            break;
        end
    end
    if is_prime
        primes = [primes n];
        sum = sum + n;
    end
    n = n + 2;
end
disp(primes);
%%
primes = [];
cumulative_sum = 0;
n = 2; 

while cumulative_sum < 10000
    if isprime(n) 
        primes = [primes, n];
        cumulative_sum = sum(primes);  
    end
    n = n + 1; % Increment n
end

cumulative_sum
primes
%%
%% Linear Algebra
%% 1
A=int32(input("Enter the rank of the matrix :"))
Matrix= randi([0 10],5,A)*randi([0 10],A,5)
arank=rank(Matrix)
%% 2
A=randi([0 9],5,4)*randi([0 9],4,5);
K=null(A')
%% 3
n = 5;
A = randn(n);
[Q,R] = qr(A); 
Q = Q(:,1:n);
%% 4
A=randi([0 9],4,3)*randi([0 9],3,4);
b=[1 2 3 4];
xp=A/b;
x=[];
for i=1:1000
    nA=null(A);
    xn=rand()*nA;
    x=xp+xn;
    x
end
%%
clc;clear all;
a = randi([1 10],3,2)*randi([1 10],2,3); 
b = rand()*a(:,1)+rand()*a(:,2)+a(:,3);
xp = pinv(a)*b;
xn = null(a);
for i=1:100
    x = xn*rand()+xp
end

%% 5
A=randi([0 9],5,5)
[c,r] = qr(A);
c
r
c*r
%%
clc;clear all;
A=[1 2 3; 3 4 5; 2+3 4+4 6+5];
A=A';
[R , colindex]=rref(A);
r=length(colindex);
R=R(1:r,:)
C=A(:,colindex)
An=C*R
%% 6
A=randi([-3 3],3); 
A=A-diag(diag(A))+eye(size(A));%  
A = tril(A)*triu(A)
det(A) % Here the determinant is one
inv(A) 
%% 7
B=randi([-3 3],3);
B=B-diag(diag(B))+eye(size(B));
L = tril(B);
U = triu(B);
A=L*U;
A=A*diag([1 2 3])*inv(A);
eig(A)
%% 8
A = randi([0 9],5)
A=A+A'-diag(diag((A)))
%% 9
B = randi([0 9],5)
C=B+B'-diag(diag((B)));
A=(C*C')*diag([1 2 3 4 5]) *(inv(C*C'));
eig(A)
%% 10
A=rand(5);
[Q,R]=qr(A);
A=(Q*Q')*diag([1 2 3 4 5])*(inv(Q*Q'))