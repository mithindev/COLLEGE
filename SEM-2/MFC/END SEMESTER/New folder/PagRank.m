%% Page Rank Algorithm 

% Without considering Damping Factor
% Page A links to E, B, D
% Page B links to C, D, E
% Page C doesn't link to any page
% Page D links to C
% Page E links to A, D

A1=[0 1/3 0 1/3 1/3;
    0 0 1/3 1/3 1/3;
    0 0 1 0 0;
    0 0 1 0 0;
    1/2 0 0 1/2 0];
A=A1';

% Considering Damping Factor
x1=[1/5 1/5 1/5 1/5 1/5]';

% Dampling Factor is set to 0.85
d=0.85;

% Concatnating Each iteration into the matrix k1
k1=[];
x1=((1-d)/5);
for i=1:20
    x1=d*(A*x1)+((1-d)/5);
    x1=x1/sum(x1);
    k1=[k1 x1];
end
k1
x1=x1/sum(x1);
rank2=rankMatrix(x1)