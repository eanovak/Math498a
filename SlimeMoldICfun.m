function u0 = SlimeMoldICfun(x,P)

r = @(x) 1 + rand(1) * 0.01;
u0=[1; 1+r(x)];


