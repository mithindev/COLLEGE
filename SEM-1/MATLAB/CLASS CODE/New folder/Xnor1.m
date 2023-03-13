% XNOR GATE

function output = Xnor1(a,b)
N1 = Not1(a);
N2 = Not1(b);
T1 = And1(a,N2);
T2 = And1(N1,b);

XOR = Or1(T1,T2);
XNOR = Not1(XOR);

output = XNOR;

end