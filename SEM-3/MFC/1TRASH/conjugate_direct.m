A=[3 0 1;
   0 4 2;
   1 2 3];

b = [3 4 5]';

d1=[1 0 0]';
d2=[0 1 0]';
d3 = [2 3 -6]';

d = [d1 d2 d3];
vals=[];
x0= [0 0 0]';
i = 1;

while norm(A * x0 - b) > 0.001
    g = -1*(b-A*x0);
    a = -((d(:,i)'*g)/(d(:,i)'*A*d(:,i)));
    x0 = x0 + a*d(:,i);
    vals = [vals x0];
    i = i+1;
end
vals