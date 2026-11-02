function paper_grid(ax,P)

% major grid.
set(ax,'XGrid','on','YGrid','on','XMinorGrid','off','YMinorGrid','off', ...
    'GridColor',P.gridColor,'GridLineStyle',P.gridStyle, ...
    'GridAlpha',P.gridAlpha,'Layer','top');
end
