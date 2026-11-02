function label_arrow(ax,p,label,P)

% p contains normalized start/end coordinates inside the axes.
a = ax.Position;
x = a(1)+a(3)*p([1 3]);
y = a(2)+a(4)*p([2 4]);
annotation(ax.Parent,'textarrow',x,y,'String',label, ...
    'FontName',P.font,'FontSize',P.fontSize,'LineWidth',P.lineWidth, ...
    'HeadLength',P.headSize,'HeadWidth',P.headSize);
end
