N = 256;
W = zeros(N, N);
for k = 1:N
    for n = 1:N
        W(n, k) = exp(-2j * pi * (k - 1) * (n - 1) / N);
    end
end

I = eye(N);
F = fft(I);

W_rounded = round(W, 5);
F_rounded = round(F, 5);

if isequal(W_rounded, F_rounded)
    disp('The matrices are equal.')
else
    disp('The matrices are not equal.')
end

for i = 1:16
    subplot(4, 4, i);
    plot(real(W(:, i)));
    title(['Basis Vector ', num2str(i)]);
    xlabel('Time');
    ylabel('Amplitude');
end