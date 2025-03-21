% Generate a ramdom number
a = randi(100, 1);

% If it is even, divide by 2
if rem(a, 2) == 0
    disp(' a is even');
    b = a/2;
end