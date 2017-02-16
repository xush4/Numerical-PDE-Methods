function val = initial0(x)
%  enter the function you want in val
%  
  val= cos(3.*x); % C infinity
%  val = 0.5-0.5.*(x<-0.5)+0.5.*(x<0)-0.5.*(x<0.5); % Square Wave discontinuous 
%  val = (x<=-0.5).*(2.*x+2)+(x<=0 & x>-0.5).*(-2.*x)+(x>0 & x<0.5).*(2.*x)+(x>=0.5 & x<=1).*(2-2.*x); %C 0 continuous;
%  val=1; %test for constant solution