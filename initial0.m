function val = initial0(x)
%  enter the function you want in val
%  
  val= 0.5*(cos(5.*pi.*x)+cos(0.5*pi.*x)-cos(pi.*x)-cos(3.*pi.*x)); % C infinity cn dispersion, fu dissipation
%   val= cos(200.*x)+cos(50.*x)+cos(100.*x)+cos(300.*x);
%  val=  2* cos(5*pi.*x);% Dissipation

%  val=  5* cos(10*pi.*x);
%  val = 0.5-0.5.*(x<-0.5)+0.5.*(x<0)-0.5.*(x<0.5); % Square Wave discontinuous 
%  val = (x<=-0.5).*(2.*x+2)+(x<=0 & x>-0.5).*(-2.*x)+(x>0 & x<0.5).*(2.*x)+(x>=0.5 & x<=1).*(2-2.*x); %C 0 continuous;
%  val=1; %test for constant solution