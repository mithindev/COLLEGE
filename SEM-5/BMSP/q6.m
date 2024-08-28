% Define the frequency range
f = linspace(-5, 5, 1000);

% Calculate the Fourier Transform
X_f = (sqrt(pi) / 2) * exp(-pi^2 * f.^2 / 2);

% Calculate magnitude and phase spectra
magnitude = abs(X_f);
phase = angle(X_f);

% Plot magnitude spectrum
subplot(2, 1, 1);
plot(f, magnitude);
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
grid on;

% Plot phase spectrum
subplot(2, 1, 2);
plot(f, phase);
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('∠X(f)');
grid on;
