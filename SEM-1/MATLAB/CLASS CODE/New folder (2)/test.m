clc; clear all;

time120(1) = 4*60;
timeend = time120(1)+12*60;

i = 1;
 
while time120(i) < timeend
    i = i+1;
    time120(i) = time120(i-1)+ 180*2/11 + 20;
end

disp(time120)

