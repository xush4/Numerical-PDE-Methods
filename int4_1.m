function val = int4_1(x)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
%k=1;%k can be changed
 val = 1*(x<0)+(1-x)*(x>=0 & x<=1)+0*(x>1); %1(b)
% val = 0*(x<0)+x*(x>=0 & x<=1)+1*(x>1); %1(a)
% val = 1*(x<=0)+ 0*(x>0) ; %2
 
 