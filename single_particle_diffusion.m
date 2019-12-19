% This is to illustrate diffusion of particles (i.e., Brownian motion)
clear all
close all

Nt = 1000;  %number of time steps
Np = 1000; %number of particles

y = [-100:100]/5;   % y axis to plot the theoretical pdf
bins = [-20:20];    % describe the bins for the histogram


k = 20;           % for plotting histograms evern 20th 
x = zeros(Np,1);    % initial starting positions
X = x;

t = 0;              % initial time =0
T(1) = t;           % Time vetor = 0
v(1) = 0;           % initial variance = 0              




% diffusion parameters
D = 1/2;            % diffusion coefficient
dt = .025;          % time step
diff = sqrt(2*D*dt);% coefficient for dx=diff*N(0,1)


for j = 2:Nt %number of timesteps
    
    x = x + diff*randn(Np,1); % step all particles according to 
                              % x_n+1= x_n + sqrt(dx_n)
    
    X = [X,x];  % make a matrix that contains all paths for all particles
    v(j) = std(x)^2; % compute the variance of the all 
                       % particle positions at every time step
        
    t = t + dt;         % update time
    T(j) = t;          % make a vector to track times

    if(fix(j/k)*k==j) % only plot the histogram every k timesteps
        figure(1)
        
        % plot the histogram of particle positions
        hist(x,bins)
        title('Histogram of particle positions','fontsize',20)
        hold on
        
        % plot the theoretical pdf
        p = Np*exp(-y.^2/(4*D*t))/sqrt(4*pi*D*t);
        plot(y,p,'r','linewidth',2)
        hold off
    end
    
    axis([-20 20 0 Np/4])
    %pause(0.01)
end

% plot the paths
figure(2)
plot(T,X(1:10,:),'linewidth',2)
xlabel('t','fontsize',20)
ylabel('x','fontsize',20)

% plot the estimated and theoretical variance
figure(3)
plot(T,v,T,2*D*T,'--','linewidth',2 )
hold off
xlabel('t','fontsize',20)
ylabel('Variance','fontsize',20)
legend('Estimated', 'Theoretical')
title('Variance for N_p=10')

