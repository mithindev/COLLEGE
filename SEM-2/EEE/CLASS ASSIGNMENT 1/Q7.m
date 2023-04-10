% Square wave

x = linspace(0, 4 * 2 * pi, 1000);

square_wave = sign(sin(x));

plot(x, square_wave);

%%

% TRiangular wave

x = linspace(0, 4 * 2 * pi, 1000);

tri_wave = sawtooth(x, 0.5);

plot(x, tri_wave);


