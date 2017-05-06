function [ error,est_err, f_norm, answer, x1 ] = hw3_2a_Finite_Element( xmax, xstep,k,type )

%HW3_2A Finite element method for linear poison.
%type1 D
%xmax=1; xstep=8; k=1;
hx = xmax/xstep;
x1 = zeros(1,xstep+1);
x  = zeros(1,xstep);
x1=0:hx:xmax;
x=x1(2:xstep+1);
if type==1
    one_vector =2/hx*ones(1,xstep);
    one_vector(xstep) = one_vector(xstep)/2;
    one_vector2=1/hx*ones(1,xstep-1);
    A=diag(one_vector)-diag(one_vector2,1)-diag(one_vector2,-1);
    func1= @(x0) (k+0.5)^2 * pi^2 * sin((k+0.5)*pi.*x0);
    
end

if type==2
    one_vector =2/hx*ones(1,xstep-1);
    one_vector2=1/hx*ones(1,xstep-2);
    A=diag(one_vector)-diag(one_vector2,1)-diag(one_vector2,-1);
    %func1= @(x0) (k)^2 * pi^2 * sin((k)*pi.*x0);
    %We can change to other functions.
    %func1= @(x0) initial3_1(x0); %c_infinity
    %func1= @(x0) initial3_2(x0); %c_0
    func1= @(x0) initial3_3(x0); %disContinuous
end

%Calculate of b in Ax=b; 
if type==1
F_value=zeros(1,xstep);
answer = zeros(1,xstep+1);
    for j=1:(xstep-1)
        tri=@(a) triangularPulse(x1(j),x(j),x(j+1),a);
        new_fun=@(a) (tri(a) .* func1(a));
        F_value(j) = integral(new_fun, (x1(j)), (x(j+1)) );
    end
    tri=@(a) triangularPulse(x1(xstep),x(xstep),x(xstep)+hx,a);
    new_fun=@(a) (tri(a) .* func1(a));
    F_value(xstep)=integral(new_fun, (x1(xstep)), (x(xstep)) );
    answer(1,2:xstep+1) = (A \ F_value')';
end

if type==2
    F_value=zeros(1,xstep-1);
    answer = zeros(1,xstep+1);
    for j=1:(xstep-1)
        tri=@(a) triangularPulse(x1(j),x(j),x(j+1),a);
        new_fun=@(a) (tri(a) .* func1(a));
        F_value(j) = integral(new_fun, (x1(j)), (x(j+1)) );
    end
    answer(1,2:xstep) = (A \ F_value')';
end
%calculate answer with "/"

y=answer;
f=function_of_line( x1,y );
if type==1
    g=@(x0) sin((k+0.5)*pi*x0);%original function
end

if type==2
   %g=@(x0) sin((k)*pi*x0);
   %g=@(x0) int3_1(x0); %c_infinity
   %g=@(x0) int3_2(x0); %c_0
   g=@(x0) int3_3(x0); %disContinuous
   
end
plot_x=0:0.01:1;
plot(x1,f(x1),'r', plot_x,g(plot_x),'b')
axis([0 1 -1 1]);
legend('Approximation','Original') 
error=L2_function_error( x1,answer,k,type,g );
f_sq=@(x0) func1(x0).*func1(x0);
est_err=0.5*hx^2*sqrt(integral(f_sq,0,1));
f_norm=sqrt(integral(f_sq,0,1));
end