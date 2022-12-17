%2-1 MUX

function output = Mux2(S0,D0,D1)

o1 = Not1(S0);
o2 = And1(o1,D0);
o3 = And1(S0, D1);

O = Or1(o2,o3);

output = O;

end