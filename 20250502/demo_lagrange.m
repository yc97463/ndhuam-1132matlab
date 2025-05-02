function demo_lagrange()
% 節點
x = [-1, 0, 1, 2];
v = linspace(-2, 3);
i = 1 % 第一個節點帶進來會是 1
y = lagrange_poly(v, x, i);
plot(v, y);

y_knot = lagrange_poly(x, x, i);
hold on; plot(x, y_knot, 'o'); % 畫出點位
line([-2, 3], [0, 0]);
% x range, y range