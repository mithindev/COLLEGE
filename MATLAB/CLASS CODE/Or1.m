% OR GATE

function output = Or1(a,b)

out = -1;
if (a+b == 0)
    out = 0;
elseif (a + b == 1)
    out = 1;
elseif (a + b == 2)
    out = 1;
end

output = out;

end
