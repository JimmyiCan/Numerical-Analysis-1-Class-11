function [y, T] = Explicit_midpoint_method(y0, N)
  % This function solves the differential equation
  % y' = f(y,t) using 4th order Runge-Kutta
  % It takes as inputs:
  % y0 = initial value of y
  % N = Number of points to compute


global alpha;
alpha = -0.1;
% create vector y
y = zeros(1, N);
t = 0;
T(1) = t;
h = 1;
y(1) = y0;
for n = 1:(N-1)
    k1 = h*f(y(n), t);
    k2 = h*f(y(n) + k1/2, t+h/2);
    y(n+1) = y(n) + k2;
    t = t+h;
    T(n+1) = t;
end

plot(T,y)
xlabel('t')
ylabel('y')
title('Explicit midpoint method')