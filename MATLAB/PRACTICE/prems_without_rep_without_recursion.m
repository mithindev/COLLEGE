str = 'ABCD';
str1 = [str(1)];

for i = 2:length(str)
    ch = str(i);
    str2 = [];
    for j = 1:length(str1)
        temp = str1(j,:);
        inserted = insertChar(temp, ch);
        str2 = [str2;inserted];
    end
    str1 = str2;
end
disp(str1)

function [output] = insertChar(str, ch)
    for i = 1:length(str)+1
        if i == 1
            str1 = strcat(ch,str);
        elseif i < length(str)
            str1 = strcat(str(1:i-1),ch);
            str1 = strcat(str1,str(i:end));
        else
            str1 = strcat(str, ch);
        end
        output = [output;str1];
        str1 = [];
    end
end
