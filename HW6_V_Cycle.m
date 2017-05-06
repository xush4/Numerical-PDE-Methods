function [x0] = HW6_V_Cycle( A, x0, b)
[~,n]=size(A);
N=n;
[out1] = HW5_Linear_GaussSeidel( A, x0, b);
x0=out1(2:N+1);

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

[m,n]=size(A);
N=n;
l=log2(N-1);
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

r_2h=P'*(b-A*x0);
A_2h=P'*A*P;
[~,n_2h]=size(A);
b_2h=zeros(n_2h,1);
if N<10
    e=A_2h\r_2h;
else
    e=HW6_V_Cycle(A_2h, r_2h, b_2h);
end
x0=x0+P*e;
end