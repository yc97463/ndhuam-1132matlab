function demo_minimum_fsolve()
    s = "(x-tanh(2*x+10)).^2";
    f = inline(s); z = linspace(-2*pi, 2*pi);
    plot(x, h(z)); hold on;
    plot([-2*pi 2*pi], [0 0])

    syms x;
    ss = "diff(" + s + ")";
    s = eval(ss);
    s = string(s); 
    ss = "fsolve(@(x) "+ s + ", -rand*5)"
    x_min = eval(ss)
    plot(x_min, h(x_min), 'o')
    eval(ss) 