% first exit time distributions
clear all

% absorbs at x = 0 AND x=L

Np = 1000;  % number of particles that will diffuse
L = 5;     % length of 1D line segment
D = 0.5;   % diffusion coefficient

dt = .025;  %time step
diff = sqrt(2*D*dt);

jst = 20; % number of initial positions -> we should have 20 points to plot at the end
dx = L/jst;

less = 0;
greater = 0;

% calculate the first exit time for Np particles
% for each of the starting positions
for js = 1:jst-1
    x0 = (js+0.5)*dx;  % starting positions, splitting of domain
    
    % for the js starting position, simulate the process for Np particles
    for j = 1:Np
        clear x X
        x = x0;
        k = 1; %index tracker
        
        X(1) = 0;   
        while (x < L && x > 0 ) % step until x reaches 0 or x-L % originally, this was while (x < L)
            x = x+diff*randn(1,1); 
            k = k + 1;
            X(k) = x;
        end
        
        Ts(j) = dt*(k-1); % Exit time for the jth particle
        
     
        
        if(js==1)
            if (j<6)% make a plot of 5 sample paths
                figure(1)
                plot(dt*[0:k-1],X)
                hold on
                xlabel('t','fontsize',20)
                ylabel('x','fontsize',20)
                axis([0 max(Ts(1:j)) 0 5])
            end
            
            % we want the final position of the particle at its exit time or
            % just before
            if (X(length(X)) >= L) % if the particle hits x=L
                greater = greater + 1;
            end
            if (X(length(X)) <= 0)
                less = less + 1;
            end
        
            
        end
    end
    if(js==1) % make histogram of exit times
        st = sort(Ts);
        figure(2)
        plot(st,[1:Np]/Np,'*')
        xlabel('t','fontsize',20)
        figure(3)
        hist(Ts,40)
        xlabel('t','fontsize',20)
        
    end
    Tm(js) = mean(Ts);
    xs(js) = x0;
end

x = [0:.1:L];
Tx = (L^2-x.^2)/(2*D);


figure(4)
plot(xs,Tm,'*')%,x,Tx,'--')
xlabel('initial position','fontsize',20)
ylabel('Mean Exit Time','fontsize',20)
axis([0 5 0 30])

% compute the probability that your particles will leave through each end
% of the domain as a function of their starting time.


