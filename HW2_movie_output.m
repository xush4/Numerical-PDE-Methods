function [a] = HW2_movie_output( x, t, u1,u2 )
a=0;
h1 = plot(x, u1(1,:), 'b', 'EraseMode', 'xor');
hold on
h2 = plot(x, u2(1,:), 'r', 'EraseMode', 'xor');
hold off
axis([0 pi -2 2]);			
grid on                        
for k = 1:(length(t))  
    hold off;
	y1 = u1(k,:);
	set(h1, 'ydata', y1);			
	drawnow;                    
    hold on;
    y2 = u2(k,:);
    set(h2, 'ydata', y2);			
	drawnow;                     
    hold off;
    pause(0.1);                  
%   M(k) = getframe; %if we want to save this to avi or use movie function.
end
%   movie2avi(M,1,5) %if we want to save this to avi