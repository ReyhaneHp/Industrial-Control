clc
clear
s=tf('s');
G=129.1/(s^4+9.3*s^3+28.5*s^2+56.27*s+61.45);
stepplot(G);
