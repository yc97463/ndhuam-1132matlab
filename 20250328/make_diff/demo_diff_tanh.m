function demo_diff_tanh()
x = sym('x');
ss = 'tanh(x)';
% fx = inline(ss);
f = inline(ss);

inst = "diff("+ss+")";
ss1 = eval(inst);
f1 = inline(ss1) % 一階導數算出來了

inst2 = "diff("+string(ss1)+")";
ss2 = eval(inst2);
f2 = inline(ss2) % 二階導數

inst3 = "diff("+string(ss2)+")";
ss3 = eval(inst3);
f3 = inline(ss3) % 三階導數

% graph

a = linspace(-2*pi, 2*pi);

% problem 1
plot(a, f(a)); hold on;
plot(a, f1(a), 'r');
plot(a, f2(a), 'k'); title("problem 1");
figure;

% problem 2

n = length(a);
c = 0;
for i = 1:n
    y(i) = f(c);
    y1(i) = f1(c)*(a(i)-c);
    y2(i) = f2(c)/2*(a(i)-c)^2;
    y3(i) = f3(c)/6*(a(i)-c)^3;
end
plot(a, f(a)); hold on;
plot(a, y, 'r'); title("one term");
figure;

plot(a, f(a)); hold on;
plot(a, y+y1, 'r'); title("two terms");
figure;

plot(a, f(a)); hold on;
plot(a, y+y1+y2, 'b'); title("three terms");
figure;

plot(a, f(a)); hold on;
plot(a, y+y1+y2+y3, 'g'); title("four terms");
figure;



