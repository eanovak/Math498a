function [pl,ql,pr,qr] = SlimeMoldBCfun(xl,ul,xr,ur,t,P)
% No flux BCs on both sides
% recall the boundary conditions:
%
%p(x,t,u) + q(x,t)*f(x,t,u,du/dx)=0
%
% where f is the flux function

%LEFT BOUNDARY
pl = [0;0]; 
ql = [1;1];

%RIGHT BOUNDARY
pr = [0;0]; 
qr = [1;1];