% NOT GATE

clc; clear all; close all;


function output = not(a)

out = -1;
if a == 0
    out = 1;
elseif a == 1
    out = 0;
end

output = out;
end