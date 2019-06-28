function [ R ] = Matern52_matrix( x1,x2,theta )
% Create autocorrelation matrix with Matern52 kernel 

n = size(x1,2);
m1 = size(x1,1);
m2 = size(x2,1);

R = -inf*(ones(m1,m2));
for i=1: m1
    
    for j=1:m2
        R_val = 1;
        for p=1:n
        r = x1(i,p)-x2(j,p);
        kval = (sqrt(5)*abs(r))/theta(p);
        val = (1+ kval + (5*(r^2))/(3*(theta(p)^2)))*exp(-kval);
        R_val = R_val* val;
        end
        R(i,j) = R_val;
    end
end



end

