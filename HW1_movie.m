% Enter 1 result here for example:
HW1_3_Crank_Nicholson_1_way_wave( 1, 1, 1, 1000)
h = plot(x1, u1(1,:), 'EraseMode', 'xor');
axis([0 1 -inf inf]);			% �趨��ͼ���귶Χ
grid on                         % ��������
for i = 1:(length(t1)-1)
	y = u1(i,:);
	set(h, 'ydata', y);			% �趨�µ���ֵ���
	drawnow                     % ������ͼ
end