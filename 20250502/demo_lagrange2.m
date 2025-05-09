function demo_lagrange2()
x = [-1, 0, 1, 2];
i = 2; n = length(x); % 更新 i = node 節點
xzeros = [x(1:i-1) x(i+1:n)] % 把第 i 個去除掉
pi = poly(xzeros); % 累乘用內建函數
c = polyval(pi, x(i));
pi = pi/c;
v = linspace(-2, 3);
plot(v, polyval(pi, v), 'r');
hold on; plot(x, polyval(pi, x), 'o'); % 畫出點位
line([-2, 3], [0, 0]);
title(string(i) + "lagrange polynomial");