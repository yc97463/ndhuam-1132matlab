function y = lagrange_poly(v, x, i)
% v: input value
% x: n distinct knots
% i: the i'th lagrance polynomical

y = ones(1, length(v)); %size(v));
n = length(x);
for j = 1:n
    if j ~= i
        term_j = (v - x(j))/(x(i)-x(j));
        % 做 polynomial
        y = y.*term_j;
    end
end