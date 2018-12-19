
clc;clearvars;
filename1 = 'output/e1000.dat';
delimiterIn = '\t';
headerlinesIn = 0;
A = importdata(filename1,delimiterIn,headerlinesIn);
figure(1);

scatter(A(1:length(A),1),A(1:length(A),2),'.');   %% for alpha = 05



%% VDF on location

range1 = [0.0E-3, 0.7E-3, 1.1E-3, 1.5E-3];
range2 = [0.1E-3, 0.8E-3, 1.2E-3, 1.6E-3];



for j = 1:4
    VX=A(1:length(A),2); 

    X=A(1:length(A),1);  
    
    [index] = find(X(:,1)>range1(j) & X(:,1)<range2(j));

    for i = 1:length(index)
        VXsp(j,i) = VX(index(i),1);
    end


hold all;
   figure(3);
   subplot(4,1,j);
   ksdensity(VXsp(j,:),'function','pdf');

   xlabel(['Velocity (m/s) location: ' num2str(range1(j)) ' - ' num2str(range2(j))]);
   title('Probability Density Function');

end
hold all
