function demo_composite_sympson()
    % 辛普森積分法
    str = '(1-sin(x).^2).^(1/3)';
    f = inline(str);
    n = 100;
    b = pi; a = 0;
    h = (b-a)/(2*n);
    ans = 0;
    for i = 0:n -1
        aa = a + 2*i*h;
        cc = aa+h;
        bb = cc+h;
        ans = ans+h/3*(f(aa)+4*f(cc)+f(bb))
    end
    % fprintf('%10.9f\n', ans)
    fprintf('composite sympson: %15.14f\n', ans)
    ans2 = integral(@(x) (1-sin(x).^2).^(1/3), 0, pi)
    fprintf('matlab integral: %15.14f\n', ans2)