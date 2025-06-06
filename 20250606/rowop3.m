function B = row_op3(A, i, j, s)
% ROW_OP3   Type‐III row operation: add s times row j to row i.
%   B = ROW_OP3(A, i, j, s)
%   輸入 A: 任意 m×n 矩陣  
%       i, j: 要做 add‐and‐replace 的列索引 (1 ≤ i, j ≤ m)  
%       s:  要乘到第 j 列上的純量  
%   輸出 B: 矩陣 A 經過 Row_i ← Row_i + s·Row_j 後之結果

    % —— (1) 參數檢查 —— 
    [m, ~] = size(A);
    if ~isscalar(i) || i < 1 || i > m || floor(i)~=i
        error('row_op3: 第 i 列索引須是 1 到 %d 的整數！', m);
    end
    if ~isscalar(j) || j < 1 || j > m || floor(j)~=j
        error('row_op3: 第 j 列索引須是 1 到 %d 的整數！', m);
    end
    if ~isscalar(s)
        error('row_op3: 標量 s 必須是一個純量數值！');
    end

    % —— (2) 執行 add‐and‐replace —— 
    B = A;  
    B(i, :) = B(i, :) + s * B(j, :);
end
