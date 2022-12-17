% A = randi([0,9],5,3)
% P = A*inv(A'*A)*A'
% 
% eig(P)

Ans = [];

for i = 1:100
    A = randi([0,9],5,3);
    P = A*inv(A'*A)*A';
    C = eig(P)';
    Ans = [Ans; C];
end

disp(Ans)
