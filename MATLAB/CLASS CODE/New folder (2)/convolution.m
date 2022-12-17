clc; clear; close all;

format short;

x = linspace(0,2*pi,1000);
Sx = sin(x);
Cx = cos(x)';

SCx = Sx.*Cx;
plot(x,SCx);
Area = sum(SCx)*(x(2) - x(1))

%%
clc; clear; close all;
fx = ones(100, 1);
fy=fx;
x = linspace(-1,2,199);
fz = conv(fx, fy)*(1/100);
plot(fz)

%%
clc; clear; close all;
fx = ones(100,1);
fy = fx;
delta = 1/100;
fz = conv(fx,fy)*delta;
f2z = conv(fz,fy) * delta;
n = length(f2z);
x = linspace(0,3,n);
plot(x, f2z);

%%
clc; clear; close all;









