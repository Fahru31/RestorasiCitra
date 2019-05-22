function [G] = dreksponensial(F, a) 
% DREKSPONENSIAL Menghasilkan citra yang telah diberi derau 
%    menggunakan fungsi eksponensial negatif. 
%    F = citra berskala keabuan 
%    varians = varians yang dikehendaki   
if nargin ~= 2  
     error('Penggunaan: dreksponensial(F, a)'); 
end   
if a <= 0  
     error('Parameter berupa sebarang bilangan > 0'); 
end   
[m, n] = size(F);   
F = double(F); 
G = zeros(m, n); 
for i=1 : m  
     for j=1 : n   
       derau = -1/a * log(1 - rand);
       G(i,j) = round(F(i,j) + derau);
       if G(i,j) > 255     
         G(i,j) = 255;
       end    
     end 
end   
G = uint8(G);