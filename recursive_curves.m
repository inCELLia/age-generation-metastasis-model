function curves = recursive_curves(P)

% Eqs. (19), (20).
curves = repmat(struct('year',0,'x',[],'rho',[]),1,numel(P.years8));

for j = 1:numel(P.years8)
    t = P.days*P.years8(j);
    x = linspace(1,P.b^(1-exp(-P.a*t)),P.nx); % Eq. (28).
    rho = zeros(P.K,P.nx);

    for k = 1:P.K
        fprintf('Distributions: year %g, generation %d\n',P.years8(j),k);
        rho(k,:) = rho_k(k,x,t,P);
    end

    curves(j).year = P.years8(j);
    curves(j).x = x;
    curves(j).rho = rho;
end


end
