clc; clear; close all;

N = 4;
theta = (0:N) * 2 * pi / N;

b0 = exp(0*1i*theta);
b1 = exp(1*1i*theta);
b2 = exp(2*1i*theta);
b3 = exp(3*1i*theta);

BH = [b0; b1; b2; b3];
x = [1; 2; 3; 4];
y = BH.*x;
y1 = fft(x);
yf = abs(y);

figure;
subplot(2, 1, 1);
stem(0:N, real(y));
title('Real Part of y');
xlabel('Index');
ylabel('Amplitude');

subplot(2, 1, 2);
stem(0:N, imag(y));
title('Imaginary Part of y');
xlabel('Index');
ylabel('Amplitude');

figure;
stem(0:N-1, yf);
title('Magnitude of y');
xlabel('Index');
ylabel('Magnitude');
