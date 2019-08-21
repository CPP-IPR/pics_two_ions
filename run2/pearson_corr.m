
function R = pearson_corr(x,y)
% This function file is reponsible for calculating the pearson correlation
% between two datasets. The datasets must be of equal length. 

if length(x)~=length(y)
    disp('Vectors must be of same length !');
    return;
end

xbar = mean(x);
ybar = mean(y);
XY = 0;
SUMX2 = 0;
SUMY2 = 0;
for i=1:length(x)
    X = x(i)-xbar;
    Y = y(i)-ybar;
    XY = XY + X*Y;
    X2 = (x(i)-xbar)^2;
    Y2 = (y(i)-ybar)^2;  
    SUMX2 = SUMX2 + X2;
    SUMY2 = SUMY2 + Y2;    
end
    SUMX2 = sqrt(SUMX2);
    SUMY2 = sqrt(SUMY2);
    SUMXY2 = SUMX2*SUMY2;
    
    R = XY/SUMXY2; 
end