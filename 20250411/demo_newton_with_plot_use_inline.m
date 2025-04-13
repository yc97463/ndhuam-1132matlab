function demo_newton_oldschool()
    % 使用字串定義函數
    s = 'x.^2 - 5*x + 6';
    f = inline(s);  % 建立匿名函數

    % 將字串轉成 symbolic 表示式，做 symbolic 微分
    x = sym('x');
    f_sym = str2sym(s);     % 將 'x.^2 - 5*x + 6' 轉為 symbolic 表達式
    df_sym = diff(f_sym);   % 做微分
    s1 = char(df_sym);      % 轉回字串，給 inline 使用
    f1 = inline(s1);        % 導數函數（老派寫法）

    % 初始值
    x_zero = rand;

    % 牛頓法迴圈
    while abs(f(x_zero)) > 1e-6
        x_zero = x_zero - f(x_zero)/f1(x_zero);
    end

    % 繪圖
    range = 2*pi; % 可調整參數
    a = linspace(-range, range);
    plot(a, f(a));                     % 原始函數圖
    hold on
    plot([-range range], [0 0], 'r');  % 劃 x 軸
    plot(x_zero, f(x_zero), 'ro');     % 解的位置
    title('老派 Newton 法')
end
