

clear all;
n=5; % n item for combination
r=3; % taken r at a time
N=2^n; % create N number of n=5 bit binary numbers
X=[];
String = 'ABCDE';
for i=0:1:N-1
y=int2bit(i,n); % A binary column vector of tuple size n=5
if sum(y)==r; % if r one bits in the bit vector y
X=[X ; y']; % append as row vector
end
end
String1=[];
L=size(X,1); % number of rows which is number of combinations
for i=1:1:L
x=X(i,:); % take ith row
z=find(x); % find all indices where bits are 1
% Take out corresponding letters from string ‘ABCDE’ 
str=String(z)
String1= [String1; str]; % Append
end
String1
