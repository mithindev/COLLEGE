prompt1 = "input row :";
prompt2 = "input col :";
a = input(prompt1);
b = input(prompt2);

A = randi([1 9],a,b)

for row = 1:a
    for col = 1:b
        if col >= row
            A(row,col) = 0;
        end
    end
end

disp(A)
