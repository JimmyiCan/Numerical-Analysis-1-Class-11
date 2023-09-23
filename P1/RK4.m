function y = RK4(N)
  % This function solves the differential equation
  % y' = f(y,t) using 4th order Runge-Kutta
  % It takes as inputs:
  % y0 = initial value of y
  % N = Number of points to compute
  % N = 1e4

close;
global m;
global k;
global a;
global b;
global h;
h = 0.01;
m = 1;
k = 2;
a = 2;
b = 0.5;


% create vector y
y0 = [0.001;0];
rows = length(y0);
y = zeros(rows, N);
t = 0;
T(1) = t;
y(:,1) = y0;


for n = 1:(N-1)
    k1 = h*f(y(:,n), t);
    k2 = h*f(y(:,n) + k1/2, t+h/2);
    k3 = h*f(y(:,n) + k2/2, t+h/2);
    k4 = h*f(y(:,n) + k3, t+h);
    y(:,n+1) = y(:,n) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t = t+h;
    T(n+1) = t;
end

figure(1)
plot(y(2,:),y(1,:))
xlabel('x')
ylabel('dx/dt')
title('Phase plot')

% To test
figure(2)
plot(T,y(2,:))
xlabel('Time')
ylabel('x')
title('Reed position vs. time')



