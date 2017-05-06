function [out] = HW6_1_multi_grid( A, x0, b)
  
[~,n]=size(A);
N=n;
[out1] = HW5_Linear_GaussSeidel( A, x0, b);
x0=out1;

N=n;
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
[~,n_2h]=size(A_2h);
b_2h=zeros(n_2h,1);
if N<10
    e=A_2h\r_2h;
else
    e=HW6_1_multi_grid(A_2h, r_2h, b_2h);
end

x0=x0+P*e;
out=HW5_Linear_GaussSeidel( A, x0, b,10);
end