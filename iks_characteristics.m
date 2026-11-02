function [x,rho] = iks_characteristics(T,hours,P)
% Appendix C, Algorithm (1)-(6).
% Barbolosi et al. (2009); Angulo and Lopez-Marcos (1999).
% Propagation follows Eq. (C.4); grid follows Eqs. (C.5)-(C.6).
a = P.a;
N = round(T/(hours/P.hoursPerDay));
h = T/N;
x = P.b.^(1-exp(-a*(0:N)*h));
% Algorithm initialization, steps (1)-(2).
rho = zeros(1,N+1);
g1 = a*log(P.b);
rho(1) = P.m/g1;
step = exp(a*h)*(x(1:N)/P.b).^(1-exp(-a*h));
w = diff(x).*P.m.*x(2:end).^P.c;
for n = 1:N
    % Eq. (C.4), Algorithm step (4).
    rho(2:n+1) = rho(1:n).*step(1:n);
    % Boundary flux, Eq. (3), Algorithm step (5).
    rho(1) = (P.m*P.b^(P.c*(1-exp(-a*n*h))) ...
        + sum(w(1:n).*rho(2:n+1)))/g1;
end
end
