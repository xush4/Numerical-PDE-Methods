function [a] = HW1_movie_output( x, t, u )
a=0;
h = plot(x, u(1,:), 'EraseMode', 'xor');
axis([0 1 -2 2]);			% �趨��ͼ���귶Χ
grid on                         % ��������
for i = 1:(length(t)-1)
	y = u(i,:);
	set(h, 'ydata', y);			% �趨�µ���ֵ���
	drawnow                     % ������ͼ
    pause(0.01)
end
