% insert a char at any position of a string :-


%Ans = insertchar1('AB','C');
%disp(Ans)

function [S] = insertchar1(str,ch)

S = [];

for i = 1:length(str)+1
    if i == 1
       temp = strcat(ch,str);
    elseif i <= length(str)
        temp = strcat(str(1:i-1),ch);
        temp = strcat(temp,str(i:end));
    else
        temp = strcat(str,ch);
    end

    S = [S; temp];
    temp = [];
end

end

