fs= 'tanh(x)';
f=inline(fs);
range=5;
x=-range:0.01:range;
y=f(x);
plot(x,y);