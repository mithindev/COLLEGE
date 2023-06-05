t = linspace(0, 1, 1024);
y = sin(2*pi*t*5);


Area = 0;

for i=1:1024
    Area = Area + y(i);
end

disp(Area)
plot(t, sin(2*pi*t*5))

%%
freq = 5;
t = linspace(0, 1, 1025);
dt = 1/1024;

y1 = sin(2*pi*freq*t);
y2 = sin(2*2*pi*freq*t);

y = y1.*y2;

plot(t, y1.*y2)

Area = 0;
for i = 1:1024
    Area = Area + y(i)*dt;
end

disp(Area)
