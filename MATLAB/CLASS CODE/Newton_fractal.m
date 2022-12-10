clc; clear all; close all;

x = -2:0.01:2;
y = x;
i = complex(0,1);
[X, Y] = meshgrid(x, y);
Z = X+i*Y;

for j = 1:64
    Z = Z-(Z.^3-1)./(3*Z.^2);
end

imshow(Z)
%Fern leaf
M1=[0 0;0 0.16]; T1=[0;0];
M2=[0.85 0.04;-0.04 0.85]; T2=[0.0;1.6];
M3=[0.20 -0.26;0.23 0.22]; T3=[0.0;1.6];
M4=[-0.15 0.28;0.26 0.24]; T4=[0.0;0.44];
x=[rand();rand()];
X=[]; % for storing the path
p(1)=0.02; p(2)=0.84;p(3)=0.07; p(4)=0.07;
cump(1)=p(1); cump(2)=p(1)+p(2);
cump(3)=p(1)+p(2)+p(3);
figure
for i=1:100000
r=rand();
if r<=cump(1)
x=M1*x+T1;
plot(x(1),x(2),'.r');
hold on
elseif r<=cump(2)
x=M2*x+T2;
plot(x(1),x(2),'.g');
hold on
elseif r<=cump(3)
x=M3*x+T3;
plot(x(1),x(2),'.m');
hold on
else
x=M4*x+T4;
plot(x(1),x(2),'.b');
hold on
end
end
