%3
%Generate a sine wave by taking equispace points  for angle in the range 0 to 2 𝜋 Programming/command alone  problems
clc;clear all;
x=linspace(0,2*pi,1000);
y=sin(x);
plot(x,y);hold on;plot([0,2*pi],[0,0]);

%%
%4
%write code for adding numbers 1 to 100 "("integers")" using for loop
clc;clear all
s=0;
for i=1:100
    s=s+i;
end
disp(s)

%%
%5
%"write code for adding number 1 to 100 "("integers")"using  while loop"
clc;clear all
s=0;
i=100;
while i>0
    s=s+i;
    i=i-1;
end
disp(s)

%%
%6
%"write code for adding odd numbers from 1 to 100 using for loop"
clc;clear all
s=0;
for i=1:2:100
    s=s+i;
end
disp(s)

%%
%7
%"write code for adding odd numbers from 1 to 100 using  while loop"
clc;clear all
s=0;
i=99;
while i>0
    s=s+i;
    i=i-2;
end
disp(s)

%%
%8
%"Add integers from  1 to 100 using Matlab commands alone"
clc;clear all;
s = sum(1:100);
disp(s)

%%
%9
%"Add 1 to 100 odd numbers using Matlab commands alone"
clc;clear all;
s = sum(1:2:100);
disp(s)

%%
%10
%Add all integer numbers from 1 to 100 that are divisible by 2 or 5  using commands alone
clc;clear all;
i=1:100;
s=sum(find((mod(i,2)==0)|(mod(i,5)==0)));
disp(s)

%%
%11
%"Generate " 50 𝐹𝑖𝑏𝑜𝑛𝑎𝑐𝑐𝑖" numbers using  a FOR" ​" loop "
clc;clear all;
t1=0;t2=1;t3=t1+t2;
for i=1:50
    disp(t1)
    t1=t2;
    t2=t3;
    t3=t2+t1;
end

%%
%12
%"Generate " 50 𝐹𝑖𝑏𝑜𝑛𝑎𝑐𝑐𝑖" numbers using  a while" ​" loop"
clc;clear all;
t1=0;t2=1;t3=t1+t2;
i=50;
while i>0
    disp(t1)
    t1=t2;
    t2=t3;
    t3=t2+t1;
    i=i-1;
end

%%
%13
%"Generate all  " 𝐹𝑖𝑏𝑜𝑛𝑎𝑐𝑐𝑖" numbers less than 5000 using FOR" ​" loop " 𝑎𝑛𝑑" break"
clc;clear all;
t1=0;t2=1;t3=t1+t2;
for i=1:50
    disp(t1)
    t1=t2;
    t2=t3;
    t3=t2+t1;
    if(t1>5000)
        break;
    end
end

%%
%14
%"Generate all  " 𝐹𝑖𝑏𝑜𝑛𝑎𝑐𝑐𝑖" numbers less than 5000 using " 𝑤ℎ𝑖𝑙𝑒" loop"
clc;clear all;
t1=0;t2=1;t3=t1+t2;
i=50;
while i>0
    disp(t1)
    t1=t2;
    t2=t3;
    t3=t2+t1;
    i=i-1;
    if(t1>5000)
        break;
    end
end

%%
%15
%"Generate all prime numbers between 10 and 100 using prime numbers less than 10"
clc;clear all;
p=[2,3,5,7];
x=[];
for i=10:100
    if(mod(i,p)~=0)
        x=[x,i];
    end
end
disp(x)

%%
%16
%"Generate all prime numbers between 32 and 1000 using prime numbers less than 32"
clc;clear all;
p=[2,3,5,7,11,13,17,19,23,29,31];
x=[];
for i=32:1000
    if(mod(i,p)~=0)
        x=[x,i];
    end
end
disp(x)


%%
%17
%"Generate squares of all integer numbers from 0 to 10 in an array using one command"
clc;clear all;
i=power(1:10,2)

%%
%18
%"Generate all integer numbers from 1 to 10 in an array and divide each by its own square root using one command"
clc;clear all;
i=(1:10)./sqrt(1:10)

%%
%19
% Generate squares of integer numbers from 1 to 10 in an array and divide each by its own square root using one command"
clc;clear all;
i=power(1:10,2)./sqrt(1:10)

%%
%20
%"Generate cuberoot of integer numbers from 1 to 10 in an array and divide each by its own square root using one command"
clc;clear all
i=nthroot(1:10,3)./sqrt(1:10)

%%
%21
%"Generate " "e" ^𝑥 " for  all integer numbers from 0 to 10 in an array using one command"
clc;clear all
i=exp(1:10)

%%
%22a
%𝐴𝑑𝑑 all positive numbers which are muliple of 3 or 5 till the sum is just above 1000 and find the number of numbers needed to get that sum"
clc;clear all;
s=0;j=0;
i=1;
while s<1000
    if(mod(i,3)==0||mod(i,5)==0)
        s=s+i;
        j=j+1;
    end
    i=i+1;
end
disp(s);disp(j)

%%
%22b
%𝐴𝑑𝑑" all positive numbers which are muliple of 3 or 5 but not both till the sum is just above 1000" and find the number of numbers needed to get that sum"
clc;clear all;
s=0;j=0;
i=1;
while s<1000
    if((mod(i,3)==0||mod(i,5)==0)&&(mod(i,15)~=0))
        s=s+i;
        j=j+1;
    end
    i=i+1;
end
disp(s);disp(j)
%%
%23
%"Generate all  " 𝐹𝑖𝑏𝑜𝑛𝑎𝑐𝑐𝑖" numbers whose sum is less than 5000 "
clc;clear all;
t1=0;t2=1;t3=t1+t2;s=0;
while s<5000
    disp(t1)
    s=s+t2;
    t1=t2;
    t2=t3;
    t3=t2+t1; 
end

%%
%24
%"Generate all  " 𝐹𝑖𝑏𝑜𝑛𝑎𝑐𝑐𝑖" numbers till the difference of two consecutive fibonacci number is first time above 1000"
clc;clear all;
t1=0;t2=1;t3=t1+t2;s=0;
while s<1000
    disp(t1)
    s=t2-t1;
    t1=t2;
    t2=t3;
    t3=t2+t1; 
end

%%
%25
%"Generate all prime numbers till their cumulative sum is first time above 10000"
clc;clear all;
s=0;j=1;
i=primes(10000);
x=[];
while s<10000
    s=i(j)+i(j+1);
    j=j+1;
    x=[x,i(j)];
end
disp(x)


%%
%LA
%%
%1
% Generation of integer matrix with given Rank
clc;clear all;
x=randi([0 9],4,3)*randi([0 9],3,3)%4x3 matrix of rank 3
rank(x)

%%
%2
%Generation of independent vectors which are orthogonal to given set of vectors
clc;clear all;
j=randi([1 3]);
x=randi([0 9],3,j)*randi([0 9],j,3);
disp(null(x'))

%%
%3
%Generation of orthogonal square matrices
clc;clear all;
x=randi([0 9],3,3)*randi([0 9],3,3)
y=orth(x)

%%
%4
%Generation of infinite solution to Ax=b if it exist
clc;clear all;
a = randi([1 10],3,2)*randi([1 10],2,3); 
b = rand()*a(:,1)+rand()*a(:,2)+a(:,3);
xp = pinv(a)*b;
xn = null(a);
for i=1:100
    x = xn*rand()+xp
end

%%
%5
%CR decomposition
clc;clear all;
A=[1 2 3; 3 4 5; 2+3 4+4 6+5];
A=A';
[R , colindex]=rref(A);
r=length(colindex);
R=R(1:r,:)
C=A(:,colindex)
An=C*R

%%
%6
%Code to Generate random integer matrix whose inverse is also an integer matrix 
clc;clear all
rng(12345);
B=randi([-3 3],3)
B=B-diag(diag(B))+eye(size(B))
L = tril(B);
U = triu(B);
A=L*U
det(A)
C=inv(A)

%%
%7
%Code to Generate  random integer matrix with given eigen values
clc;clear 
rng(12345);
B=randi([-3 3],3);
B=B-diag(diag(B))+eye(size(B));
L = tril(B);
U = triu(B);
A=L*U;
A=A*diag([1 2 3])*inv(A)
eig(A)

%%
%8
%Code to Generate  Symmetric matrices
n=randi(5);
A = randi([-10, 10], n, n);
A = 0.5*(A + A')

%%
%9
%Code to Generate  Symmetric matrices with given eigenvalues
clc;clear all
rng(12345);
e=[1,2,3];
n=length(e);
Q=orth(rand(n, n));
D=diag(e);
A=Q*D*Q'

%%
%10
clc;clear all;
n=randi([0 5]);
Q=orth(rand(n, n));
D=diag(rand(n, 1));
A=Q*D*Q'