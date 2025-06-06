function demo_250523_check_1()

   %ex_use_RE = 1;   				
   ex_use_RE = 0;
   %ex_use_symbolic = 0;			
   ex_use_symbolic = 1;

   if ex_use_RE
       para_RE = 1;
       para_symbolic = 0;
       fprintf('用RE法微分\n')
   end
   if ex_use_symbolic
       para_RE = 0;
       para_symbolic = 1;
       fprintf('用符號法微分\n')
   end

   s  = 'x.^2-5*x+6';
   f  = inline(s); 
   x  = sym('x');
   ss = "diff(" + s + ")"; 
   s1 = eval(ss);
   f1 = inline(s1); 

   x_zero = rand*4;
   z  = linspace(-pi,pi);
   d  = f1(z) - RE(f,z);
   fprintf('兩法平均絕對誤差 = %s\n', num2str(mean(abs(d))))

   while ~( abs(f(x_zero)) < 10^-6)
       if para_symbolic
           x_zero = x_zero - f(x_zero)/f1(x_zero);
       end
       if para_RE
           x_zero = x_zero - f(x_zero)/RE(f,x_zero);
       end
       fprintf('x_zero = %f f(x) = %f\n',x_zero, f(x_zero));
   end
   display(f(x_zero))
end

%RE法公式
function f_plum = RE(f,x)
   h = 0.01;
   phy_h = (f(x+h)-f(x-h))/(2*h);
   phy_2h = (f(x+h/2)-f(x-h/2))/(2*h/2);
   f_plum = phy_2h+1/3*(phy_2h-phy_h);
end
