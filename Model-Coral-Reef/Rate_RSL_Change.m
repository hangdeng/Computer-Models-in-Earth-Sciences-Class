% written to complete the analysis made by Joseph Galewsky
% using simple sinuosoidal sea level fluctuation, constant subsidence rate
% (with a slope initial topography), and with the upward growth rate of
% platform building corals (Bosscher and Schlager, 1992); written by Hang
% Deng with inpiration from Joe's paper

clear all
figure(1)

% Time period from paper 0-600ka
ka = 600;
dt = 1;
t = 0:dt:ka;

% constant subsidence rate equation
sub = 5 - (5/600)*t; % subsidence with a slope

% eustatic sea level fluctuations
eus = 5*sin(0.1*t); % sinuosoidal fluctuation estimated from the paper

% combined subsidence and sea level changes
totalrate = sub + eus; 
zcumu = totalrate;
% upward growth of platform-building corals

% start plotting
figure(1)
plot(t,zcumu,'black','linewidth',2);

hold on
plot(t,eus,'b--','linewidth',2);

hold on
plot(t,sub,'g--','linewidth',2);
xlabel('Time (ka)','fontname','arial','fontsize',21);
ylabel('Rate (mm yr-1)','fontname','arial','fontsize',21);
ylim([-10,15]);
set(gca,'XDIR','reverse')