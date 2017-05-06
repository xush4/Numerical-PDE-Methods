function [ u1,x1,t ] = HW4_Finite_Vol_Inviscid_Burgers( xstart, xend, tmax, xstep,tstep )
%HW4_FINITE_VOL_INVISCID_BURGERS 此处显示有关此函数的摘要
%   Start from xstart, t=0, enter the maximum of x and time in xend,tmax
%   Then Enter how many intervals of x and time you want in xstep and tstep
%   entering the function of u0=u(x,0) in the document int4_1.
%   Test: xstart=-5;xend=5;tmax=1;xstep=1000;tstep=200;
%         set 1(a) for int4_1;

% x0=-1; x2=3;   % range of plot 1_a
%                  xstart=-5;xend=5;tmax=1;xstep=500;tstep=200;

 x0=-0.5;x2=1.5;% range of plot 1_b
%                  xstart=-5;xend=5;tmax=2;xstep=1000;tstep=200;

% x0=-1;x2=1;    % range of plot 2
%                1 xstart=-5;xend=5;tmax=1;xstep=1000;tstep=200;
%                2 xstart=-5;xend=5;tmax=1;xstep=1000;tstep=100;
%violating stable condition                
%                3 xstart=-5;xend=5;tmax=1;xstep=1000;tstep=50;
%                4 xstart=-5;xend=5;tmax=1;xstep=1000;tstep=200; ul=2;
%                5 xstart=-5;xend=5;tmax=1;xstep=1000;tstep=200; ul=0.5;

xmax=xend-xstart;
hx = xmax/xstep; %step length of x
ht = tmax/tstep; %step length of t
lambda=ht/(hx);
x=xstart:hx:xend;
num_start=(x0-xstart)/hx+1;
num_end=(x2-xstart)/hx+1;
t=0:ht:tmax;
u=zeros(tstep+1,xstep+1);
u0_fun= @int4_1;
%Setting Up Initial Condition
for i = 1:(xstep+1)
    u(1,i)=u0_fun(x(i));
end;
for j = 2: (tstep+1)
    u(j,1)=u0_fun(xstart);
    u(j,tstep+1)=u0_fun(xend);
end;
for k = 1:(tstep)
    for l = 2:(xstep)
        f_star1=0.25*(u(k,l)^2+u(k,l+1)^2)-...
            0.25*abs(u(k,l)+u(k,l+1))*(u(k,l+1)-u(k,l));
        f_star0=0.25*(u(k,l-1)^2+u(k,l+1-1)^2)-...
                0.25*abs(u(k,l-1)+u(k,l+1-1))*(u(k,l+1-1)-u(k,l-1));
        u(k+1,l) = u(k,l)-lambda*(f_star1-f_star0);
    end;
end;
x1 = x(num_start:num_end);
u1 = u(:, num_start:num_end);
end

