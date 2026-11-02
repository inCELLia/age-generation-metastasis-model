function f = Figure8(D,P)


% Eq. (18): third-order sum; Appendix C: IKS solution.
f = figure('Color','w','Position',P.window8,'Name','Figure 8');
ax = axes('Parent',f,'Position',P.pos8); hold(ax,'on');
paper_grid(ax,P);

for j = 1:numel(P.years8)
    year = P.years8(j);
    fprintf('Figure 8: characteristics, year %g\n',year);
    [x,rho] = iks_characteristics(P.days*year,P.hours8(j),P);
    q = D([D.year]==year);
    total = sum(q.rho,1);
    ix = unique(round(linspace(1,numel(x),P.markerCount)));
    loglog(ax,x,rho,'--','Color',P.blue,'LineWidth',P.lineWidth,'HandleVisibility','off');
    loglog(ax,x(ix),rho(ix),'o','Color',P.blue,'MarkerSize',P.markerSize, ...
        'LineWidth',P.lineWidth,'HandleVisibility','off');
    loglog(ax,q.x,total,'-','Color',P.red,'LineWidth',P.lineWidth,'HandleVisibility','off');
    if year==4
        label_arrow(ax,P.arrow8,'year 4',P);
    else
        text(ax,P.label8density(j,1),P.label8density(j,2),sprintf('year %g',year));
    end
end

set(ax,'XScale','log','YScale','log','XTick',P.xticks,'YTick',P.rhoticks);
xlim(ax,P.xlim); ylim(ax,P.rholim);
xlabel(ax,'tumor size'); ylabel(ax,'distribution');
h1 = plot(ax,NaN,NaN,'o--','Color',P.blue,'MarkerSize',P.markerSize,'LineWidth',P.lineWidth);
h2 = plot(ax,NaN,NaN,'-','Color',P.red,'LineWidth',P.lineWidth);
legend(ax,[h1 h2],{'numerical solution','third-order approximant'},'Location','northeast','Box','off');
end
