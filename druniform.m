function [G] = druniform(F, a, b) 
% DRRAYLEIGH Menghasilkan citra yang telah diberi derau 
%    uniform. 
%    F = citra berskala keabuan 
%    a dan b = paramater untuk menentukan fungsi Rayleigh   
if nargin ~= 3
       error('Penggunaan: drrayleigh(F, a, b)'); 
end 
if a <= 0 || b <= 0
       error('Parameter a atau b berupa sebarang bilangan > 0'); 
end   
[m, n] = size(F);
F = double(F); 
G = zeros(m, n); 
for i=1 : m
       for j=1 : n
         derau = a + (b-a) * rand;
         G(i,j) = round(F(i,j) + derau);
         if G(i,j) > 255
           G(i,j) = 255;
         elseif G(i,j) < 0
           G(i,j) = 0;
         end
       end 
end   
G = uint8(G); 