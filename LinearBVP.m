% solve linear Boundary Value Problem from
% 5-finite-difference-methods-1995.pdf

%% u'' - pu' -ru = q
clear
% I made up these functions
r = @(x) 1/x;
p = @(x) 1;
q = @(x) 1;


% define mesh
h = .01;% Step size
xmin = 0;
xmax = 10;
x = xmin:h:xmax;
N = length(x) -1;
A = NaN(N+1,N+1);

% Make the matrix A
for i = 2:N
    a(i) = -(2/h^2+r(x(i)));
    b(i) = 1/h^2 + p(x(i))/2/h;
    c(i) = 1/h^2 - p(x(i))/2/h;
end
a(1) = 1;
a(N+1) = 1;
c(1) = 0;
b(N+1) = 0;
for i = 1:N+1
    for j = 1:N+1
        if i == j
            A(i,j) = a(i);
        elseif i-1 == j
            A(i,j) = b(i);
        elseif i == j-1
            A(i,j) = c(i);
        else
            A(i,j) = 0;
        end
    end
end

% Make matrix b
b(1) = 0; % Initial condition
b(N+1) = 0; % boundary condition
for i = 2:N
    b(i) = q(x(i));
end

% solve for u(x(i))
u = A/b;
plot(x,u)
