%2-1 MUX

function [a, b] = Dmux2(in, sel)

n1 = Not1(sel);
a = And1(n1, in);
b = And1(sel, in);

end