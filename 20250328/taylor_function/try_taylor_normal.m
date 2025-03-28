% Taylor expansion
function try_taylor_normal()
x = linspace(0.6, 1.4, 500);
n = length(x);

c = 1;
for i = 1:n % 一個點一個點處理
    y1(i) = the_normal(c);
    % 做微分
    y2(i) = -2*c*the_normal(c)*(x(i)-c);
    y3(i) = (4*c^2-2)*the_normal(c)/2*(x(i)-c^2);
    y4(i)=(12*c-8*c^3)*the_normal(c)/6*(x(i)-c)^3;
end
plot(x,the_normal(x));hold on;plot(x,y1,'r'); title('one term'); % only y1
figure; plot(x,the_normal(x));hold on;plot(x,y1+y2,'r');title('two terms'); % y1+ y2 紅色逼近藍色的，用二次式來逼近他
figure; plot(x,the_normal(x));hold on;plot(x,y1+y2+y3,'r');title('three terms'); % y1+ y2+ y3
figure; plot(x,the_normal(x));hold on;plot(x,y1+y2+y3+y4,'r');title('four terms'); % 四個維度的