function test_Explicit_midpoint_method()
close;
[y, T] = Explicit_midpoint_method(1, 100);
plot(T,y,'bo')
hold on
ytrue = exp(-0.1*T);
plot(T,ytrue)
hold off
xlabel('t')
ylabel('y')
legend('Computed','Analytic')
title('Explicit midpoint method')
