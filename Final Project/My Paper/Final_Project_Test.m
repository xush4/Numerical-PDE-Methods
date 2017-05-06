%% Pricing a European Option with a PDE method (finite volumes)
clear all;
sigma = 0.4;
r = 0.05;
K = 100;
T = 1;
n = 4;
type = 'call'; % 'call' or 'put'
[V, dtau, S]=Final_BS(K, sigma, r, T, type, n);


%% plot the option values
[m_size,n_size]=size(V);
figure(1);
mesh(S,0:dtau:T,V');
title('V(S,t)','fontweight','bold');
xlabel('Asset Price S','fontweight','bold');
ylabel('Time t','fontweight', 'bold');
zlabel('Option Value V','fontweight','bold');

figure(2);
index= find((S>=80) & (S<=120));
mesh(S(index),0:dtau:T,V(index,:)');
title('V(S,t) of S in [80,120]','fontweight','bold');
xlabel('Asset Price S','fontweight','bold');
ylabel('Time t','fontweight', 'bold');
zlabel('Option Value V','fontweight','bold');

figure(3);
index= find((S>=0) & (S<=200));
my_value_all=V(index,n_size)';
for i=1:length(index)
   price_here=S(index(i));
   if strcmp(type,'put')
       [~,matlab_value_all(i)] = blsprice(price_here,K,r,T,sigma);
   elseif strcmp(type,'call')
       [matlab_value_all(i),~] = blsprice(price_here,K,r,T,sigma);
   end
end
plot(S(index),my_value_all,'--r',S(index),matlab_value_all,'b')
title('V(S,t) at T=0','fontweight','bold');
xlabel('Asset Price S','fontweight','bold');
ylabel('Option Value V','fontweight','bold');
legend('FVM','Matlab') 
diff_all(1:length(index))=abs(my_value_all(1:length(index))-matlab_value_all(1:length(index)));
error1=max(diff_all);

figure(4);
index= find((S>=80) & (S<=120));
my_value=V(index,n_size)';
for i=1:length(index)
   price_here=S(index(i));
   if strcmp(type,'put')
       [~,matlab_value(i)] = blsprice(price_here,K,r,T,sigma);
   elseif strcmp(type,'call')
       [matlab_value(i),~] = blsprice(price_here,K,r,T,sigma);
   end
end
plot(S(index),my_value,'--r',S(index),matlab_value)
title('V(S,0) of S in [80,120] at T=0','FontWeight','bold');
xlabel('Asset Price S','fontweight','bold');
ylabel('Option Value V','fontweight','bold');
legend('FVM','Matlab') 
diff_100(1:length(index))=abs(my_value(1:length(index))-matlab_value(1:length(index)));
error2=max(diff_100)