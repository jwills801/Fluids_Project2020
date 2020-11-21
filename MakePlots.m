n = [-.0904 -.0654 0 1/9 1/3 .58];

[y1,x1] = FalkerSkan_RungeKutta(n(1));   % Only works if -0.097<n<.59
[y2,x2] = FalkerSkan_RungeKutta(n(2));
[y3,x3] = FalkerSkan_RungeKutta(n(3));
[y4,x4] = FalkerSkan_RungeKutta(n(4));
[y5,x5] = FalkerSkan_RungeKutta(n(5));
[y6,x6] = FalkerSkan_RungeKutta(n(6));
plot(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6)
