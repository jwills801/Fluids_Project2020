%% The goal here is to solve blassius with a shooting method
 % - guess f''(0) and 
clear
 % It is a inititial Value problem that we do over and over until the
 % boundary condition is met

h = .005; 
nfinal = 7;
tol = .01;
itermax = 100000;
n = 1:h:nfinal;
N = length(n);
f = NaN(1,N);
f_dot = f;
f_ddot = f;
f_dddot = NaN(1,N-1);
 
f(1) = 0;
f_dot(1) = 0;
f_ddot(1) = 1;
 
 
flag = 0;
counter = 0;
while flag == 0
    

    for i = 2:N;
        f(i) = f(i-1) + h*f_dot(i-1);
        f_dddot(i-1) = -f(i-1)*f_ddot(i-1)/2; % From the main equation
        f_ddot(i) = f_ddot(i-1) + h*f_dddot(i-1);
        f_dot(i) = f_dot(i-1) + h*f_ddot(i-1);
    end
    
    error1 = (f_dot(end)-1);
    error2 = (f_dot(end-1)-1);
    error3 = (f_dot(end-2)-1);
    
    if abs(error1) < tol && abs(error2) < tol && abs(error3) < tol
        flag = 1;
        'tolerance met'
    elseif error1 > 0 
        f_ddot(1) = f_ddot(1) - .00001;
    elseif error1 < 0
        f_ddot(1) = f_ddot(1) + .00001;
    end
    counter = counter + 1;
    if counter > itermax
        flag = -1;
        'Did not converge'
    end
    
end
        
plot(n,f)
plot(n,f_dot)