% Triangular wave

x = linspace(0, 4 * pi, 1000);
y(1000) = 0;
for i = 1:1000
    if (i<500)
        y(i) = x(i);
    else
        y(i) = 12.5 - x(i);
    end
end
plot(x, y);
title("Triangle wave");