function D = recursive_moments(P)


% Eqs. (9), (34), (35), (37): integrate in age coordinates.
D.t = linspace(0,max(P.years8)*P.days,P.nt);
D.N = zeros(P.nt,P.K);
M = zeros(P.nt,P.K);
for j = 2:P.nt
    t = D.t(j);
    if mod(j,P.progressEvery)==0
        fprintf('Moments: %d/%d, %.3f years\n',j,P.nt,t/P.days);
    end
    for k = 1:P.K
        f = @(tau) recursive_phi(k,tau,t,P);
        D.N(j,k) = integral(f,0,t,'RelTol',P.RelTol,'AbsTol',P.AbsTol);
        f = @(tau) P.b.^(1-exp(-P.a*tau)).*recursive_phi(k,tau,t,P);
        M(j,k) = integral(f,0,t,'RelTol',P.RelTol,'AbsTol',P.AbsTol);
    end
end
D.sumN = cumsum(D.N,2); % Eq. (35).
D.mean = cumsum(M,2)./D.sumN; % Eq. (37).
end
