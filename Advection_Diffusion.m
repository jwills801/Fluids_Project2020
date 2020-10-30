%% CODE from Kundu Fluid Mechanics Ch6 pg 236
% 1D Advection diffusion by using an explicit forward in time, centered in
% space scheme.
clear
N = 21;
tfinal = 2;
L = 2;
dt = .005;
nstep = tfinal/dt;
U=1;
D=.05;
k=1;

% make an evenly spaced mesh for x
dx = L/(N-1);
for j=1:N
    x(j) = dx*(j-1);
end

% Set initial conditions => I guess it starts as a sine wave at t=0
f = NaN(N,1);
f0 = NaN(N,1);
f_exact = NaN(N,1);
time = 0.0;
for j=1:N
    f(j) = .5*sin(2*pi*k*x(j));
end

% Time Loop
h = animatedline('color','r');
h2 = animatedline;
axis([0 L -1.5 1.5]);
legend('Numerical Solution','Exact Solution')
for m = 1:nstep
    % Exact Solution
    f_exact = exp(-D*k^2*time)*sin(2*pi*k*(x-U*time));
    addpoints(h,x,f)
    addpoints(h2,x,f_exact)
    drawnow limitrate
    pause(dt*3)
    clearpoints(h)
    clearpoints(h2)
    f0 = f;
    f0_exact = f_exact;
    for j=2:N-1 % Spacial Loop
        f(j) = f0(j) - (.5*U*dt/dx)*(f0(j+1)-f0(j-1)) + D*(dt/dx^2)*(f0(j+1)-2*f0(j)+f0(j-1));
    end
    
    
    % Periodic Boundary Condition
    f(1) = f(N) - (.5*U*dt/dx)*(f0(2)-f0(N-1)) + D*(dt/dx^2)*(f0(2)-2*f0(N)+f0(N-1));
    f(1) = f(N);
    f_exact(1) = f_exact(N) - (.5*U*dt/dx)*(f0_exact(2)-f0_exact(N-1)) + D*(dt/dx^2)*(f0_exact(2)-2*f0_exact(N)+f0_exact(N-1));
    f_exact(1) = f_exact(N);
    time = time + dt;
end
    
        
  
    

