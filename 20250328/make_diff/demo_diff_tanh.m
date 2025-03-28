function demo_diff_tanh()
x = sym('x');
ss = 'tanh(x)';
fx = inline(ss);

inst = "diff("+ss+")";
ss1 = eval(inst);
fx1 = inline(ss1) % 一階導數算出來了

inst2 = "diff("+string(ss1)+")";
ss2 = eval(inst2);
fx2 = inline(ss2) % 二階導數

% graph

a = linspace(-2*pi, 2*pi);
plot(a, fx(a));
hold on;
plot(a, fx1(a), 'r');
plot(a, fx2(a), 'k');