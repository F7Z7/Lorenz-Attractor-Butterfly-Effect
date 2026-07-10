%% test script

[t,x] = ode45(@lorenz,[0 60],[1 1 1]);

figure
plot3(x(:,1),x(:,2),x(:,3))
grid on