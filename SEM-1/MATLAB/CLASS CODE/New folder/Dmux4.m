%1-4 DMUX

function [D0, D1, D2, D3] = Dmux4(in, S1, S0)

n0 = Not1(S0);
n1 = Not1(S1);

D0 = And(And1(n0,n1), in);
D1 = And(And1(n1,S0), in);
D2 = And(And1(S1,n0), in);
D3 = And(And1(S1,S0), in);


end