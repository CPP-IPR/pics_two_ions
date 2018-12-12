
clc; clearvars ;
format long
eps = 8.85E-12;
eV = 1.6E-19;
AMU = 1.66E-27;
Te = 1*eV;
mi = 40*AMU;
me = 9.1E-31;
cs = sqrt(Te/mi);
NC = 200; 
data=importdata('results.dat');
n=NC+1;
DT = 5E-12;
Time = 0;
n0 = 1E16;
LD = sqrt(eps*Te/(n0*eV^2));
L2_prev = 0;
file = fopen('res.txt','w');

for i=1:length(data(:,1))/n    
    x=data((i-1)*n+1:i*n,1);
    ndi1=data((i-1)*n+1:i*n,2);
    ndi2=data((i-1)*n+1:i*n,3);
    nde=data((i-1)*n+1:i*n,4);
    
    veli1 = data((i-1)*n+1:i*n,5);
    veli2 = data((i-1)*n+1:i*n,6);
    veli1 = veli1/cs;    
    veli2 = veli2/cs;
    
    vele = data((i-1)*n+1:i*n,7);   
    
    % Store wall data   
    rho = data((i-1)*n+1:i*n,8);
    phi=data((i-1)*n+1:i*n,9);
    EF = data((i-1)*n+1:i*n,10);    
%--------------------------------------------------------------------------
    m = length(x);
    T(i) = Time;
    A1(i) = veli1(ceil(m/2));
    B1(i) = veli2(ceil(m/2));

    A2(i) = veli1(ceil(m/2 + m/4));
    B2(i) = veli2(ceil(m/2 + m/4));
    
    A3(i) = veli1(ceil(m/2 - m/4));
    B3(i) = veli2(ceil(m/2 - m/4));
    

%--------------------------------------------------------------------------
    
    % Compute the Fluxes
%     gamma_i = ndi1.*vele;
%     gamma_e = nde.*sqrt(Te/(2*pi*me));
%     
%     I(i)= Time;
%     GI(i)= gamma_i(end);
%     GE(i)= gamma_e(end);
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    
%     figure(1)
%     subplot(221), plot(x/LD, phi,'linewidth',2),grid on 
%     xlabel('x'),ylabel('Electric Potential')
%     h = sprintf('Time = %g (sec)',Time);
%     title(h);
%     
%     subplot(222), plot(x/LD, ndi1, x/LD, ndi2, x/LD, nde,'linewidth',2),grid on     
%     xlabel('x'),ylabel('Densities')
%     legend('ndi_1','ndi_2','nde')
%     
%     subplot(223), plot(x/LD, ndi1+ndi2, x/LD, nde,'linewidth',2),grid on
%     xlabel('x'),ylabel('Densities')
%     legend('ndi','nde')
%     
% %     subplot(223), plot(x/LD, EF,'linewidth',2),grid on 
% %     xlabel('x'),ylabel('Electric Field')
%     
%     subplot(224), plot(x/LD,veli1,'r', x/LD,veli2, 'b','linewidth',2),grid on 
%     xlabel('x'),ylabel('Ion velocities') 
%     %  legend('veli1','veli2')
%    pause(0.1) ;    
%--------------------------------------------------------------------------    
%     figure(5)
%     dV_p = (abs(veli1).^2) - (abs(veli2).^2);
%     plot(x/LD, dV_p),grid on
%     pause(0.1)
%--------------------------------------------------------------------------
%    figure(2)
%     vel_diff = veli1 - veli2;
%     plot(x/LD,vel_diff, 'k','linewidth',2),grid on 
%     xlabel('x'),ylabel('Ion Velocity Difference')
    
%     vel_diff = veli1(end) - veli2(end);
%     plot(Time,abs(vel_diff), 'k.','MarkerSize',10),grid on, hold on 
%     xlabel('Time'),ylabel('Ion Velocity Difference At the wall')
%     pause(0.1) ;  

% figure(3)
% [acor,lag] = xcorr(veli1,veli2);
% plot(lag,acor,'linew',2),grid on
% title(i)
% pause(0.1)
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%     figure(2)
%     plot(x,gamma_i/(n0*cs),'k', x,gamma_e/(n0*cs),'r','linewidth',2),grid on 
%     xlabel('x'),ylabel('Flux')
%     h = sprintf('Time = %g (sec)',Time);
%     title(h);
%     pause(0.1)
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
    % Check for the Bohm criterion
    L2_new = veli1(end) - 1;
    if (abs(L2_new - L2_prev) < 1E-3)
        break;
    end
   % disp(abs(L2_new - L2_prev));
    k(i) = i;
    m(i) = (L2_new - L2_prev);
        
    fprintf(file,'%g \t %g\n',Time, L2_prev);
    
    L2_prev = L2_new;        
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Time = Time + 50*DT;
    %mov(i) = getframe(gcf);
end
 %movie2gif(mov, 'plot2.gif','DelayTime',0.5,'LoopCount',5)
figure(1)
[acor1,lag1] = xcorr(A1,B1);
subplot(311), plot(lag1,acor1,'linew',2), grid on

[acor2,lag2] = xcorr(A2,B2);
subplot(312), plot(lag2,acor2,'linew',2), grid on

[acor3,lag3] = xcorr(A3,B3);
subplot(313), plot(lag3,acor3,'linew',2), grid on

figure(2)
plot(T, A2, 'r', T, B2, 'b','linew',2), grid on

figure(3)
[acf,lags] = xcorr(A1);
plot(lags,acf),grid on

figure(4)
subplot(311), plot(A1,B1,'.','linew',2), grid on
subplot(312), plot(A2,B2,'.','linew',2), grid on
subplot(313), plot(A3,B3,'.','linew',2), grid on

