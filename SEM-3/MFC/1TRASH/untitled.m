clc;clear all;close all;
 
x = rand(500,1)*5;
y = rand(500,1)*5;
c = mod((floor(x)+floor(y)),2);
ind = find(c);
a = [x(ind),y(ind)];
 
ind1 = find(c==0);
b = [x(ind1),y(ind1)];
 
%figure(1)
%plot(a(:,1),a(:,2),'*');hold on
%plot(b(:,1),b(:,2),'o','Color','red');hold off;title('Checkboard data')
c=1.2;
concatt=[x,y];% 500x2
d=[ones(length(a),1);-1*ones(length(b),1)];
rmatrix=rand(2,100);

neww=concatt*rmatrix;%500x100

cos_val = cos(neww);
sin_val = sin(neww);

res_matr = [cos_val, sin_val];
m=size(res_matr,1);
n=size(res_matr,2);
e=ones(m,1);
cvx_begin
    variables w(200) gamm  er(500)
    minimize(0.5*w'*w+c*sum(er));
    subject to d*(w'*res_matr-gamm*e)+er-e>=0;
    er>=0;
cvx_end