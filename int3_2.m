function val = int3_2(x)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
%k=1;%k can be changed
 val = -((4.*x.^3-3.*x).*(x<=0.5)+(4.*(1.-x).^3+3.*x-3).*(x>0.5)); % C 0 continuous