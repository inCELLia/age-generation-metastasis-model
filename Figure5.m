function f = Figure5(D,P)


% Eqs. (34), (35): generation counts and cumulative counts.
f = figure('Color','w','Position',P.window5,'Name','Figure 5');
colors = [P.red;P.blue;P.black];

for j = 1:2
    ax = axes('Parent',f,'Position',P.pos5(j,:)); hold(ax,'on');
    paper_grid(ax,P);
    if j==1, N=D.N; else, N=D.sumN; end
    for k = 1:P.K
        plot(ax,D.t/P.days,N(:,k),'Color',colors(k,:),'LineWidth',P.lineWidth);
        if j==1
            text(ax,P.label5(k,1),P.label5(k,2),sprintf('N_%d',k));
        elseif k==1
            text(ax,P.label5sum(1),P.label5sum(2),'N^{(1)}');
        else
            label_arrow(ax,P.arrows5(k-1,:),P.arrowLabels5{k-1},P);
        end
    end
    xlim(ax,[0 max(P.years8)]); ylim(ax,P.countlim);
    xticks(ax,P.years8); yticks(ax,P.countTicks);
    xlabel(ax,'years'); ylabel(ax,'number of tumors');
    text(ax,P.panel5(1),P.panel5(2),sprintf('(%c)',96+j),'Units','normalized');
end


end
