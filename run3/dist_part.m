
clc;clearvars;
filename1 = 'output/e1000.dat';
filename2 = 'output/i11000.dat';
filename3 = 'output/i21000.dat';
delimiterIn = '\t';
headerlinesIn = 0;
A = importdata(filename1,delimiterIn,headerlinesIn);
B = importdata(filename2,delimiterIn,headerlinesIn);
C = importdata(filename3,delimiterIn,headerlinesIn);

figure(1);
subplot(311)
scatter(A(1:length(A),1),A(1:length(A),2),'.');
title('Phase Space for electrons');
subplot(312)
scatter(B(1:length(B),1),B(1:length(B),2),'.');
title('Phase Space for Ion-1');
subplot(313)
scatter(C(1:length(C),1),C(1:length(C),2),'.');
title('Phase Space for Ion-2');
print('phase_space_all','-dpng');

%% VDF on location

range1 = [0.0E-3, 0.7E-3, 1.1E-3, 1.5E-3];
range2 = [0.1E-3, 0.8E-3, 1.2E-3, 1.6E-3];

for j = 1:4

    VXe=A(1:length(A),2); 
    Xe=A(1:length(A),1);  
    
    [indexe] = find(Xe(:,1)>range1(j) & Xe(:,1)<range2(j));

    for i = 1:length(indexe)
        VXesp(j,i) = VXe(indexe(i),1);
    end

    VXi1=B(1:length(B),2);
    Xi1=B(1:length(B),1);

    [indexi1] = find(Xi1(:,1)>range1(j) & Xi1(:,1)<range2(j));

    for k = 1:length(indexi1)
        VXi1sp(j,k) = VXi1(indexi1(k),1);
    end
    
    VXi2=C(1:length(C),2);
    Xi2=C(1:length(C),1);

    [indexi2] = find(Xi2(:,1)>range1(j) & Xi2(:,1)<range2(j));

    for l = 1:length(indexi2)
        VXi2sp(j,l) = VXi2(indexi2(l),1);
    end

hold all;
   figure(2);
   subplot(4,1,j);
   ksdensity(VXesp(j,:),'function','pdf');

   xlabel(['Velocity (m/s) location: ' num2str(range1(j)) ' - ' num2str(range2(j))]);
   title('Probability Density Function for electrons');
   print('distf_elec','-dpng');

   figure(3);
   subplot(4,1,j);
   ksdensity(VXi1sp(j,:),'function','pdf');

   xlabel(['Velocity (m/s) location: ' num2str(range1(j)) ' - ' num2str(range2(j))]);
   title('Probability Density Function for Ion-1');
   print('distf_ion1','-dpng');

   figure(4);
   subplot(4,1,j);
   ksdensity(VXi2sp(j,:),'function','pdf');

   xlabel(['Velocity (m/s) location: ' num2str(range1(j)) ' - ' num2str(range2(j))]);
   title('Probability Density Function for Ion-2');
   print('distf_ion2','-dpng');

end
hold all
