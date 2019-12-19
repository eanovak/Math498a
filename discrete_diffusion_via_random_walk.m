% diffusion on a grid via a random walk
clear all
close all
% create a vector of numbers
Np = 1000; % number of particles
X = zeros(Np,1); % initial position

% IC -> all start at 0

alpha = 0.25; % Probability of movement
Nt = 100;  % number of time steps
XS = zeros(Np,Nt); 
YS = zeros(Np,2*Nt); % to plot the jumps


% Specify the movment vector
m(1) = 1; % alpha
m(2) = -1; % 1-2*alpha
m(3) = 0; % alpha

pr = [alpha,2*alpha,1]; % the probabilities in order so 
                        % the random number can choose an index for m
                        % what will you need to change to make this a
                        % biased walk???


for j = 1:Nt % for each time step
    R = rand(Np,1); % set R to be a vector of random numbers, one for each particle
    for k = 1:Np % for each particle
        
       ndx= min(find(R(k)<=pr));% for what probabilites is the random number less than?
                                % take the minimun, and this is the index of pr vector
                                % this determines with m value to choose
                                
       X(k) = X(k) + m(ndx);    % update the random walkers position
       
       XS(k,j) = X(k);             % 
    end
    
  figure(1)
  hist(X)
  pause(0.01)
end

% create a time plot of the position with jumps
for j = 1:Nt
    YS(:,2*j-1) = XS(:,j);
    YS(:,2*j) = XS(:,j);
    T(2*j-1) = j-1;
    T(2*j) = j;
end

%plot the trajectories
figure(2)
plot(T,YS')
xlabel('time step','fontsize',20)
ylabel('position','fontsize',20)

% theoretical variance  (for discrete version)
deltaX = 1; % is the displacement
n = 1;
theoVar = ((deltaX)^2)*2*alpha*(1:Nt);

% What is D?
deltaT = 1; % is the change in time
D = alpha*(deltaX)^2/(deltaT);

% How will you compute D when you have a biased walk?

% use matlab's var() function to estimate the variance of your random walkers XS

% plot the variance!
est = var(XS)-theoVar;

hold on
plot(var(XS))
plot(theoVar)
legend('Sample Variance', 'Theoretical Variance')
title('Variance vs time')
xlabel('time')
ylabel('Variance')
    