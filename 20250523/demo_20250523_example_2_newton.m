function demo_20250523_example_2_newton()
% homework 牛頓法 (Newton's Method) 來尋找方程式 f(x)=0 的解(即方程的根)。這裡有兩種方式來計算 f(x) 的導數：一種是使用 符號微分 (Symbolic Differentiation)，另一種是使用 理查森外推法(Richardson Extrapolatio)
   para_RE=1;
   para_symbolic=0;

   ex_use_RE=1;       ex_use_RE=0;
   ex_use_symbolic=0;   ex_use_symbolic=1;

   if ex_use_RE
       para_RE=1;
       para_symbolic=0;
       fprintf('use RE diff...\n')
   end
   if ex_use_symbolic
       para_RE=0;
       para_symbolic=1;
       fprintf('use symbolic diff...\n')
   end
   s='x.^2-5*x+6';
   f=inline(s); x=sym('x');
   ss="diff(" + s + ")";
   s1=eval(ss);
   f1=inline(s1); x_zero=rand*4;
   z = linspace(-pi,pi);
   d = f1(z)-RE(f,z);
   mean(abs(d))
   while ~( abs(f(x_zero))< 10^-6)
       if para_symbolic
           x_zero=x_zero-f(x_zero)/f1(x_zero);
       end
       if para_RE
           x_zero=x_zero-f(x_zero)/RE(f,x_zero);
       end
       fprintf('x_zero = %f f(x) = %f\n',x_zero, f(x_zero));
   end
   display(f(x_zero))
end

function f_plum=RE(f,x)
   h=0.01;
   phy_h=(f(x+h)-f(x-h))/(2*h);
   phy_2h=(f(x+h/2)-f(x-h/2))/(2*h/2);
   f_plum=phy_2h+1/3*(phy_2h-phy_h);
end