function [out] = HW6_1_two_grid( A, x0, b)
%   

[m,n]=size(A);
N=n;
[out1] = HW5_Linear_GaussSeidel( A, x0, b);
x0=out1;

if(nargin==1)
    %N=100000;
    %[m,n]=size(A);
    x0=rand(n,1)*2-1;
    x1=x0;
    b=zeros(n,1);
end

if(nargin==2)
    %N=100000;
    %[m,n]=size(A);
    b=zeros(n,1);
end

M=0.5*(N+1);
P=zeros(N,M);

for row=1:N
    if mod(row,2)==1
        P(row,(row+1)/2)=1;
    else
        P(row, row/2)=0.5;
        P(row, row/2+1)=0.5;
    end
end

r=P'*(b-A*x0);
e=(P'*A*P)\r;
x0=x0+P*e;
out=HW5_Linear_GaussSeidel( A, x0, b,10);
end

