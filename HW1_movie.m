% Enter 1 result here for example:
HW1_3_Crank_Nicholson_1_way_wave( 1, 1, 1, 1000)
h = plot(x1, u1(1,:), 'EraseMode', 'xor');
axis([0 1 -inf inf]);			% 设定做图坐标范围
grid on                         % 画出网格
for i = 1:(length(t1)-1)
	y = u1(i,:);
	set(h, 'ydata', y);			% 设定新的数值结果
	drawnow                     % 立即做图
end