% Square wave

x = linspace(0, 4*T, 1000);

square_wave = sign(sin(x));

plot(x, square_wave);

%%

% TRiangular wave

tri_wave = sawtooth(x, 0.5);

plot(t, tri_wave);


