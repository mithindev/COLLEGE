%1-8 DMUX

function [D0, D1, D2, D3, D4, D5, D6, D7] = Dmux8(in, S2, S1, S0)

[k1, k2] = Dmux2(in,S2);
[D0, D1, D2, D3] = Dmux4(k1, S1, S0);
[D4, D5, D6, D7] = Dmux4(k2, S1, S0);

end