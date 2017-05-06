function val = initial3_1(x)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
 k=1;%k can be changed
 val =(k)^2 * pi^2 * sin((k)*pi.*x); % C infinity continuous
% val = 0.5.*(x>0.5)+x.*(x<=0.5); %C 0 continuous;
% val=1; %test for constant solution