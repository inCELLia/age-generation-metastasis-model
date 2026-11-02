function phi = recursive_phi(k,tau,t,P)

% Eqs. (13), (19): tau is age, t is time, both in days.
s = t-tau;
valid = tau>=0 & s>=-P.endpointEps*eps(max(1,t));
s = max(0,s);
phi = zeros(size(tau));

if k == 1
    phi(valid) = P.m*P.b.^(P.c*(1-exp(-P.a*s(valid))));
    return
end

for j = reshape(find(valid & s>0),1,[])
    f = @(u) recursive_phi(k-1,u,s(j),P).*P.m.*P.b.^(P.c*(1-exp(-P.a*u)));
    phi(j) = integral(f,0,s(j),'RelTol',P.RelTol,'AbsTol',P.AbsTol);
end

end
