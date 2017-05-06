function [a] = HW2_1(fun_type, graph_type, xmax,tmax,xstep)
% example to use this function:
% a=HW2_1(1,1,pi,pi,500);    %operator L1, not dissipative 
% a=HW2_1(1,2,pi,pi,500);    %operator L1, not dispersive 
                             %(Real part of different K travels at same speed)  

% a=HW2_1(2,1,pi,pi,1000);    %operator L2, dissipative
% a=HW2_1(2,2,pi,pi,1000);   %operator L2, not dispersive 
                             %(Real part of different K travels at same speed) 
                             
% a=HW2_1(3,1,pi,pi,500);    %operator L3, not dissipative
% a=HW2_1(3,2,pi,pi,500);    %operator L3, dispersive 
                             %(Real part of different K travels at different speed) 
                             
% fun_type1 du/dt+a*du/dx=0;
% fun_type2 du/dt+a*du/dx-D*(d^2)u/dx^2=0;
% fun_type3 du/dt+a*du/dx-mu*(d^3)u/dx^3=0;

% graph_type1 disspation
% graph_type2 dispersion
% After the movie is over, output a one.

tstep=tmax/xmax*xstep;
hx = xmax/xstep;
ht = tmax/tstep;
x=0:hx:xmax;
t=0:ht:xmax;
a=1;
A0=1;
D=0.1;
mu=3;
k1=3;
k2=5;

u1=zeros(tstep+1,xstep+1);
u2=zeros(tstep+1,xstep+1);
if fun_type==1
    w1=a*k1;
    w2=a*k2;
    real1= @(x,t) A0*cos(k1*x+w1*t);
    imag1= @(x,t) A0*sin(k1*x+w1*t);
    real2= @(x,t) A0*cos(k2*x+w2*t);
%   imag2= @(x,t) A0*sin(k2*x+w2*t);
elseif fun_type==2
    beta1=-D*k1^2;
    beta2=-D*k2^2;
    real1= @(x,t) A0*exp(beta1*t)*cos(k1*(x-a*t)); 
    imag1= @(x,t) A0*exp(beta1*t)*sin(k1*(x-a*t)); 
    real2= @(x,t) A0*exp(beta2*t)*cos(k2*(x-a*t)); 
%   imag2= @(x,t) A0*exp(beta2*t)*cos(k2*(x-a*t)); 
elseif fun_type==3
    w1= a*k1+mu*k1^3;
    w2= a*k2+mu*k2^3;
    real1= @(x,t) A0*cos(k1*x+w1*t);
    imag1= @(x,t) A0*sin(k1*x+w1*t);
    real2= @(x,t) A0*cos(k2*x+w2*t);
%   imag2= @(x,t) A0*sin(k2*x+w2*t);
end 
if graph_type==1 %dissipation
    for k=1:(tstep+1)
        for j=1:(xstep+1)
            u1(j,k)=real1(x(k),t(j));
            u2(j,k)=imag1(x(k),t(j));
        end
    end
elseif graph_type==2 %dispersion
    for k=1:(tstep+1)
        for j=1:(xstep+1)
            u1(j,k)=real1(x(k),t(j));
            u2(j,k)=real2(x(k),t(j));
        end
    end
end
h1 = plot(x, u1(1,:), 'b', 'EraseMode', 'xor');
hold on
h2 = plot(x, u2(1,:), 'r', 'EraseMode', 'xor');
hold off
axis([0 xmax -1.2 1.2]);			
grid on                        
for k = 1:(length(t))  
    hold off;
	y1 = u1(k,:);
	set(h1, 'ydata', y1);			
	drawnow;                    
    hold on;
    y2 = u2(k,:);
    set(h2, 'ydata', y2);			
	drawnow;                     
    hold off;
    if fun_type==2
        pause(0.1);  %smaller time gap for L2 
    else
        pause(0.2);
    end
%   M(k) = getframe; %if we want to save this to avi or use movie function.
end
%   movie2avi(M,1,5) %if we want to save this to avi
end

