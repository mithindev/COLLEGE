%permutation without recursion;

X = myperms([2 3 5])
function P = myperms(sample)
    len = numel(sample); % num of elements
    if len <= 1
        P = sample ;
    else
        P = zeros(factorial(len),len);
        L = 1:factorial(len-1);
        for i = len:-1:1
            P(L,1) = sample(i);
            P(L,2:len) = myperms(sample(setdiff(1:len,i)));
            L = L + factorial(len-1);
        end
    end

end
