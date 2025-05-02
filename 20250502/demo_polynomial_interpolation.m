function demo_polynomial_interpolation()
close all

% 取樣
x_zeros = [-1 0 1 2];
target_p = poly(x_zeros); % 由四個節點所定義的圖

% line for default 4 points [-1, 0, 1, 2]
a = linspace(-2, 2);
plot(a, polyval(target_p, a), 'b');
hold on;
line(x_zeros, polyval(target_p, x_zeros));

% the random points
x = rand(1, 4)* 4 - 2; % 4 個節點不限定是整數，所以隨機指定
y = polyval(target_p, x); % target 多項式
plot(x, y, 'o');
v = linspace(-2, 2); %指定範圍
z = int_poly(v, x, y); % 做多項式內差
plot(v, z);
plot(x_zeros, int_poly(x_zeros, x, y), '*');

function ans = lagrange_poly2(v, x, i)
    n = length(x);
    xzeros = [x(1:i-1) x(i+1:n)];
    pi = poly(xzeros);
    c = polyval(pi, x(i));
    pi = pi/c;
    ans = polyval(pi, v);

function z = int_poly(v, x, y)
    z = zeros(size(v));
    n = length(x);
    for i = 1:n
        i_term = y(i)* lagrange_poly(v, x, i);
        z = z + i_term; % 將 tern_i 累加到 z 裡
    end
