function [G] = drperiodik(F, a, bx, by) 
% DRPERIODIK Menghasilkan citra yang teklah ditambahi 
%    derau periodis. 
%    F = Citra berskala keabuan 
%    b = penegas derau (1, 2, 3, ...) 
%    ax dan ay menentukan kemiringan derau 
if nargin < 4     
  a = 3; bx = 3; by = 5; 
end   
[m, n] = size(F); 
for i=1:m
       for j=1:n
         X(i,j) = j;
         Y(i,j) = i;
       end 
end   
derau = a  * sin(X/bx + Y/by) + 1;   
G = uint8(double(F) + derau);