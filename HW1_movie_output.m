function [a] = HW1_movie_output( x, t, u )
h = plot(x, u(1,:), 'EraseMode', 'xor');
axis([0 1 -inf inf]);			% 设定做图坐标范围
grid on                         % 画出网格
for i = 1:(length(t)-1)
	y = u(i,:);
	set(h, 'ydata', y);			% 设定新的数值结果
	drawnow                     % 立即做图
end
