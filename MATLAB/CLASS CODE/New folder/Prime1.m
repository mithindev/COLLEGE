function output = Prime1(a)

out="not prime";
i = 2;
while i <= a/2
    if a == 0 || a == 1
        out="np";
        break
    elseif mod(a,i) == 0
        out = "np";
        break
    else
        i=i+1;
    end

    out = "prime";
end

output = out;
end