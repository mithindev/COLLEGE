%8-1 MUX

function output = Mux8(S2, S1, S0, D0, D1, D2, D3, D4, D5, D6, D7)

O1 = Mux4(S0, S1, D0, D1, D2, D3);
O2 = Mux4(S0, S1, D4, D5, D6, D7);

output = Mux2(S2, O1, O2);

end