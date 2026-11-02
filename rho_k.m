function rho = rho_k(k,x,t,P)

% Eqs. (9), (28): physical size support.
rho = zeros(size(x));
upper = P.b^(1-exp(-P.a*t));
inside = x>=1 & x<=upper; y = x(inside);

tau = min(t,-log1p(-log(y)/log(P.b))/P.a); % Eq. (29).
tau(y==upper) = t;

g = P.a*y.*log(P.b./y); % Eq. (25).
rho(inside) = recursive_phi(k,tau,t,P)./g; % Eq. (20).

end
