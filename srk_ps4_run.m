%---------------------------
%Define time span
%----------------------------
timestart = 0;
timeend = 1000; 
timespan = [timestart timeend];
%----------------------------
%Define Initial Values
%---------------------------
%Setup initial conditions
x0 = [10.0; %E0, uM
      0.0; %E1, uM
      0.0; %E1star, uM
      2.0; %B, uM
      0.0; %Bp, uM
      0.0;%E1starB, uM
      0.0; %E2starBp, uM
      ]
 
 L = [0, 0.01, 0.1, 1, 10]; %ligand concentrations, uM 
%----------------------
%Run ODEs and Plot
%---------------------
for i = 1:length(L)
    Li = L(i); %current ligand concentration
    %Run values
    [t,x] = ode45(@ps4_balances, timespan, x0, [], Li);
    %Plot 
    figure(1)
    subplot(3,2,(i+1))
    plot(t,x(:,3));
    title(strcat('L is ',' ', num2str(Li)))
    xlabel('Time(sec)')
    ylabel('Response Estar (uM)')
end

for i = 1:length(L)
    Li = L(i); %current ligand concentration
    %Run values
    [t,x] = ode45(@ps4_balances_noBinb, timespan, x0, [], Li);
    %Plot 
    figure(2)
    subplot(3,2,(i+1))
    plot(t,x(:,3));
    title(strcat('L is ',' ', num2str(Li)))
    xlabel('Time(sec)')
    ylabel('Response Estar (uM)')
end

%--------------------
%Plot
%--------------------
