A = [0 1 1 1 0;1 0 1 0 1;0 0 0 1 0;1 1 1 0 1;1 0 1 1 0]

r=5;c=5;
p=[];
for i=1:length(A')
    sum=0;
        for j=1:length(A)
        sum=sum+A(i,j);
        end
    p(i)=sum;
end

p
q=[];
for i=1:c
sum=0;
for j=1:r
sum=sum+A(j,i);
end
q(i)=sum;
end
q