clc
clear
s=tf('s');

G=317/(s^4+19.2*s^3+116.6*s^2+264*s+180);
C=0.6157*(1+1/(1.285*s)+0.1272*s);

step (sys);