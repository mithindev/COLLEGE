% PERMS WITHIOUT REPETITION

%%
clc; clear all; close all;

A = ['ABCD'];
F = [];

for i = A
    for j = A(A~=i)
        for k = A(A~=j & A~=i)
            for l = A(A~=i & A~=j & A~=k)
                F = [F; i j k l];
            end
        end
    end
end

disp(F)

%%

clc; clear all; close all;

str = 'ABCD';
no_of_iter = length(str);
s1 = [str(1)];
for i = 2:no_of_iter
    ch = str(i);
    ans = [];
    for each_div = 1: length(s1)
        temp_ans = s1(each_div,:);  % something of type 'SDFEF'
        ins = insertChar(s1, ch);
        ans = [ans; ins];
    end
    s1 = ans;
end
disp(s1)



