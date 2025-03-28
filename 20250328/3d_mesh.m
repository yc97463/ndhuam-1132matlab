x = linspace(-1, 1);
y = linspace(-1, 1)'; % 轉置矩陣
X = repmat(x, 100, 1);
Y = repmat(y, 1, 100);
mesh(x, y, X.^2+Y.^2); 

% 畫一個 cos 的圖
x = linspace(-2*pi, 2*pi); % 加大寬度
y = linspace(-2*pi, 2*pi)'; % 轉置矩陣
X = repmat(x, 100, 1);
Y = repmat(y, 1, 100);
mesh(x, y, cos(X+Y)); 

% 繪製 dimension 取樣本點
XY = rand(500, 2)*4 *pi-2*pi;
Z = cos(XY)

% 可以延伸加雜訊、拉高維度