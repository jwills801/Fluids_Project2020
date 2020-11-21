% solve non-linear Boundary Value Problem using finite difference
% The problem is Blassius

%% ff'' +2*f''' = 0
clear


% define mesh
h = .01; % Step size
etamin = 0;
etamax = 10;
eta = etamin:h:etamax;
N = length(eta);


%% make vector of equations
feta = zeros(N,1);
flag = 0;
counter = 0;
tol = .01;
itermax = 100;
while flag == 0
    F(1)  = feta(1); % initial condition f(0) =0
    F(2) = feta(1) - feta(2); % intial condition that f'(0) = 0 => so F(1)=F(2)=0   I think...
    for i =3:N-2
        F(i) = feta(i)*(feta(i+1) - 2*feta(i) + feta(i-1))/h/h + 2*(feta(i+2)-2*feta(i+1)+2*feta(i-1)-feta(i-2))/2/h/h/h;
    end
    F(N-1) = feta(N-1)-feta(N-2)-h; % boundary condition f'(inf) =1
    F(N) = feta(N) - feta(N-1) - h; % same as above, just one over
    %% make Jacobian
    J = zeros(N);
    J(1,1) = 1; % bc feta(1) =0 is the first equation
    J(2,1) = 1; J(2,2) = -1; %bc feta(1)-feta(2)=0 is the second equation
    for i = 3:N-2
        J(i,i-2) = -h^-3;
        J(i,i-1) = feta(i)/h/h + 2/h/h/h;
        J(i,i) = (feta(i+1)-4*feta(i)+feta(i-1))/h/h;
        J(i,i+1) = feta(i)/h/h -2*h^-3;
        J(i,i+2) = h^-3;
    end
    J(N-1,N-1) = 1; J(N-1,N-2) = -1; % boundary condition f'(inf) = 1
    J(N,N-1) = -1; J(N,N) = 1; % partial derivatives of line 30
    %% define new fetas
    feta = feta - J\F';
    %% Test if new fetas solve F(feta) = 0
    if tol > norm(F)
        flag = 1;
        'tolerance met'
    elseif counter > itermax
        flag = -1;
        'tolerance not met'
    end
    counter = counter + 1;
end
figure(1)
plot(eta,feta)

u_over_U = diff(feta)./diff(eta);
eta = eta(1:end-1);

figure(2)
plot(eta,u_over_U)
