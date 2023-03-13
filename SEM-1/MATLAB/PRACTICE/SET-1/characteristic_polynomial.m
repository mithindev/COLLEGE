clc;clear all;
A=randi([0,9],5,2)*randi([0,9],2,4);
B_=randi([1,9],5,1);
Xp=A\B_; 
D=null(A); 
n=input("n: ");   %A(Xn+Xp)=B+0
sol=[];
for i=1:n
x=randi([1 9],1,1);
y=randi([1 9],1,1);
Xn=x*D(:,1)+y*D(:,2);
final=Xn+Xp;
sol=[sol final];
end
sol
%%
clc;clear all;
A=randi([0,9],5,2)*randi([0,9],2,4)
B_=randi([1,9],5,1)
A(:,5)=B_
C=rref(A)

%%
clc; clear all;
A=randi([0 9],3,3)*randi([0 9],3,4)
c=null(A) % rns exists
d=null(A') %lns doesnt exist
%%
clc;clear all;
A=randi([0,9],4,2)*randi([0,9],2,4);
s=rref(A)
basis_set=s(1:rank(A),:)
%%
clc; clear all;
ran_k=input("rank: ");
rows=input("rows: ");
columns=input("columns: ");
A=randi([0,9],rows,ran_k)*randi([0,9],ran_k,columns)
s=rref(A)
basis_set=s(1:ran_k,:)
%%
clc;clear all;
A=randi([0,50],5,4)
s=rref(A)
B=s(1:rank(A),:)