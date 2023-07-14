clc;clear all;

%% Adjacency Matrix
A = [...
0 1 1 1 0;
1 0 1 0 1;
0 0 0 1 0;
1 1 1 0 1;
1 0 1 1 0];
r=5;c=5;

q=[];
for i=1:c
sum=0;
for j=1:r
sum=sum+A(j,i);
end
q(i)=sum;
end

%% Probability Matrix
P=[];
for i=1:r
for j=1:c
if(A(i,j)==1)
P(i,j)=1/q(j);
else
P(i,j)=0;
end
end
end
P

%% Power Method
v=[0 1 0 0 0];
% P*v';
% P*(P*v');
k=P*v';
n=1000;
for i=1:(n-1)
k=P*k;
end

%% Google Matrix
% to deal with dangling nodes and loops
S=[]
for i=1:r
for j=1:c
S(i,j)=1/r;
end
end
alpha =0.85 % damping factor
G=alpha*P + (1-alpha)*S;
