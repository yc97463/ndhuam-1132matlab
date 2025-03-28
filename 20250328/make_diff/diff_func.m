x = sym('x');
ss = 'x.^2'; % 將指令做成字串
inst = "diff("+ss+")" % 將指令做成字串

eval(inst)

% ans = 

2*x