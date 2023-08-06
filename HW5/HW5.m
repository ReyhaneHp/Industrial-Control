clc
clear
s=tf('s');

G=317/(s^4+19.2*s^3+116.6*s^2+264*s+180);
C=3.24*(1+(1/(0.74*s))+0.185*s);
C1=3.24/(0.74*s);
C2=3.24*(1+0.185*s);
G_ClosedLoop=(G)/(1+G);
G_Controler=G*C/(1+(G*C));
H=G*C1/(1+G*C1+G*C2);
step(G);
hold on;
step (G_ClosedLoop);
hold on;
step (H);
hold on;
step (G_Controler);
legend('G','G_ClosedLoop','H','G_Controler');
S=stepinfo(G_Controler);