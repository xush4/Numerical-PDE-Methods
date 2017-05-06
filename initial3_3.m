function val = initial3_3(x)

% enter the function you want in val for hw3
% val = initial0(-x);
% val = 1.*(x<0.5)+0.*(x>0.5)+0.5.*(x==0.5); %discontinuous
%k=1;%k can be changed
 val = 2.2 .*(2.*(x<=0.5)+4*(x>0.5));  %not continuous
% plot_x=0:0.01:1;
% g=@(x0) initial3_3(x0); %c_0
% plot(plot_x,g(plot_x),'b')