A = [2 4 6; 8 10 12];
B = [11 9; 7 5; 3 1];
ABans = A*B;
BAans = B*A;
time = [0.5 0.7 0.5 1.1 2.0];
speed = [15 16 18 15 14];
distance = time .* speed;
m = 155+20;
ke = 0.5*m*speed.^2;
C = reshape(1:8,4,2)';
Cans = C(:,[2,3]);
Cans;



D = reshape(1:9,3,3)';
Dans = D(2:3, 1:2);

row1 = [1 2 3 4];
row2 = [5 6 7 8];
E = [row1; row2];
col1 = [1; 2; 3];
col2 = [4; 5; 6];
F = [col1 col2];
G= magic(4);
Gans = transpose(G);
Gans2 = G'; % 反矩陣

H = eye(5);
I = diag([1 2 3 4 5]);
Gens3 = sum(G);
Gens4 = sum(G, 2);

J = linspace(0, 1, 5);
K = reshape(1:36, 4, 9);
Kans = K(2:4, 5:8);

L = reshape(1:12, 3, 4);
M = imread("images.jpeg");
imshow(M)

N = [1 2; 3 4];
m=2; n=3;
Nans = repmat(N, m, n);

a = 3; b = 1; c = 2;
O = reshape(1:16, 4, 4);
O = O(1:3, 1:4);
Oans = O([a b c],:);

P = reshape(1:16, 4, 4);
Pans = P(:, [a b c]);

Q = reshape(1:12, 3, 4);
Qans = sum(Q);
Qans2 = sum(Q, 2);
Qans3 = mean(Q);