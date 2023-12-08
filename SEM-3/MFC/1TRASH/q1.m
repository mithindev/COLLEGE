%% Preprocessing
clc;
clear all;
close all;

%% Generate Noisy Signal
t = linspace(0, 2*pi, 512);
% Change the signal to a square wave
signal = square(t);
sigma = 0.1;
noise = sigma * randn(size(signal));
noisy_signal = signal + noise;
noisy_signal = noisy_signal';
N = length(noisy_signal);

%% Denoising Parameters
e = ones(N, 1);
D = spdiags([e, -2*e, e], 0:2, N-2, N);
lambda = 50;
Z = speye(N) + lambda * D' * D;

%% Denoising Process
denoised_signal = inv(Z) * noisy_signal;

%% Plotting
figure;

subplot(3, 1, 1);
plot(noisy_signal);
title('Noisy Signal');
axis tight;
ylabel('Amplitude');

subplot(3, 1, 2);
plot(denoised_signal);
title('Denoised Signal');
axis tight;
xlabel('Samples');

subplot(3, 1, 3);
plot(signal);
title('Original Signal');
axis tight;
xlabel('Samples');
