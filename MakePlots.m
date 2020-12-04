%% Get Plot for Falker Skan using Runge Kutta
n = [-.0904 -.0654 0 1/9 1/3 .58];

[y1,x1] = FalkerSkan_RungeKutta(n(1));   % Only works if -0.097<n<.59
[y2,x2] = FalkerSkan_RungeKutta(n(2));
[y3,x3] = FalkerSkan_RungeKutta(n(3));
[y4,x4] = FalkerSkan_RungeKutta(n(4));
[y5,x5] = FalkerSkan_RungeKutta(n(5));
[y6,x6] = FalkerSkan_RungeKutta(n(6));

%figure(1)
%plot(x6,y6,x5,y5,x4,y4,x3,y3,x2,y2,x1,y1); grid on
%legend(['n = ' num2str(n(6))],['n = ' num2str(n(5))],['n = ' num2str(n(4))],['n = ' num2str(n(3))],['n = ' num2str(n(2))],['n = ' num2str(n(1))])





X1 = sqrt(1/2*(n(1)+1))*x1;
X2 = sqrt(1/2*(n(2)+1))*x2;
X3 = sqrt(1/2*(n(3)+1))*x3;
X4 = sqrt(1/2*(n(4)+1))*x4;
X5 = sqrt(1/2*(n(5)+1))*x5;
X6 = sqrt(1/2*(n(6)+1))*x6;

figure(2)
plot(X6,y6,X5,y5,X4,y4,X3,y3,X2,y2,X1,y1); grid on
legend(['n = ' num2str(n(6))],['n = ' num2str(n(5))],['n = ' num2str(n(4))],['n = ' num2str(n(3))],['n = ' num2str(n(2))],['n = ' num2str(n(1))],'interpreter','Latex')
title('Stream-wise Velocity Profile when external stream is $U_\infty$','interpreter','Latex')
ylim([0 1])
xlim([0 4.5])
xlabel('$ \eta \sqrt{ \frac{1}{2} (n+1) } $','interpreter','Latex')
ylabel('$ \frac{u}{U_\infty} = f \prime (\eta) $','interpreter','Latex')

%% Plot Blassius Runge Kutta
Blassius_RungeKutta;
y_Blass_RK = f(:,2);
eta_Blass_RK = eta;

figure(3)
plot(eta,f(:,2)); grid on
ylim([0 1])
xlim([0 7])
xlabel('$ \eta = y \sqrt{ \frac{U_\infty}{\nu x} } $','interpreter','Latex')
ylabel('$ \frac{u}{U_\infty} = f \prime (\eta) $','interpreter','Latex')