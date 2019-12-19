    function diffusion
 % This is the main function. Within this function the meshes are defined, 
 % PDEPE is called and the results are plotted
clear all; 
close all;


%********************
% Parameters           
%********************

P(1)= 1;                    % Diffusion coefficient D
P(2)=5;                         % Some other parameter
P(3)=1;                         % Some other parameter
XL = 0;                         % Location of left side of domain
XR = 1;                       % Location of left side of domain
L=XR-XL;                      % length of domain

maxt = 0.25;                % Max. simulation time

m = 0;                         % Parameter corresponding to the symmetry of the problem
                                   % m=0:slab 
                                   % m=1:cylindrical.
                                   % m=2:spherical
                
t = linspace(0,maxt,100); %tspan
x = linspace(XL,XR,100);  % xmesh

%%****************************************************************
% Call PDEPE. It needs the following arguments
% m: see above
% diffusionPDEfun: Function containg the PDEs
% diffusionICfun: Function containing the ICs for t = 0 at all x
% diffusionBCfun: Function containing the BCs for x = 0 and x = L
% x: xmesh and t: tspan
% PDEPE returns the solution as multidimensional array of size
% xmesh x tspan x (# of variables)
%%****************************************************************


sol = pdepe(m,@diffusionPDEfun,@diffusionICfun,@diffusionBCfun,x,t,[],P);    
u = sol;

%% Plotting
% 3 D surface plot
                              
figure(1)
surf(x,t,u,'edgecolor','none');
xlabel('Distance x','fontsize',20,'fontweight','b','fontname','arial') 
ylabel('Time t','fontsize',20,'fontweight','b','fontname','arial')
zlabel('Species u','fontsize',20,'fontweight','b','fontname','arial') 

axis([XL XR 0 maxt 0 max(max(u))])

set(gcf(), 'Renderer', 'painters')
set(gca,'FontSize',18,'fontweight','b','fontname','arial')

% 2 D line plot
% Here we will plot the solution at
% 10 time points
figure(2)
hold all
for n = linspace(1,length(t),10)
    plot(x,sol(n,:),'LineWidth',2)
end
xlabel('Distance x','fontsize',20,'fontweight','b','fontname','arial') 
ylabel('Species u','fontsize',20,'fontweight','b','fontname','arial') 
axis([XL XR 0 max(max(u))])
grid on
box on
set(gca,'FontSize',18,'fontweight','b','fontname','arial')