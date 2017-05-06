function [ error ] = L2_function_error( x,y,k,type,fun )
%L2_FUNCTION_ERROR 
% given new function and original function (initial3)
% output L2 error;
f=function_of_line( x,y );
if type==1
    g=@(x0) sin((k+0.5)*pi.*x0);
end

if type==2
    g=@(x0) fun(x0);
end
err_fun=@(x0) (f(x0)-g(x0)).^2;
error=(integral(err_fun, 0, 1 ))^0.5;

end

