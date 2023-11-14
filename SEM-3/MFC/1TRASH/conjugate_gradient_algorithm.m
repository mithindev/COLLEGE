A=[3 0 1;
   0 4 2;
   1 2 3];

b = [3 4 5]';

x0=[1 1 1]';

r = b-A*x0;

d0 = -r;

ans = [];

for i=1:3
    alpha = (r'*d0)/(d0'*A*d0);
    x0 = x0 + alpha*d0;
    ans = [ans x0];
    r = b - A*x0;
    beta = -((r'*A*d0)/(d0'*A*d0));
    d0 = r + beta*d0;
end

ans
