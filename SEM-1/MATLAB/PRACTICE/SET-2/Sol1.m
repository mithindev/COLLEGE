clc; clear; close all;

A = randi([0 9], 5, 2)*randi([0 9], 2, 5);
B = randi([0 9], 5, 1);


for i = 1:100
    Xp = pinv(A)*B;
    Nsv = null(A);
    nCol = size(Nsv, 2);
    Xn = Nsv*randi([0, 9], nCol, 1);
    X = Xp+Xn;

disp(X);
end