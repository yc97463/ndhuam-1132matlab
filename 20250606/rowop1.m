function B = row_op1(A, i, s)
% ROW_OP1   Type‐I row operation: multiply the i‐th row of A by scalar s.
%   B = ROW_OP1(A, i, s)  
%   輸入 A: 任意 m×n 矩陣  
%       i: 要做操作的列索引 (1 ≤ i ≤ m)  
%       s: 要乘的標量  
%   輸出 B: 矩陣 A 經過第 i 列乘上 s 之後的結果

    % —— (1) 參數檢查（可選，但建議） ——
    [m, n] = size(A);
    if ~isscalar(i) || i < 1 || i > m || floor(i)~=i
        error('row_op1: 第 i 列索引必須是介於 1 到 %d 的整數！', m);
    end
    if ~isscalar(s)
        error('row_op1: 標量 s 必須是一個純量數值！');
    end

    % —— (2) 執行操作 —— 
    B = A;                % 複製一份，避免直接改到原本 A
    B(i, :) = s * B(i, :);

    % 注意：如果 s = 0，整列都會變成 0；如果 s ≠ 0，則此列的秩不變，可用於消去。
end


%function rowop1_lock(A, i, s)
    % Matrix A
    % Integer i / row
    % 標量 s
    % ith row * s of A matrix
%    A = [1 2 3l 4 5 6; 7 8 9];
%    A(i, :) = s*A(i, :); % 取出第 i 列 > A(i, :) 代表第 i 列的所有欄位，並且把修改結果放回矩陣裡
    %i = 2;
    %s = 3;
%    B = row_op1(A, i, s)