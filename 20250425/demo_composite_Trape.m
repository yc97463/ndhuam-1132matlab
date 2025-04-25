function demo_composite_Trapezoid()
    % 梯形切割
    str = 'exp(cos(x))';
    f = inline(str);
    n  = 100; % 切割等份
    a = 0; b = pi;
    h = (b-a)/n;
    ans = 1/2*(f(a) + f(b));
    for i = 1:n- 1
        ans = ans + f(a + i*h);
    end
    ans = ans * h;
    fprintf('%15.14f\n', ans)

    % graph
    a = linspace(-5, 5);
    plot(a, f(a))