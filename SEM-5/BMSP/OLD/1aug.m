fs = 1000;                % Sampling frequency
f1 = 250;                 % Frequency of the first sine wave
f2 = 235;                 % Frequency of the second sine wave
signalLength = 128;       % Length of the signal

t = (0 : signalLength - 1) / fs;  % Time vector

% Generate sine waves
wave1 = sin(2*pi*f1*t);
wave2 = sin(2*pi*f2*t);

% Generate white noise
noise = randn(1, signalLength);

% Calculate power of the signal and noise
signalPower = rms(wave1 + wave2)^2;
noisePower = signalPower / (10^(-30 / 10));  % SNR = -30 dB

% Scale the noise to achieve the desired SNR
noise = sqrt(noisePower) * noise;

% Combine signal and noise
messSignal = wave1 + wave2 + noise;

% Define the windows
hannWindow = hann(signalLength, 'symmetric');
hammingWindow = hamming(signalLength, 'symmetric');
rectWindow = rectwin(signalLength);

% Apply Hann window
hannSignal = messSignal .* hannWindow';
hannFFT = fft(hannSignal);
hannMagnitude = abs(hannFFT);

% Apply Hamming window
hammingSignal = messSignal .* hammingWindow';
hammingFFT = fft(hammingSignal);
hammingMagnitude = abs(hammingFFT);

% Apply Rectangular window
rectSignal = messSignal .* rectWindow';
rectFFT = fft(rectSignal);
rectMagnitude = abs(rectFFT);

% Frequency vector for plotting
frequencies = (0:signalLength-1) * (fs / signalLength);

% Plot the windows
figure;
subplot(3,2,1);
plot(hannWindow);
title('Hann Window');

subplot(3,2,3);
plot(hammingWindow);
title('Hamming Window');

subplot(3,2,5);
plot(rectWindow);
title('Rectangular Window');

% Plot the magnitude spectra
subplot(3,2,2);
plot(frequencies, hannMagnitude);
title('Magnitude Spectrum with Hann Window');
xlim([0, 500]);

subplot(3,2,4);
plot(frequencies, hammingMagnitude);
title('Magnitude Spectrum with Hamming Window');
xlim([0, 500]);

subplot(3,2,6);
plot(frequencies, rectMagnitude);
title('Magnitude Spectrum with Rectangular Window');
xlim([0, 500]);
