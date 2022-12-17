% XOR GATE

function output = Xor1(a,b)
N1 = Not1(a);
N2 = Not1(b);

T1 = And1(a,N2);
T2 = And1(N1,b);

XOR = Or1(T1,T2);

output = XOR;

end
