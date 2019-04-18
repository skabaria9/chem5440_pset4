function dxdt = ps4_balances(t,x,L_input)

%----------
%Define Species Variables (all uM)
%------------
E0=x(1);
E1=x(2);
E1star=x(3);
B=x(4);
Bp=x(5);
E1starB=x(6);
E1starBp=x(7);

A = E1star; 

%-------------
%Parameters
%------------

%Current Concentrations
R=0.2; %uM
%Ligand
if t < 20
    L = 0; %uM, initial
else
    L = L_input;
end

L = L_input; % all the time

%Parameters
kr=0.1; %s^-1 
ab=1000;%s^-1*uM^-1
db=1;
kb=0;
abp=100;%s^-1*uM^-1
dbp=0.01; %s^-1
kbp=1; %s^-1
kplus=1; %s^-1*uM^-1
kminus=1; %s^-1

%Calculate Vmax
VmaxR=kr*R;
%Calculate values based on ligand concentration
a1plus=1/(1+L);
a1minus=L/(L+1);
B1=2.5*L/(1+L);



%---------------------------------
%Define Differential Equations
%--------------------------------
dxdt = zeros(7,1);

%Write the differential equations
dxdt(1)=kbp*E1starBp + kb*E1starB - VmaxR;%E0
dxdt(2)=-a1plus*E1 + a1minus*E1star + VmaxR + B1*E1starB + B1*E1starBp; %E1
dxdt(3)= a1plus*E1 - a1minus*E1star - E1star*Bp*abp + E1starBp*dbp - E1star*B*ab + E1starB*db;%E1star
dxdt(4)=-kplus*E1star*B + kminus*Bp + kb*E1starB + B1*E1starB + db*E1starB - ab*E1star*B; %B
dxdt(5)= kplus*E1star*B - kminus*Bp -abp*E1star*Bp+(kbp+B1+dbp)*E1starBp; %Bp
dxdt(6)=  ab*E1star*B -db*E1starB - B1*E1starB -kb*E1starB; %E1starB
dxdt(7)=  abp*E1star*Bp -dbp*E1starBp - B1*E1starBp- kbp*E1starBp; %E1starBp
    
    
end 