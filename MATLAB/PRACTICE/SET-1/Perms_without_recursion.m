clc; clear;

str = 'ABCD';
Ans = [str(1)];
for i = 2:length(str)
    ch = str(i);
    temp1 = [];
    for j = 1:length(str)
        temp2 = Ans(j,:);
        each_temp_insertion = insertchar(temp2,ch);
        temp1 = [temp1;each_temp_insertion];
    end
    Ans = temp1;
end

disp(Ans)
