% HALF ADDER

function [sum, carry]= HAdder1(a, b)

sum = Xor1(a,b);
carry = And1(a, b);

end


