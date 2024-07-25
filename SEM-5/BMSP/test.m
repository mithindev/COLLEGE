% Construct an array containing the impulse response of a first-order process.
% The impulse response of a first order process is given by the equation: h(t) = e^-t/tau? 
% Assume a sampling frequency of 500Hz and a time constant, of 2 sec. 
% Use convolution to find the response of this system to a unit stem input. 
% Let the total time vector be 5 seconds.

clc; clear; close all;

Fs = 500;
T = 5;
tau = 2;

t = 0:1/Fs:T;

h = exp(-t/tau);

impulse = [ones(1, length(t))];

% ans = conv(h, impulse);
% plot(ans);

a = sin(t);
ans = conv(h, a);
plot(ans)
