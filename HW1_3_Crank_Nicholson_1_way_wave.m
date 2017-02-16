function [ x1, t1, u1 ] = HW1_3_Crank_Nicholson_1_way_wave( xmax, tmax, c, xstep)
%HW1_3_Crank_Nicholson
%xmax=1;tmax=1;c=1;xstep=10;
tstep=xstep;
%   Start from x=0, t=0, enter the maximum of x and time in xmax,tmax
%   Enter the speed of wave in c.
%   Then Enter how many intervals of x and time you want in xstep and tstep
%   entering the function of u0=u(x,0) and u1=u(0,t) in the document
%   initial0, initial1 in the folder
hx = xmax/xstep; %step length of x
ht = tmax/tstep; %step length of t
lambda=c*ht/(4*hx);
x=0:hx:xmax;
t=0:ht:xmax;
u=zeros(tstep+1,xstep+1);
P=zeros(tstep,xstep);
Q=zeros(tstep,xstep);
F1=zeros(1,xstep);
F2=zeros(1,xstep);
func1= @initial0;
func2= @initial1;
%Setting Up initian Condition
for i=1:(xstep+1)
    u(1,i)=func1(x(i));
    u(tstep+1,i)=func2(tmax-c*hx*(i-1));% Setting boundary condition at tmax
end

for k=1:(tstep+1)
    u(k,1)=func2(t(k));
    u(k,xstep+1)=func1(xmax-c*ht*(k-1));% Setting boundary condition at xmax
end

%Setting up Matrix For P*V(k+1)=Q*V(k) + F
one_vector=ones(1,xstep);
lambdas_vector=lambda*ones(1,xstep-1);
P=diag(one_vector)+diag(lambdas_vector,1)+diag(-lambdas_vector,-1);
% P(tstep,xstep)=1+lambda;
Q=diag(one_vector)+diag(lambdas_vector,-1)+diag(-lambdas_vector,1);
for k=1:(tstep-1)
    F1(1,1)=-lambda*u(k+1,1);
    F1(1,xstep)=lambda*u(k+1,xstep+1);
    F2(1,1)=lambda*u(k,1);
    F2(1,xstep)=-lambda*u(k,xstep+1);
    F=F2-F1;
    newU=(P\(Q*u(k,2:xstep+1)'+F'));
    u(k+1,2:xstep+1)=newU(1:xstep,1)';
end
u1=u(2:(xstep+1),2:(tstep+1));
x1=x(2:(xstep+1));
t1=t(2:(tstep+1));
end

