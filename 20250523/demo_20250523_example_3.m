function demo_20250523_example_3()
   s1='3*x1-cos(x2*x3)-1/2';
   s2='x1^2-81*(x2+0.1)^2+sin(x3)+1.06';
   s3='exp(-x1*x2)+20*x3+1/3*(10*pi-3)';
   x1=sym('x1');x2=sym('x2');x3=sym('x3');
   f=inline([str2sym(s1);str2sym(s2);str2sym(s3)]);
   A=jacobian([str2sym(s1);str2sym(s2);str2sym(s3)],[x1 x2 x3]);
   j=inline(A);
   x=rand(3,1)-0.5;
   y=f(x(1),x(2),x(3))
   ans1=j(x(1),x(2),x(3));
   ans2=f3_RE(f,x);
   mean(mean(abs(ans1-ans2)))

   function ans = f3_RE(f,x)
       ans = [];
       for i = 1:3
           ans = [ans RE(f,x,i)];
       end

   function f_plum = RE(f,v,i)
       h=0.01;
       xp = v;
       xm = v;
       xp(i) = v(i) + h;
       xm(i) = v(i) - h;
       phy_h=(f(xp(1),xp(2),xp(3))-f(xm(1),xm(2),xm(3)))/(2*h);
       xp(i) = v(i)+h/2;
       xm(i) = v(i)-h/2;
       phy_h2=(f(xp(1),xp(2),xp(3))-f(xm(1),xm(2),xm(3)))/(2*h/2);
       f_plum=phy_h2+1/3*(phy_h2-phy_h);