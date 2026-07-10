clc;
close all;

model = 'lorentz';
load_system(model);

sigma = 10;
rho   = 28;
beta  = 8/3;

set_param(model,'StopTime','60');
set_param(model,'Solver','ode45');
set_param(model,'MaxStep','0.01');


simOut = sim(model);

logs = simOut.logsout;

X = logs.get('X').Values.Data;
Y = logs.get('Y').Values.Data;
Z = logs.get('Z').Values.Data;

fprintf('X: %.2f  %.2f\n',min(X),max(X))
fprintf('Y: %.2f  %.2f\n',min(Y),max(Y))
fprintf('Z: %.2f  %.2f\n',min(Z),max(Z))
figure('Color','k')

ax = axes;
hold(ax,'on')
grid(ax,'on')

xlabel('X')
ylabel('Y')
zlabel('Z')

view(45,25)

axis([-25 25 -35 35 0 55])

h = plot3(NaN,NaN,NaN,...
          'Color',[0 0.8 1],...
          'LineWidth',1.5);

for i = 1:5:length(X)

    set(h,...
        'XData',X(1:i),...
        'YData',Y(1:i),...
        'ZData',Z(1:i));

    drawnow

    pause(0.01)      % controls animation speed

end