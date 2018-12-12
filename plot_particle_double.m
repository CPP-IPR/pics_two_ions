
clc; clearvars;
Max_time_step = 15000;
time_interval = 50;
n=Max_time_step/time_interval;
ts=0;

for i = 1:n 
h1=sprintf('output/i1%d.dat',ts);
d1=importdata(h1);

h2=sprintf('output/i2%d.dat',ts);
d2=importdata(h2);

figure(1)
x1 = d1(:,1); 
v1 = d1(:,2);

x2 = d2(:,1); 
v2 = d2(:,2);

% disp(length(x))
plot(x1,v1,'r.',x2,v2,'b.','MarkerSize',1.2), grid on
axis([0 0.002 -10000 10000])
legend('Heavy-ion','light-ion')
title(ts)
pause(0.1)

ts = ts + 50;
end
