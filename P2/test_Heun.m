function y = test_Heun()
close;
clc;


global alpha;
alpha = -0.1;

h = [0.003, 0.01, 0.03, 0.1, 0.3, 1];
for i = 1:length(h)
    % create vector y
    
    N = round(100/(h(i)));
    y = zeros(1, N);
    T = zeros(1, N);
    y0 = 1;
    y(1) = y0;
    t = 0;
    T(1) = t;
    for n = 1:(N-1)
        ytilde(n+1) = y(n) + h(i)*f(y(n),t);
        y(n+1) = y(n) + h(i)/2*(f(y(n), t) + f(ytilde(n+1), t+h(i)));
        t = t+h(i);
        T(n+1) = t;
    end
    ytrue = exp(-0.1*T);
    disp(size(ytrue))
    disp(size(y))
    err(i) = sqrt(sum((ytrue - y).^2)/length(y));
end

plot(log(h)./log(10),log(err)./log(10),'o')
format long
set(gca,'XTick',log(h)./log(10));
set(gca,'XTickLabel',10.^(log(h)./log(10)));
set(gca,'YTick',log(err)./log(10));
set(gca,'YTickLabel',10.^(log(err)./log(10)));
xlabel('stepsize h')
ylabel('RMS err')
title('RMS err vs. stepsize h')
