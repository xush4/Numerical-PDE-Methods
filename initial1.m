function val = initial1(x)

% enter the function you want in val
 val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
% val =cos(3.*x); % C infinity continuous
% val = 0.5.*(x>0.5)+x.*(x<=0.5); %C 0 continuous;
% val=1; %test for constant solution