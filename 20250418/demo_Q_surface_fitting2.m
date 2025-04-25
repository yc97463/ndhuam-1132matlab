function demo_Q_surface_fitting()
    % 定義一個二次函數（字串形式），x1 和 x2 是變數
    ss = "3*x1.^2-1.5*x1.*x2-2*x2.^2+2*x1-2*x2+4";  
    
    plot_Q_surface(ss);  % (未提供的函數) 畫出原始的理論曲面，不含雜訊
    
    [x, y] = sampling_Q_Sur(ss);  % 產生隨機樣本資料點（含雜訊）
    
    figure  % 開啟新圖形視窗
    plot3(x(1,:), x(2,:), y, '.'); hold on  % 畫出原始資料點的3D散點圖
    
    [Y_hat, c] = QS_fitting(x, y);  % 對資料做二次曲面擬合，得到預測值與係數
    
    % 畫出擬合後的 y 值，用圈圈 'o' 標示
    plot3(x(1,:), x(2,:), Y_hat, 'o')  % 檢查擬合程度
end

% ========== 擬合函數 ==========
function [Y_hat, c] = QS_fitting(x, y)
    N = size(x, 2);  % 取樣點數 N（x 是 2xN 的矩陣）

    % 構造二次項的設計矩陣（每一列是一個 basis term）
    X1 = transpose(x(1,:).^2);        % x1^2
    X2 = transpose(x(1,:).*x(2,:));   % x1 * x2
    X3 = transpose(x(2,:).^2);        % x2^2
    X4 = transpose(x(1,:));           % x1
    X5 = transpose(x(2,:));           % x2
    X6 = ones(N,1);                   % 常數項

    % 合併成設計矩陣 X（N x 6）
    X = [X1 X2 X3 X4 X5 X6];  
    
    y = y';  % y 轉成列向量（N x 1）
    
    c = pinv(X)*y;  % 最小平方法計算係數（pseudo inverse）
    Y_hat = X*c;    % 用模型預測 Y 值
end

% ========== 取樣與加雜訊 ==========
function [x, y] = sampling_Q_Sur(ss)
    % ss 是函數表達式（字串），跟主程式一致
    ss = "3*x1.^2-1.5*x1.*x2-2*x2.^2+2*x1-2*x2+4";  
    
    N = 200;   % 資料點數量
    d = 2;     % 維度（x1 和 x2）
    
    x = rand(d, N)*2*pi - pi;  % 在 [-π, π] 範圍內隨機取樣點 (2 x N)
    
    noise = rand(1,N)*0.2 - 0.1;  % 加入範圍為 [-0.1, 0.1] 的雜訊
    
    f = inline(ss);  % 把字串轉成函數
    
    % 用 f 計算每個 (x1,x2) 的真實 y 值（不含雜訊）
    y = f(x(1,:), x(2,:));  
    
    y = y + noise;  % 將雜訊加入 y 值
end