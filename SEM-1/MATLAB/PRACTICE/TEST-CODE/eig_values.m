% clc;clear all
% rng(12345);
% B=randi([-3 3],3)
% B=B-diag(diag(B))+eye(size(B))
% L = tril(B)
% U = triu(B)
% A=L*U
% A=A*diag([1 2 3])*inv(A)
% 
% % (A-eye(3))*(A-2*eye(3))*(A-3*eye(3))
% C = A*A'
% eig(C)
% [r_ev  e_val  l_ev]=eig(C) 


clc; clear;



B = randi([-3, 3], 3)
B = B - diag(diag(B)) + eye(size(B))
L = tril(B)
U = triu(B)
A = L*U
A = A*diag([1, 2, 3])*inv(A)
eig(A)

C = A*A'

[r_ev e_val l_ev] = eig(C)













