function B = row_op2(A, i, j)
% ROW_OP2   Type‐II row operation: swap row i and row j of A.
%   B = ROW_OP2(A, i, j)
%   輸入 A: 任意 m×n 矩陣  
%       i, j: 兩個要互換的列索引 (1 ≤ i, j ≤ m)  
%   輸出 B: 矩陣 A 經過第 i 與第 j 列互換後之結果

    % —— (1) 參數檢查 —— 
    [m, ~] = size(A);
    if ~isscalar(i) || i < 1 || i > m || floor(i)~=i
        error('row_op2: 第 i 列索引必須是 1 到 %d 的整數！', m);
    end
    if ~isscalar(j) || j < 1 || j > m || floor(j)~=j
        error('row_op2: 第 j 列索引必須是 1 到 %d 的整數！', m);
    end

    % —— (2) 執行互換 —— 
    B = A;                % 複製一份
    temp = B(i, :);
    B(i, :) = B(j, :);
    B(j, :) = temp;
end
