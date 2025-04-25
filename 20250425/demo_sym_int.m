function demo_sym_int()
    % 式子進行積分，在微分確認計算結果
    ss = input('function of x: ', 's');
    fx = inline(ss);
    x = sym('x');
    ss_ans = "int(" + ss + ")";
    ss1 = eval(ss_ans)

