clc; clear; close all;

N = 16000;
n = 0:N-1;
x = cos(2 * pi / 80000 * (n + 1000).^2);
fs = 8000;
sound(x, fs); % Plays the sound

window = 90;
noverlap = 45;  % noverlap should be less than window size           
nfft = 1024;            
[s1, f1, t1] = spectrogram(x, window, noverlap, nfft, fs);

% Plotting the spectrogram in decibels
figure;
imagesc(t1, f1, 20 * log10(abs(s1))); % Plotting the magnitude of the spectrogram in dB
axis xy;  % Corrects the axis orientation
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram');
colorbar;  % Adds color scale
