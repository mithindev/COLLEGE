%Qn6
clc;clear all
rng(12345);
B=randi([-3 3],3); % integer values are between -3 and 3
B=B-diag(diag(B))+eye(size(B));% 
% B is a integer Matrix with diagonal elements as 1 
L = tril(B);
U = triu(B);
A = L*U
%%
%Qn1
%Generating a 5x5 matrix of rank 3
A = randi([0 9],5,3) * randi([0 9],3,5)
rank(A)
%%
%Qn4
A = [1;2;3];
num_solutions = 100;
solutions = zeros(size(A,2), num_solutions); 

for i = 1:num_solutions
    b = rand(size(A,1),1); 
    x = A \ b; 
    solutions(:,i) = x
end
%%
%Qn3
clc;clear all;
A = rand(3);
Q = orth(A)
Q * Q' 
%%
%Qn5
clc;clear all;
A = [1 2 1; 4 4 2; -1 -1 0];

C = zeros(size(A));
R = zeros(size(A));

for j = 1:size(A, 2)
    R(j,j) = norm(A(:,j) - C(:,1:j-1)*R(1:j-1,j));
    C(:,j) = (A(:,j) - C(:,1:j-1)*R(1:j-1,j))/R(j,j);
end

C
R
C*R
%%
%Qn7
clc;clear all
rng(12345);
B=randi([-3 3],3);
B=B-diag(diag(B))+eye(size(B));% 
% B is a Matrix with diagonal elements as 1 
L = tril(B);
U = triu(B);
A=L*diag([1 2 3])*U
%%
%Qn8
n = 5; % size of the matrix
A = randn(n,n) % generate a random matrix
A = (A + A')/2 % create a symmetric matrix by adding the matrix with its transpose and dividing by 2
%%
%Qn2
A = [1 2 3; 4 5 6; 7 8 9];
null_space = null(A');
disp(null_space)
%%
%Qn10
clc;clear all;
n = 4; 
A = randn(n);
[Q, R] = qr(A)
%%
%Qn9
clc;clear all;
n = 4; % size of matrix
e = [1;2;3;4] % generate random eigenvalues
D = diag(e); % create diagonal matrix with eigenvalues
V = randn(n); % generate random eigenvectors
[U, ~] = eig(V); % make eigenvectors orthogonal
A = U * D * U'% symmetric matrix with given eigenvalues
%%
clc;clear all;
eigvals = [1 2 3];
A = symmetric_matrix(eigvals);
display(A)

function A = symmetric_matrix(eigvals)

n = length(eigvals);

Q = orth(rand(n));
P=transpose(Q)

D = diag(eigvals);

A = Q*P*D;

end
%%