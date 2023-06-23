%Qn3
clear all;
close all;
clc;

N = 256;
theta = [];
Manual = [];

theta = [0:255]*(pi/256);
theta = theta + (pi/(2*256));
Manual=[];
for x=1:256
    Manual = [Manual;sin(x*theta)/norm(sin(x*theta))];
end

InBuilt = dst(eye(N));

Manual = round(Manual, 4);
InBuilt = round(InBuilt, 4);

figure
for i = 1:25
    subplot(5, 5, i);
    plot(real(Manual(:, i)));
    title(['Basis ', num2str(i)]);
end

if isequal(Manual, InBuilt)
    disp("The Matrices are equal")
else
    disp("Bases Matrix are Equal")
end