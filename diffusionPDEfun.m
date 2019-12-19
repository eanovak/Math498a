function [c,f,s] = diffusionPDEfun(x,t,u,dudx,P)

% This is the function that defines the PDE

% Parameters:

D=P(1); 
k = P(2); % rate

% PDE
c=1;
f=D.*dudx; %D*d^2u/dx^2 
s=-k.*u; %-k*u

