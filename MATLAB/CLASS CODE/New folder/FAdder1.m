%FULL ADDER

function [sum, carry]= FAdder1(a, b, c)

sum = Xor1(Xor1(a,b),c);
S1 = And1(a, b);
S2 = And1(b, c);
S3 = And1(c, a);

carry = Or1(Or1(S1, S2),S3);

end