%% 4 Bases
theta = []
n=4
i = 0
while i<n 
    theta(i+1) = i*((2*pi)/n);
    i = i+1;
end
theta

bases = [cos(0*theta)/norm(cos(0*theta));
         cos(1*theta)/norm(cos(1*theta));
         cos(2*theta)/norm(cos(2*theta));
         sin(1*theta)/norm(sin(1*theta))]

signal = [1 2 3 4]
dft = bases*signal'
a = bases'*dft
%% 6 Bases
theta = []
n=6
i = 0
while i<n 
    theta(i+1) = i*((2*pi)/n);
    i = i+1;
end
theta

bases = [cos(0*theta)/norm(cos(0*theta));
         cos(1*theta)/norm(cos(1*theta));
         cos(2*theta)/norm(cos(2*theta));
         cos(3*theta)/norm(cos(3*theta));
         sin(1*theta)/norm(cos(1*theta));
         sin(2*theta)/norm(sin(2*theta));]
signal = [1 2 3 4 5 6]
dft = bases*signal'
a = bases'*dft