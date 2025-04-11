function demo_minimum_finding()
    % 非限制式最佳化
    s = "(x-tanh(2*x+10)).^2"
    h = inline(s);
    
    z = linspace(-2*pi, 2*pi);
    plot(z, h(z)); hold on;
    
    syms x;
    ss = "diff(" + s + ")";
    s = eval(ss);
    f = inline(s);
    plot(z, f(z), 'b');
    ss = "diff("+ string(s) + ")";
    syms x
    s1 = eval(ss);
    f1 = inline(s1);
    x_zero = rand*4;
    while ~(abs(f(x_zero)) < 10^-6)
        x_zero = x_zero - f(x_zero) / f1(x_zero);
        fprintf('x_zero = %f f(x) = %f\n', x_zero, f(x_zero)); % 一階導數做微分
    end
    plot(x_zero, f(x_zero), 'ro')
