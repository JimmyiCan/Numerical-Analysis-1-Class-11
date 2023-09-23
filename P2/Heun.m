function y = Heun()
close;
clc;

global alpha;
alpha = -0.1;
h = 1;

  % create vector y
N = 100;
y = zeros(1, N);
t = 0;
y0 = 1;
y(1) = y0;
T(1) = t;

for n = 1:(N-1)
    ytilde(n+1) = y(n) + h*f(y(n),t);
    y(n+1) = y(n) + h/2*(f(y(n), t) + f(ytilde(n+1), t+h));
    t = t+h;
    T(n+1) = t;
end

figure(1)
plot(T,y,'bo')
hold on
ytrue = exp(-0.1*T);
plot(T,ytrue)
hold off
legend('Computed','Analytic')
xlabel('t')
ylabel('y')
title('Computed solution y vs time')
 