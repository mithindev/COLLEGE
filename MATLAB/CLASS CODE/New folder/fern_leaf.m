%Fern leaf
clear; close all; clc;
M1 = [0.000000 0.000000; 0.000000 0.172033]; C1 = [0.496139;-0.090510];
M2 = [0.075906 0.312285;-0.257105 0.204233]; C2 = [0.494173;0.132616];
M3 = [0.821130 -0.028405;0.029799 0.845280]; C3 = [0.087877;0.175709];
M4 = [-0.023936 -0.356062;-0.323405 0.074403]; C4 = [0.470356;0.259738];

% P(1) = 0.010000; P(2) = 0.075000; P(3) = 0.840000; P(4) = 0.075000;
% 
% cump(1) = P(1);
% cump(2) = P(1) + P(2);
% cump(3) = P(1)+P(2)+P(3);
% cump(4) = P(1)+P(2)+P(3)+P(4);
% 
% x = [rand();rand()];
% 
% for i = 1:10000
%     r = rand();
%     if r<=cump(1)
%         x = M1*x+C1;
%         plot(x(1), x(2), '.r');
%         hold on
%     elseif r<cump(2)
%         x = M2*x+C2;
%         plot(x(1), x(2), '.g');
%         hold on
%     elseif r<cump(3)
%         x = M3*x+C3;
%         plot(x(1), x(2), '.m');
%         hold on
%     else
%         x = M4*x+C4;
%         plot(x(1), x(2), '.h');
%         hold on
%     end
% end

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
% X=[X x];
end
% figure
% plot(X(1,:),X(2,:),'.g');

