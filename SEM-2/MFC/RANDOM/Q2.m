clear all;close all;clc;
N=256;
theta=[];
Manual=[];

theta = [0:N-1]*pi/N;
theta = theta + (pi/(2*N));
for x=0:N-1
    Manual = [Manual;cos(x*theta)/norm(cos(x*theta))];
end

InBuilt= dctmtx(N);

Manual = round(Manual, 4);
InBuilt = round(InBuilt, 4);
figure
for i = 1:25
    subplot(5, 5, i);
    plot(real(Manual(:, i)));
    title(['Basis ', num2str(i)]);
end

disp("::::::Manual::::::")
disp(Manual)

disp("::::::InBuilt::::::")
disp(InBuilt)

if isequal(Manual,InBuilt)
    disp("Both the Bases Matrix are Equal")
else
    disp("Both the Bases Matrix are Not Equal")
end
rank(Manual)