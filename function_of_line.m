function [ f ] = function_of_line( x,y )
%FUNCTION_OF_LINE 
%  given a set of x and y, output the function of their lines;
len=length(x);
f= @(x0) 0;
for j=1:(len-1)
    k=(y(j)-y(j+1))./(x(j)-x(j+1));
    b=y(j)-k.*x(j);
    f_part= @(x0) (k.*x0+b).*(x0>x(j) & x0<=x(j+1));
    f=@(x0) f(x0)+f_part(x0);
end

end
%Test
%f=function_of_line( x,y );
%plot(x,f(x),'b')
%hold on
%g=@(x0) sin((k+0.5)*pi*x0);
%plot_x=0:0.01:1;
%plot(plot_x,g(plot_x),'r')

