function val = int3_1(x0)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
 k=1;%k can be changed
 val = sin((k)*pi*x0); % C infinity continuous
% val = 0.5.*(x>0.5)+x.*(x<=0.5); %C 0 continuous;
% val=1; %test for constant solution