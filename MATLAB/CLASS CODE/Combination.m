% Combination
clc; clear all; close all;



n=5;
r=3;
% 5c3=10
N=2^n;
range=0:1:N-1;
bin_array=dec2bin(range,n,'right-msb');
NCR=[];
k=0;
for i=1:N
x=bin_array(i,:);
if sum(x)==r ;
NCR=[NCR; x];
end
end
NCR