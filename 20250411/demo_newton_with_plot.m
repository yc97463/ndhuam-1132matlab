function demo_newton_with_plot()
    syms x

    % 定義函數與導數
    f_sym = x^2 - 5*x + 6;         % symbolic 表示式
    f = matlabFunction(f_sym);     % 匿名函數
    f1 = matlabFunction(diff(f_sym)); % 導數函數

    % 初始值
    x_zero = rand;

    % 牛頓法迴圈
    max_iter = 1000; count = 0;
    while abs(f(x_zero)) > 1e-6 && count < max_iter
        x_zero = x_zero - f(x_zero)/f1(x_zero);
        count = count + 1;
    end


    % 繪圖
    range = 2*pi;
    fplot(f, [-range, range]);        % 繪製原始函數
    hold on
    plot([-range range], [0 0], 'r'); % x 軸
    plot(x_zero, f(x_zero), 'ro');    % 牛頓解的結果

    title('牛頓法找根結果')
    legend('f(x)', 'x-axis', '根 x_0')
    grid on
end
