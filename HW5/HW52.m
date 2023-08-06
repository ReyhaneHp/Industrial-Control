clc
clear
s=tf('s');

G=317/(s^4+19.2*s^3+116.6*s^2+264*s+180);
C=2.1662*(1+1/(0.5539*s)+0.1525*s);
sys=G*C/(1+G*C);
step (sys);
