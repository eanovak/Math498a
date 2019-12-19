function [c,f,s] = SlimeMoldPDEfun(x,t,u,dudx,P)
% Extract parameters for the reactions
mu = P(1);
chi = P(2);
D = P(3);
g = P(4);
k = P(5); 
ro = 0.1;


%term=0;
%recall
%a=u(1);
%c=u(2);

% and here are the reactions:
% Ru =  0
% Rv = ga -kc

% PDEs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notice there is no negative sign outside the flux term!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c(x,t,u,du/dx)*du/dt = x^(-m)*d/dx(x^m*f(x,t,u,du/dx)) + s(x,t,u,du/dx)

c = [1;1]; %[for u, for v]

%flux terms!!!
f = [mu*dudx(1) - chi*u(1)*dudx(2); D*dudx(2)]; 

s = [ro*u(1)*(1- u(1)); g*u(1) - k*u(2)];





