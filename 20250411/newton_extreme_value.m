% 牛頓法找出 f(x) = 0 的根
s = '(x - tanh(2*x + 10)).^2';         % 定義函數 s，欲找出其根（零點）
syms x;                                % 宣告符號變數 x

ss = "diff(" + s + ")";               % 構造導數的字串
s = eval(ss);                         % 計算出導函數的表達式
f = inline(s);                        % 將導函數轉為可呼叫的函數物件 f

ss = "diff(" + string(s) + ")";       % 再次對導函數進行微分（求二階導）
s1 = eval(ss);                        % 計算二階導函數的表達式
f1 = inline(s1);                      % 將二階導函數轉為可呼叫的函數物件 f1

x_zero = -4;                          % 初始猜測值，牛頓法從這裡開始

while ~(abs(f(x_zero)) < 10^-6)       % 當函數值尚未逼近 0（誤差大於容忍範圍）時繼續迴圈
    if abs(f1(x_zero)) < 10^-6        % 如果導數太小，會造成除以零的問題
        display("zero derivative")    % 顯示警告訊息
        break                          % 跳出迴圈
    end

    x_zero = x_zero - f(x_zero) / f1(x_zero); % 牛頓法公式更新 x 的值
    fprintf('x_zero = %f f(x) = %f\n', x_zero, f(x_zero)); % 顯示當前解與函數值
end
