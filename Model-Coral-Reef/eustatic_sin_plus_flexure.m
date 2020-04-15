
% written to complete the analysis made by Joseph Galewsky
% using simple sinuosoidal sea level fluctuation, flexure subsidence rate
% (with a slope initial topography), and with the upward growth rate of
% platform building corals (Bosscher and Schlager, 1992); written by Hang
% Deng with inpiration from Joe's paper

clear all
figure(1)

%determine parameter inputs
%time variables
tmax = 358; %ka dated using Th method, Galewsky
dt = 1;
t = 0:dt:tmax;

% distance variables
%xmax = 50; % 50 km from coast
%dx = 1;
%x = 0:dx:xmax;

%Sea level using sinuosoidal, eustatic change rate per ka
eus = 50*sin(0.1*t); % sinuosoidal fluctuation estimated from the paper
deusdt = 50*0.1*cos(0.1*t);

% or try real data
% get first column time(ka) data

%subsidence flexure
w0 = 10000; %max deflection = 10km
D = 5 * 10^22;
a = ((4*D/(3300-1030))*9.8)^0.25;
%w=w0*exp(-(x/a))*cos(x/a);
%subsidence flexure rate
c = 100; %10cm/yr = 0.1m/yr = 100m/ka, convergence rate

% ka deflection rate
dflexdt=c.*(a^(-1)).*w0.*exp((-c)*(t/a)).*((-cos(c.*(t/a)))-sin(c.*(t/a)));

%total RSL change annual * 1000........(1000yr - 1ka)
totaldepth=cumsum(deusdt*dt)+cumsum(dflexdt*dt);

%coral growth rate, annual
k = 0.15;
I0 = 2000;
Ik = 450;
Gm = 15; % per ka

% I think the total depth in this equation is an absolute value;
G = Gm*tanh(I0*(exp(-k*(abs(totaldepth)))/Ik));

%put into loop
totalgrowth = cumsum(G*dt);
z = totaldepth + totalgrowth;

% start plotting
figure(1)
plot(t,totaldepth,'g--','linewidth',1);

hold on
plot(t,z,'black','linewidth',2);

xlabel('Time (ka)','fontname','arial','fontsize',21);
ylabel('Meters below modern sea level','fontname','arial','fontsize',21);
%ylim([-3000 500]);
xlim([0,358]);
legend('RSL change','RSL change with coral growth under simple ESL sin curve');