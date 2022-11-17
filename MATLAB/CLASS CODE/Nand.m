% NAND GATE

clear; close all; clc;

function output = nand(a, b)

AND = and(a, b);

NAND = not(AND);

output = NAND;

end
