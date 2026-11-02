function f = Figure7(D,P)

% Eq. (37): cumulative mean tumor size.
f = figure('Color','w','Position',P.window7,'Name','Figure 7');
ax = axes('Parent',f,'Position',P.pos7); hold(ax,'on');
paper_grid(ax,P);
colors = [P.red;P.blue;P.black];
labels = {'gen 1','gen 1+2','gen 1+2+3'};

for k = 1:P.K
    plot(ax,D.t/P.days,D.mean(:,k),'Color',colors(k,:),'LineWidth',P.lineWidth);
    if k==1
        text(ax,P.label7(1),P.label7(2),labels{k});
    else
        label_arrow(ax,P.arrows7(k-1,:),labels{k},P);
    end
end

xlim(ax,[0 max(P.years8)]); ylim(ax,P.meanlim); xticks(ax,P.years8); yticks(ax,P.meanTicks);
xlabel(ax,'years'); ylabel(ax,'mean tumor size');

end
