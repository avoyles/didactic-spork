clear all; clc;

T = -50:5:150;
R = [69.27 48.55 34.47 24.78 18.01 13.24 9.832 7.372 5.579 4.258 3.277 2.546 1.993 1.573 1.250 1 0.8055 0.6528 0.5323 0.4365 0.3599 0.2983 0.2466 0.2082 0.1753 0.1482 0.1258 0.1073 0.09189 0.07899 0.06815 0.05906 0.05134 0.04479 0.03920 0.03441 0.03030 0.02676 0.02369 0.02104 0.01873] * 10000;

R3= 0:0.5:10000;
e=3.3539264E-03;
b= 2.5609446E-04;
c= 1.9621987E-06;
d= 4.6045930E-08;
T3 = -273+1 ./ (e + b.*(log(R3)) + c.*(log(R3)).^2+ d.*(log(R3)).^3);

mod = @(a,x)(-273+1 ./ (a(1) + a(2).*(log(x)) + a(3).*(log(x)).^2+ a(4).*(log(x)).^3));

beta = nlinfit(R,T,mod,[0.001 0.0001 0.00001 0.00001])

r2 = 695000:-100:1;
T2 =mod(beta,r2);
plot(R,T,r2,T2,R3,T3)
xlabel('Resistanec')
ylabel('Temp (C)')

rsq = R2(T,mod(beta,R))