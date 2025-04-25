function plot_Q_surface(ss)
 ss = "x1.^2+x1.*x2+x2.^2"
f = inline(ss);
x1 = -pi:0.2:pi;
x2 = x1;
for i = 1:length(x1)
    y = f(x2,x1(i));
    C(i,:) = y;
end
 mesh(x1,x2,C);
 ss = "x1.^2+x1.*x2+x2.^2"