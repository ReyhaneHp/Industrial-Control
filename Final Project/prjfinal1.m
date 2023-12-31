clc
clear
s=tf('s');
%%
%Zigler-Nicholes (I)
%a=0.48 L=0.35;;
%%%%%%%%P
%aK=1 => k=1/a=1/0.48=2.0833 Tp=4*L=4*0.35=1.4
%C=2.0833;
%%%%%%%%PI
%k=0.9/a=0.9/0.48=1.875     Ti=3L=3*0.35=1.05       Tp=5.7*L=5.7*0.35=1.995
%%%%%%%%PID
%k=1.2/a=1.2/0.48=2.5       Ti=2L=2*0.35=0.7        Td=L/2=0.35/2=0.175      Tp=3.4L=1.19
%%
%Zigler-Nicholes (II)
%Ku*G(jw)=-1
%Ku*G=Ku*(111.45*(jw+5.2)/((jw+2)*(jw+2.8)*(jw+3)*(jw+8.8)*(jw+9.8)));
%Ku=15 w=4 Tu=pi/2
%%%%%%%%P
%K/Ku=0.5 => K=15*0.5=7.5
%%%%%%%%PI
%K/Ku=0.4 => K=15*0.4=6      Ti/Tu=0.8 =>Ti=0.4*pi    Tp/Tu=1.4=>Tp=0.7*pi
%%%%%%%%PID
%K/Ku=0.6 => K=9         Ti/Tu=0.5=>Ti=0.25*pi        Td/Tu=0.125 =>
%Td=0.0625*pi       Tp/Tu=0.85 =>Tp=0.425*pi
%%
%Chein,Hrones and Reswick
%__disturbance response
%_____No overshoot
%%%%%%%%P
%aK=0.3 => k=0.3/a=0.3/0.48=0.6253 
%%%%%%%%PI
%k=0.6/a=0.6/0.48=1.25     Ti=4L=4*0.35=1.4       
%%%%%%%%PID
%k=0.95/a=0.95/0.48=2.375       Ti=2.4L=2.4*0.35=0.84      Td=0.42*L=0.42*0.35=0.147 

%_____20% overshoot
%%%%%%%%P
%aK=0.7 => k=0.7/a=0.7/0.48=1.458 
%%%%%%%%PI
%k=0.7/a=0.7/0.48=1.458     Ti=2.3L=2.3*0.35=0.805   
%%%%%%%%PID
%k=1.2/a=1.2/0.48=2.5      Ti=2L=2*0.35=0.7      Td=0.42*L=0.42*0.35=0.147 





%__step response
%_____No overshoot
%Tg=LKp/a=0.35*0.4/0.48=0.2917
%%%%%%%%P
%aK=0.3 => k=0.3/a=0.3/0.48=0.6253 
%%%%%%%%PI
%k=0.35/a=0.35/0.48=0.7292    Ti=1.2Tg=1.2*0.2917=0.35
%%%%%%%%PID
%k=0.6/a=0.6/0.48=1.25    Ti=1*Tg=0.2917   Td=0.5*Tg=0.5*0.2917=0.1459
%_____20% overshoot
%%%%%%%%P
%aK=0.7 => k=0.7/a=0.7/0.48=1.458 
%%%%%%%%PI
%k=0.6/a=0.6/0.48=1.25    Ti=1*Tg=0.2917
%%%%%%%%PID
%k=0.95/a=0.95/0.48=1.9792    Ti=1.4*Tg=0.4084  Td=0.47*Tg=0.47*0.2917=0.1371
%%
%Cohen-Coon
%T=T_0.63=1.3 s   a=KpL/T=0.4*0.35/1.3=0.1077
%t=L/(L+T)=0.35/(0.35+1.3)=0.2121
%%%%%%%%P
%K=2.27 
%%%%%%%%PI
%k=1.92144    Ti=0.743149
%%%%%%%%PD
%k=2.67374    Td=0.0831118
%%%%%%%%PID
%k=2.94878    Ti=0.792047   Td=0.123199
%%
%theta=t/T=1.3/0.2121=6.1292
%%%%%%%%P
%%%IAE
%a=0.9  b=0.98
%%%ISE
%a=1.4  b=0.92
%%%ITAE
%a=0.5  b=1.08
%k=(1/0.4)*a*(theta^(-b))

%%%%%%%%PI
%%%IAE
%a=0.98  b=0.98 c=1.65  d=0.71
%%%ISE
%a=1.3  b=0.96 c=2.03  d=0.74
%%%ITAE
%a=0.86  b=0.98 c=1.48  d=0.68
%k=(a/K)*a*(theta^(-b))
%Ti=Tc*(theta^(d))

%%%%%%%%PID
%%%IAE
%a=1.4  b=0.92 c=1.14  d=0.75   e=0.48   f=1.14
%%%ISE
%a=1.5  b=0.95 c=0.92  d=0.77   e=0.56   f=1
%%%ITAE
%a=1.36  b=0.95 c=1.18  d=0.74   e=0.38   f=1
%k=(1/K)*a*(theta^(-b))
%Ti=Tc*(theta^(d))
%Td=Te*(theta^(f))


%%
%Transfer Functions
G=111.45*(s+5.2)/((s+2)*(s+2.8)*(s+3)*(s+8.8)*(s+9.8));
step(G);
hold on
G2a=0.4/(1+1.35*s);
G2b=0.48*exp(-0.35*s)/(0.35*s);
Gs=0.4*exp(-0.35*s)/(1+s);
sys=G*C/(1+G*C);
%step(sys);

