clc; close all;  

model = 'lorentz';
load_system(model);


sigma = 10;
rho   = 28;
beta  = 8/3;

set_param(model,'StopTime','60');
set_param(model,'Solver','ode45');
set_param(model,'MaxStep','0.01');

ICs = [1 1 1; 1.0001 1 1];
colors = [0 0.45 0.74; 0.85 0.33 0.1];

figure('Color','k');
ax = axes('Color','k'); hold on; grid on;
ax.XColor='w'; ax.YColor='w'; ax.ZColor='w';
view(45,25);
axis([-25 25 -35 35 0 55]);

for k = 1:2

    set_param([model '/IntegratorX'],'InitialCondition',num2str(ICs(k,1)));
    set_param([model '/IntegratorY'],'InitialCondition',num2str(ICs(k,2)));
    set_param([model '/IntegratorZ'],'InitialCondition',num2str(ICs(k,3)));

    simOut = sim(model);
X = simOut.X.Data;
Y = simOut.Y.Data;
Z = simOut.Z.Data;

    % remove transient
    cut = round(0.2*length(X));
    X = X(cut:end); Y = Y(cut:end); Z = Z(cut:end);

    h = animatedline('Color',colors(k,:),'LineWidth',1.2);
    drawnow;  % ✅ REQUIRED

    for i = 1:10:length(X)
        addpoints(h,X(i),Y(i),Z(i));
        axis manual;
        drawnow;
    end

end

