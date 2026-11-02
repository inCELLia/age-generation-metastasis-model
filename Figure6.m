function f = Figure6(P)


% Eqs. (34), (36).
times = P.years6*P.days;
upper = P.b^(1-exp(-P.a*max(times)));
e = floor(log10(upper));
edges = 10.^(0:e);

if upper>edges(end), edges=[edges upper]; end
nb = numel(edges)-1;
C = zeros(P.K,nb,numel(times));
for j = 1:numel(times)
    for k = 1:P.K
        fprintf('Figure 6: %.1f years, generation %d\n',P.years6(j),k);
        for i = 1:nb
            hi = min(edges(i+1),P.b^(1-exp(-P.a*times(j))));
            if hi>edges(i)
                C(k,i,j) = integral(@(x)rho_k(k,x,times(j),P),edges(i),hi, ...
                    'ArrayValued',true,'RelTol',P.RelTol,'AbsTol',P.AbsTol);
            end
        end
    end
end

f = figure('Color','w','Position',P.window6,'Name','Figure 6');
layout = tiledlayout(f,2,3,'TileSpacing','compact','Padding','compact');

for k = 1:P.K
    ax = nexttile(layout);
    draw(ax,edges,squeeze(C(k,:,:)),P);
    title(ax,sprintf('Generation %d',k),'FontWeight','bold');
end

ax = nexttile(layout,[1 3]);
totals = squeeze(sum(C,1));
h = draw(ax,edges,totals,P);
title(ax,'Total number of metastases from generations 1,2,3','FontWeight','bold');
xlabel(ax,'tumor size'); ylabel(ax,'Number of tumors');
text(ax,P.threshold*P.detectionLabel(1),max(round(totals(:)))*P.detectionLabel(2),'Imaging detection limit', ...
    'FontSize',P.detectionLabelSize,'FontAngle','italic');
labels = arrayfun(@(year)sprintf('T = %g years',year),P.years6,'UniformOutput',false);
legend(ax,h,labels,'Location','east','Box','off');


% Eq. (36) in age coordinates.
for j = 1:numel(times)
    detected = 0; t = times(j);
    if P.threshold < P.b^(1-exp(-P.a*t))
        lower = -log1p(-log(P.threshold)/log(P.b))/P.a;
        for k = 1:P.K
            detected = detected + integral(@(tau)recursive_phi(k,tau,t,P),lower,t, ...
                'RelTol',P.RelTol,'AbsTol',P.AbsTol);
        end
    end
    fprintf('T=%.1f: total %.4f, above %.5g cells %.4f\n', ...
        P.years6(j),sum(totals(:,j)),P.threshold,detected);
end
end

function h = draw(ax,edges,C,P)
hold(ax,'on');
set(ax,'Layer','top','XGrid','off','YGrid','off','XMinorGrid','off','YMinorGrid','off');
R = round(C);
ymax = max(R(:));
top = max(1,ceil(ymax*P.barTop));
h = gobjects(1,2);

for j = 1:2
    h(j) = histogram(ax,'BinEdges',edges,'BinCounts',R(:,j)', ...
        'FaceColor',P.histColors(j,:),'FaceAlpha',P.alpha(j), ...
        'EdgeColor',P.black,'LineWidth',P.barLineWidth);
end

set(ax,'XScale','log','XTick',10.^(0:floor(log10(edges(end)))));
xlim(ax,[edges(1) edges(end)]); ylim(ax,[0 top]);
for i = 1:numel(edges)-1
    plot(ax,[edges(i+1) edges(i+1)],[0 ymax*P.dividerTop],'-', ...
        'Color',P.dividerColor,'LineWidth',P.dividerWidth,'HandleVisibility','off');
end

plot(ax,[P.threshold P.threshold],[0 ymax*P.detectionTop],'--','Color',P.black, ...
    'LineWidth',P.detectionLineWidth,'HandleVisibility','off');
x = sqrt(edges(1:end-1).*edges(2:end));

for j = 1:2
    for i = 1:numel(x)
        if R(i,j)>0
            text(ax,x(i)*P.jitter(j),R(i,j)+P.barLabelOffset*top,num2str(R(i,j)), ...
                'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',P.barLabelSize);
        end
    end
end


end
