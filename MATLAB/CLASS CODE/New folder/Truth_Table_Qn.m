Table = [0 0;0 1;1 0;1 1];

And_Table = ["A" "B" "OUT"];

for i = 0:1
    for j = 0:1
        And_Table = [And_Table;i j And1(i,j)];
    end
end

And_Table

%%

Or_Table = ["A" "B" "OUT"];

for i = 0:1
    for j = 0:1
        Or_Table = [Or_Table;i j Or1(i,j)];
    end
end

Or_Table

%%

Xor_Table = ["A" "B" "OUT"];

for i = 0:1
    for j = 0:1
        Xor_Table = [Xor_Table;i j Xor1(i,j)];
    end
end

Xor_Table
