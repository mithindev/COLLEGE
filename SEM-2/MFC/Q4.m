%Qn4
clc; clear all;close all;
x = [1 2 -2 3 5 7 0 -1]';

% DCT
dct_basis = dctmtx(length(x));
dct_coeffs = dct(x);
dct_reconstructed = idct(dct_coeffs);

% DST
dst_basis = dst(length(x));
dst_coeffs = dst(x);
dst_reconstructed = idst(dst_coeffs);

% Real DFT
real_dft_basis = dftmtx(length(x));
real_dft_coeffs = real(fft(x));
real_dft_reconstructed = ifft(real_dft_coeffs);

% Complex DFT
complex_dft_basis = dftmtx(length(x));
complex_dft_coeffs = fft(x);
complex_dft_reconstructed = ifft(complex_dft_coeffs);

% Walsh-Hadamard
walsh_hadamard_basis = hadamard(length(x));
walsh_hadamard_coeffs = walsh_hadamard_basis * x;
walsh_hadamard_reconstructed = walsh_hadamard_basis' * walsh_hadamard_coeffs;

disp("DCT coefficients:");
disp(dct_coeffs');
disp("DCT reconstructed vector:");
disp(dct_reconstructed');

disp("DST coefficients:");
disp(dst_coeffs');
disp("DST reconstructed vector:");
disp(dst_reconstructed');

disp("Real DFT coefficients:");
disp(real_dft_coeffs');
disp("Real DFT reconstructed vector:");
disp(real_dft_reconstructed');

disp("Complex DFT coefficients:");
disp(complex_dft_coeffs');
disp("Complex DFT reconstructed vector:");
disp(complex_dft_reconstructed');

disp("Walsh-Hadamard coefficients:");
disp(walsh_hadamard_coeffs');
disp("Walsh-Hadamard reconstructed vector:");
disp(walsh_hadamard_reconstructed');