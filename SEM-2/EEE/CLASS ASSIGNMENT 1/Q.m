% Part - 1

% Assuming temerature is constant initially
% therefore, Delta(T) = 0

% V = i * R
% R = R0 ( 1 + a(delta(T)))
% initially R0 = 10 ohm

%%
% V v/s i

V = linspace(0, 240);
R = 10;

plot(V, V/R)
xlabel('Voltage')
ylabel('i')
title('V v/s i');

%%
% V v/s Power

V = linspace(0, 240);
R = 10;
i = V/R;
P = V.*i;
plot(V, P)
xlabel('Voltage')
ylabel('P')
title('V v/s Power');

%%
% i v/s power

V = linspace(0, 240);
R = 10;
R = 10;
i = V/R;
P = V.*i;
plot(i, P)
xlabel('current')
ylabel('P')
title('current v/s Power');

%%
%%
%Part - 2

%V v/s i

V = linspace(0, 240);
R = 10*(1 + (0.02)*10);

plot(V, V/R)
xlabel('Voltage')
ylabel('i')
title('V v/s i');

%%
% Voltage v/s Power

V = linspace(0, 240);
R = 10*(1 + (0.02)*10);

i = V/R;
P = V.*i;
plot(V, P)
xlabel('Voltage')
ylabel('P')
title('V v/s Power');

%%
% current v/s power

V = linspace(0, 240);
R = 10*(1 + (0.02)*10);

i = V/R;
P = V.*i;
plot(i, P)
xlabel('current')
ylabel('P')
title('current v/s Power');




