clear; clc;
cd(fileparts(mfilename('fullpath')));

% Eqs. (25)-(27); Table D.1 names. Time in days, size in cells.
P.a = 0.0028;      % Growth constant (1/day).
P.b = 7.3e10;       % Carrying capacity: maximum tumor size (cells).
P.m = 5.3e-8;       % Metastatic emission constant.
P.c = 2/3;          % Emission exponent.
P.days = 365;       % Days per year.
P.K = 3;            % Order of size-distribution approximant: generations 1-3.
P.threshold = 1e8;  % Detection threshold x_l: lower limit of detectability (cells).

% Numerical controls; implementation choices.
P.RelTol = 1e-10;   % Relative error tolerance for each integral.
P.AbsTol = 1e-12;   % Absolute error tolerance for each integral.
P.progressEvery = 20; % Print progress every 20 moment time points.
P.endpointEps = 8;  % Endpoint roundoff allowance: 8*eps(max(1,t)) days.

% Sampling and time conversion.
P.hoursPerDay = 24; % Hours per day.
P.nx = 5000;        % Samples of the size distribution rho_k(x;t).
P.nt = 500;         % Times for tumor counts and mean tumor size, including zero.
P.years4 = [1 3 4 5]; % Observation years for Figure 4.
P.years6 = [3 3.8];   % Observation years for Figure 6.
P.years8 = 1:5;       % Observation years for Figure 8.
P.hours8 = [0.5 1 1 2 2]; % Characteristic time steps (hours), one per year in years8.

% Plot constants.
P.font = 'Helvetica';
P.fontSize = 11;
P.lineWidth = 0.6;
P.red = [1 0 0];
P.blue = [0 0 1];
P.green = [0 0.6 0];
P.black = [0 0 0];
P.histColors = [0.93 0.41 0.17;0.25 0.50 0.88];
P.alpha = [0.6 0.2]; % Histogram opacity.
P.jitter = [0.94 1.06];
P.barLineWidth = 0.7;
P.dividerColor = [0.7 0.7 0.7];
P.dividerWidth = 0.6;
P.detectionLineWidth = 1.5;
P.markerSize = 4;
P.markerCount = 60;
P.gridColor = P.blue; % Paper grids: blue dotted major lines.
P.gridStyle = ':';
P.gridAlpha = 1;
P.barLabelSize = 8;
P.detectionLabelSize = 9;
P.barTop = 1.25;
P.dividerTop = 1.02;
P.detectionTop = 1.2;
P.barLabelOffset = 0.03;
P.detectionLabel = [1.2 1.1];
P.xlim = [1 1e12];
P.rholim = [1e-19 1e3];
P.xticks = 10.^(0:12);
P.rhoticks = 10.^(-19:2:3);
P.countlim = [0 4000];
P.countTicks = 0:1000:4000;
P.meanlim = [0 4e8];
P.meanTicks = 0:1e8:4e8;
P.window4 = [100 60 1200 990];
P.window5 = [100 100 1100 520];
P.window6 = [100 100 1100 720];
P.window7 = [100 100 680 550];
P.window8 = [100 100 640 560];
P.pos4 = [0.10 0.57 0.36 0.37;0.58 0.57 0.36 0.37; ...
          0.10 0.10 0.36 0.37;0.58 0.10 0.36 0.37];
P.pos5 = [0.09 0.16 0.37 0.78;0.59 0.16 0.37 0.78];
P.pos7 = [0.14 0.14 0.82 0.81];
P.pos8 = [0.14 0.15 0.82 0.79];
P.label4 = [1.5e4 1e3 1e2;2e6 6e5 3e4;10 1e7 3e6;2e8 3e9 2e8];
P.label5 = [4.1 350;4.3 2050;4.8 850];
P.label5sum = [4.5 420];
P.arrowLabels5 = {'N^{(3)}','N^{(2)}'};
P.arrows5 = [0.84 0.94 0.90 0.86;0.96 0.56 0.93 0.75];
P.label7 = [3.75 3.2e8];
P.arrows7 = [0.85 0.60 0.93 0.51;0.85 0.31 0.95 0.45];
P.label8density = [1e2 1e-5;3e4 1e-6;8e7 3e-10;2e10 1e-7;3e7 1e-5];
P.arrow8 = [0.85 0.57 0.82 0.43];
P.yearLabel4 = [0.73 0.93];
P.sumLabel4 = [0.60 0.82];
P.panel4 = [0.5 -0.22];
P.panel5 = [0.5 -0.19];
P.headSize = 5;
P.dpi = 300;
P.pdfContentType = 'image'; % PDF export: 'image' or 'vector'.
P.output = fullfile(fileparts(mfilename('fullpath')),'results');

% Calculate distributions and moments.
curves = recursive_curves(P);
moments = recursive_moments(P);
F(1) = Figure4(curves,P);
F(2) = Figure5(moments,P);
F(3) = Figure6(P);
F(4) = Figure7(moments,P);
F(5) = Figure8(curves,P);

if ~exist(P.output,'dir'), mkdir(P.output); end
for j = 1:numel(F)
    ax = findall(F(j),'Type','axes');
    set(ax,'FontName',P.font,'FontSize',P.fontSize,'Box','on','TickDir','out');
    name = fullfile(P.output,sprintf('Figure_%d',j+3));
    units = F(j).Units; F(j).Units = 'inches';
    pageSize = F(j).Position(3:4); F(j).Units = units;
    set(F(j),'PaperUnits','inches','PaperSize',pageSize,'PaperPosition',[0 0 pageSize]);
    print(F(j),[name '.pdf'],'-dpdf',sprintf('-r%d',P.dpi),['-' P.pdfContentType]);
end
fprintf('Finished: %s\n',P.output);
