function demo_20250523_example_1()
   h=0.01;
   x=linspace(-3,3);
   f=inline('tanh(x)');
   phy_h=(f(x+h)-f(x-h))/(2*h);
   phy_2h=(f(x+h/2)-f(x-h/2))/(2*h/2);
   f_plum=phy_2h+1/3*(phy_2h-phy_h);
   plot(x,f_plum,'g');hold on;
   x=sym('x');
   f=inline('tanh(x)');
   sx=diff(tanh(x));
   fx=inline(sx);
   a=linspace(-3,3);
   plot(a,f(a),'b');hold on;plot(a,fx(a),'g')
   mean((f_plum-fx(a)).^2)