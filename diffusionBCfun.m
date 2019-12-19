function [pl,ql,pr,qr] = diffusionBCfun(xl,ul,xr,ur,t,P)

% BCs for x=0 and x=L

% Parameters

%Dirichlet BCs (absorbing): 
pl=ul; 
ql=1;
pr=ur;
qr=1;


% %Neumann BCs (reflecting): 
 %pl=0; 
 %ql=1;
 %pr=0;
 %qr=1;