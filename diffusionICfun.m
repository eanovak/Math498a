function u0 = diffusionICfun(x,P)

% Initial conditions for t=0;
% These CAN be a function of x
%u0 = 1;
u0 = -4*(x - 0.5)^2 + 1;