%4-1 MUX

function output = Mux4(S1, S0, D0, D1, D2, D3)

n1 = Not1(S1);
n0 = Not1(S0);

A1 = And1(And1(n1,n0),D0);
A2 = And1(And1(n1,S0),D1);
A3 = And1(And1(S1,n0),D2);
A4 = And1(And1(S0,S1),D3);

O = Or1(Or1(Or1(A1,A2),A3),A4);

output = O;

end