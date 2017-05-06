function [x0, final, residue_ratio,residue,my_error] = HW5_Linear_GaussSeidel( A, x0, b, N)
% Ax=b. Solve x. 
% Jacobi method: B=D^(-1); 0<w<2/max{eigenvalue}.
% Direchlet Boundary

if(nargin==1)
    N=100;
    [m,n]=size(A);
    x0=rand(n,1)*2-1;
    x1=x0;
    b=zeros(n,1);
end

if(nargin==2)
    N=100;
    [m,n]=size(A);
    b=zeros(n,1);
end

if(nargin==3)
    N=100;
end

eps=10^(-8);
[m,n]=size(A);
if m~=n, error(' A matrix needs to be square'); end 

residue_ratio = zeros(N,1);
residue = zeros(N,1);
my_error=zeros(N,1);

for t=1:N
    out=x0; 
        for i=1:n
            temp=0;
            for j=(i-1):2:(i+1)
                if (j>=1 && j<=n)
                    temp=temp+A(i,j)*out(j);
                end
            end
            out(i)=(b(i)-temp)/A(i,i);
        end
    residue(t,1)=norm(b-A*out);
    my_error(t,1)=norm(A\b-out);
    residue_ratio(t,1) = norm(b-A*out)/norm(b-A*x0);
    x0=out;
    %if t<10
    %    continue;
    %elseif residue(t,1)<eps
    %    break;
    %end
end
% out2=zeros(n+2,1);
% out2(2:n+1,1)=x0;
final=residue_ratio(N,1);
end