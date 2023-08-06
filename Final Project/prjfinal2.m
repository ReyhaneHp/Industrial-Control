clc
clear
s=tf('s');
%Transfer Functions
G=111.45*(s+5.2)/((s+2)*(s+2.8)*(s+3)*(s+8.8)*(s+9.8));
step(G);
hold on
theta=6.1292;
%%%%%%%%P
%%%IAE
a1=1.4;  b1=0.92; c1=1.14;  d1=0.75;   e1=0.48;   f1=1.14;
k1=(1/0.4)*a1*(theta^(-b1));
Ti1=1.3*c1*(theta^(d1));
Td1=1.3*e1*(theta^(f1));
C1=k1*(1+(1/(Ti1*s))+(Td1*s));
sys1=(G*C1)/(1+G*C1);
step(sys1);
hold on
%%%ISE
a2=1.5;  b2=0.95; c2=0.92;  d2=0.77;   e2=0.56;   f2=1;
k2=(1/0.4)*a2*(theta^(-b2));
Ti2=1.3*c2*(theta^(d2));
Td2=1.3*e2*(theta^(f2));
C2=k2*(1+(1/(Ti2*s))+(Td2*s));
sys2=(G*C2)/(1+G*C2);
step(sys2);
hold on
%%%ITAE
a3=1.36;  b3=0.95; c3=1.18;  d3=0.74;   e3=0.38;   f3=1;
k3=(1/0.4)*a3*(theta^(-b3));
Ti3=1.3*c3*(theta^(d3));
Td3=1.3*e3*(theta^(f3));
C3=k3*(1+(1/(Ti3*s))+(Td3*s));
sys3=(G*C3)/(1+G*C3);
step(sys3);
hold on

%ZN1
k=2.5;       Ti=0.7;        Td=0.175;
C=k*(1+(1/(Ti*s))+(Td*s));
sys=(G*C)/(1+G*C);
step(sys);
hold on

%Z-N2
K=9;    Ti=0.25*pi; Td=0.0625*pi;
C=k*(1+(1/(Ti*s))+(Td*s));
sys=(G*C)/(1+G*C);
step(sys);
hold on

%CHR
k=1.25;    Ti=0.2917;   Td=0.1459;
C=k*(1+(1/(Ti*s))+(Td*s));
sys=(G*C)/(1+G*C);
step(sys);
hold on

%Cohen-Coon
k=2.94878;    Ti=0.792047;   Td=0.123199;
C=k*(1+(1/(Ti*s))+(Td*s));
sys=(G*C)/(1+G*C);
step(sys);
hold on
legend('G','sys with PID controler IAE','sys with PID controler ISE','sys with PID controler ITAE','Z-N1','Z-N2','Chein,Hrones and Reswick','Cohen-Coon');
