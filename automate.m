model = 'lorentz'; 
load_system(model);

% Define parameters (ensure these are in your workspace)
sigma = 10; rho = 28; beta = 8/3; 

% Two very close initial conditions to show the Butterfly Effect
initial_conditions = [
    1, 1, 1;      
    1.0001, 1, 1  
];

num_runs = size(initial_conditions, 1);
colors = {'#0072BD', '#D95319'}; % Professional blue and orange
figure('Color', 'w'); hold on; grid on;

for k = 1:num_runs
    % Set initial conditions to the Integrator blocks
    set_param([model '/IntegratorX'], 'InitialCondition', num2str(initial_conditions(k,1)));
    set_param([model '/IntegratorY'], 'InitialCondition', num2str(initial_conditions(k,2)));
    set_param([model '/IntegratorZ'], 'InitialCondition', num2str(initial_conditions(k,3)));
    
    % Run simulation
    simOut = sim(model);
    
    % Extract data from the timeseries objects
    % Based on your 'whos out' output:
    posX = simOut.X.Data; 
    posY = simOut.Y.Data;
    posZ = simOut.Z.Data;
    
    % Plot in 3D
    plot3(posX, posY, posZ, 'Color', colors{k}, 'LineWidth', 1.2);
end

% 3D Aesthetics
xlabel('X (sig(y-x))'); ylabel('Y (x(p-z)-y)'); zlabel('Z (xy-bz)');
title('Lorenz Attractor Phase Portrait');
legend('Trajectory A', 'Trajectory B', 'Location', 'northeast');
view(45, 20); % Better angle to see the two "wings"
axis tight;