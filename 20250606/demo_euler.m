function demo_euler()
    % dependent variables
    % 倒數函數 t:x+exp(t)
    x = sym('x');
    t = sym('t');
    s = "x+exp(t)";
    fx= inline(s)

    % 套用函數
    a = 0; b = 2;
    fa = 1;
    xArray = euler(fa, a, b, fx) % 尤拉方法推算，時間從 0 到 2

    % 解微分方程 dsolve 指令
    y = dsolve('Dy = y+exp(t)','y(0)=1','t');
    fy = inline(y);
    hold on % 把圖疊在一起
    z = 0:0.01:2;
    plot(z, fy(z), 'r');

function x = euler(fa, a, b, fx)
    % set f(x,t), fa, n, given a and b.
    n = 100;
    x = zeros(1, n+1);
    x(1) = fa;
    h = (b-a)/n;
    
    % for loop
    for i = 2:n+1
        t = a +(i-1)*h'
        x(i) = x(i-1) + h*fx(t, x(i-1));
    end
    % plot(1:n+1, x)
    plot(a:h:b, x)
   