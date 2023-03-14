%Q1
clc; clear; close all;
A = randi([0 9],3);

%%
%Q2
clc; clear; close all;


%%
%Q3
clc; clear; close all;
B = randi([0 9],3,1)*randi([0 9],1, 3);

%%

A = randi([0 9], 5, 4);
B = randi([0 9], 5, 1);
for i=1:100
Xp = pinv(A)*B;
Nsv = null(A);
nCol = size(Nsv, 2);
Xn = Nsv*randi([0, 9], nCol, 1);
X = Xp+Xn;
disp(X)
end