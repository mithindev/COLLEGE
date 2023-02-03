clc; clear all;

time180(1) = 6*60;
timeend = time180(1)+12*60;

i = 1;

while time180(i) < timeend
    i = i+1;
    time180(i) = time180(i-1)+ 180*11/2
end
