function SlimeMold
clear; close all;

% Parameters
L=20;
maxt = 200;

P(1) = 0.5;   %mu
P(2) = 2;   %chi
P(3) = 1;   %D
P(4) = 1;   %g
P(5) = 1;   %k

m=0;
t=linspace(0,maxt,100); %tspan
x=linspace(0,L,200); %xmesh

%% PDEPE

sol = pdepe(m,@SlimeMoldPDEfun,...
    @SlimeMoldICfun,...
    @SlimeMoldBCfun,x,t,[],P);

% sol = xmesh x tspan x variables

u1= sol(:,:,1);
u2= sol(:,:,2);

%% Plotting
figure(1)
pcolor(x,t,u1);
shading flat
xlabel('Distance, x')
ylabel('Time t')
title('Species a')
colorbar
colormap jet

%% Plotting
figure(2)
pcolor(x,t,u2);
shading flat
xlabel('Distance, x')
ylabel('Time t')
title('Species c')
colorbar
colormap jet






