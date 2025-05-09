n = 100;
S = randperm(10*n); % 隨機產生到 1 - 1000 不重複的數字
num_A = S(1:n); % 取前 100 個數
x = num_A(randi(n)); % 隨機取索引值
fprintf('x is %d\n', x);
num_B = sort(num_A); % 排列一下

L = 1; %left
R = length(num_B); %right
count = 1;
display(num_B);
fprintf("init:\tL:%2d, R:%2d\n",L ,R);
k = 0;
while L <= R
    M = ceil((L+R)/2);
    if x > num_B(M)
        L = M+1;
    elseif x < num_B(M)
        R = M-1;
    else
        k = M;
        break;
    end
    fprintf("loop: %d, M: %2d, L: %2d, R: %2d,\n", count, M, L, R)
    count = count+1;
end

fprintf("The number at %2d is %2d\n", k, num_B(k));