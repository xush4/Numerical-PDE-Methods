function val = initial3_2(x)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
%k=1;%k can be changed
 val = 24.*x.*(x<=0.5)+24.*(1.-x).*(x>0.5); % C 0 continuous