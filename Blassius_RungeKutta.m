%% Runge Kutta
%% The goal here is to solve blassius with a shooting method
 % - guess f''(0) and 
clear
 % It is a inititial Value problem that we do over and over until the
 % boundary condition is met

h = .005; 
nfinal = 7;
tol = .001;
itermax = 2000;
eta = 0:h:nfinal;
N = length(eta);
 
f_(1) = 0;
f_dot(1) = 0;
f_ddot(1) = 0;
f = NaN(N,3); % f = [f_ f_dot f_ddot]

% Write an expression for the derivative of f
% f1prime = f2
% f2prime = f3
% f3prime = -(f3*f1)/2
func = @(f,t) [f(2) f(3) -f(3)*f(1)/2];
flag = 0;
counter = 0;
while flag == 0
    for i = 1:N-1;
       f(1,:) = [f_(1) f_dot(1) f_ddot(1)];
       k1 = func(f(i,:),eta(i));
       k2 = func(f(i,:)+h*k1/2,eta(i)+h/2);
       k3 = func(f(i,:)+h*k2/2,eta(i)+h/2);
       k4 = func(f(i,:)+h*k3,eta(i)+h);
       f(i+1,:) = f(i,:) + h/6*(k1+2*k2+2*k3+k4);
    end
    
    error1 = (f(end,2)-1);
    error2 = (f(end-1,2)-1);
    error3 = (f(end-2,2)-1);
    
    if abs(error1) < tol && abs(error2) < tol && abs(error3) < tol
        flag = 1;
        'tolerance met'
    elseif error1 > 0 
        f_ddot(1) = f_ddot(1) - .001;
    elseif error1 < 0
        f_ddot(1) = f_ddot(1) + .001;
    end
    counter = counter + 1;
    if counter > itermax
        flag = -1;
        'Did not converge'
    end
    
end
f(1,3); % should be .332
