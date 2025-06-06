function demo_20250523_example_2()
   s='x.^2-5*x+6';
   f=inline(s); x=sym('x');
   ss="diff(" + s + ")";
   s1=eval(ss);
   f1=inline(s1); x_zero=rand*4;
   while ~( abs(f(x_zero))< 10^-6)
       x_zero=x_zero-f(x_zero)/f1(x_zero);
       fprintf('x_zero = %f f(x) = %f\n',x_zero, f(x_zero));
   end
   display(f(x_zero))