function demo_newton()
    s = 'x.^2-5*x+6';
    f = inline(s); x = sym('x');
    ss = ['diff(''s'')'];
    s1 = eval(ss);
    f1 = inline(s1);
    x_zero = rand;
    while ~(abs(f(x_zero)   ) < 10^-6)
        x_zero = x_zero - f(x_zero)/f1(x_zero)
    end
    range = 2*pi; % 可調整參數
    plot([-range range], [0 0], 'r') % 劃一條橫軸
    hold on
    a = linspace(-range, range);
    plot(a, f(a));
    plot(x_zero, fx(x_zero), 'ro');

% 牛頓法
% 設計 while loop，設計停止條件