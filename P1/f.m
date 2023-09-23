function dydt = f(y,t)

global m;
global k;
global a;
global b;

%  if (abs(t-T0)<.1)
%    dydt = 5;  % Give function a kick
%  else
dydt = zeros(2,1);
dydt(1) = 1/m*(-k*y(2) + a*y(1) - b*y(1).^3);
dydt(2) = y(1);
%  end

end

