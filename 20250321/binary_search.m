% For and While looping

x = ones(1, 10);
for n = 2:6
    x(n) = 2 * x(n-1);
end
x

% 算階層的迴圈
n = 1;
nFactorial = 1;
while nFactorial < 100
    n = n + 1;
    nFactorial = nFactorial * n; % 階層的概念
    fprintf('n=%d n!=%f\n',n,nFactorial)
end
fprintf('n=%d n!=%f\n',n,nFactorial)

% 產生一個矩陣，並且處理 mxn 格的運算
A = zeros(5,100);
for m = 1:5
    for n = 1:100
    A(m, n) = 1/(m + n - 1);
    end
end

