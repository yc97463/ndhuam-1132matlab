function x = euler(fa, a, b, fx)
    % set f(x,t), fa, n, given a and b.
    n = 100;
    x = zeros(1, n);
    x(1) = fa;
    h = (b-a)/n;
    
    % for loop
    for i = 2:n+1
        t = a +(i-1)*h'
        x(i) = x(i-1) + h*fx(x(i-1), t);
    end
    
    plot(1:n+1, x)