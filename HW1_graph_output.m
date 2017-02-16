function [a] = HW1_graph_output( x,u )
plot(x,u(1,:),'-',x,u(30,:),'-',x,u(70,:),'-',x,u(100,:),'-')
title('Square-wave test')
xlabel('X')
ylabel('Amplitude(X)')
a=0;
end

