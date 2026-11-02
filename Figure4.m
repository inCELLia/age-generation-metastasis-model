function f = Figure4(D,P)

% Eqs. (18), (20): generation densities and their sum.
f = figure('Color','w','Position',P.window4,'Name','Figure 4');
colors = [P.red;P.blue;P.green];

for j = 1:numel(P.years4)
    q = D([D.year]==P.years4(j));
    ax = axes('Parent',f,'Position',P.pos4(j,:)); hold(ax,'on');
    paper_grid(ax,P);
    for k = 1:P.K
        loglog(ax,q.x,q.rho(k,:),'Color',colors(k,:),'LineWidth',P.lineWidth);
        x = P.label4(j,k);
        text(ax,x,rho_k(k,x,q.year*P.days,P),sprintf('\\rho_%d',k));
    end
    loglog(ax,q.x,sum(q.rho,1),'--','Color',P.black,'LineWidth',P.lineWidth);
    set(ax,'XScale','log','YScale','log','XTick',P.xticks,'YTick',P.rhoticks);
    xlim(ax,P.xlim); ylim(ax,P.rholim);
    xlabel(ax,'tumor size'); ylabel(ax,'distributions');
    text(ax,P.yearLabel4(1),P.yearLabel4(2),sprintf('year %d',q.year),'Units','normalized');
    text(ax,P.sumLabel4(1),P.sumLabel4(2),'\rho^{(3)} = \rho_1 + \rho_2 + \rho_3','Units','normalized');
    text(ax,P.panel4(1),P.panel4(2),sprintf('(%c)',96+j),'Units','normalized');
end

end

