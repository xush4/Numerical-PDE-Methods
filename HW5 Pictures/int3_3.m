function val = int3_3(x)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
%k=1;%k can be changed
 val = -2.2 .*((x.^2-5/4.*x).*(x<=0.5)+(2.*x.^2-9/4.*x+1/4).*(x>0.5)); % C 1 continuous