function [ x1, t1, u1 ] = HW1_1_Forward_Central_1_way_wave( xmax, tmax, c, xstep,tstep)
%HW1_1_FORWARD_CENTRAL
%   Start from x=0, t=0, enter the maximum of x and time in xmax,tmax
%   Enter the speed of wave in c.
%   Then Enter how many intervals of x and time you want in xstep and tstep
%   entering the function of u0=u(x,0) and u1=u(0,t) in the document
%   initial0, initial1 in the folder
hx = xmax/xstep; %step length of x
ht = tmax/tstep; %step length of t
lambda=c*ht/(2*hx);
x=0:hx:xmax;
t=0:ht:xmax;
u=zeros(tstep+1,xstep+1);
func1= @initial0;
func2= @initial1;
%Setting Up Initial Condition
for i=1:(xstep+1)
    u(1,i)=func1(x(i));
end
for k=1:(tstep+1)
u(k,1)=func2(t(k));
u(k,xstep+1)=func1(xmax-c*ht*(k-1));% I cheat a little by setting boundary condition at xmax
end

%Solving with Forward Center
for k=1:(tstep)
  for i=2:(xstep)
    u(k+1,i)=u(k,i)-lambda*(u(k,i+1)-u(k,i-1));
  end
end  
u1=u(2:(xstep+1),2:(tstep+1));
x1=x(2:(xstep+1));
t1=t(2:(tstep+1));
end

