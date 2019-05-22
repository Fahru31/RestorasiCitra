function [G] = filmed(F, ukuran) 
% FILMED Melakukan penghilangan derau dengan 
%     menggunakan filter median. 
%     F = Citra berskala keabuan 
%     ukuran = ukuran jendela 
%     orde = orde filter 
%     G = Citra hasil pemrosesan 
if nargin < 2
       ukuran = 3; 
end   
[m, n] = size(F);   
setengah = floor(ukuran / 2); 
F = double(F); 
G = zeros(m-2*setengah, n-2*setengah); 
Nilai = zeros(1,ukuran * ukuran);   
for i=1+setengah : m-setengah
       for j=1+setengah: n-setengah
         indeks = 1;
         for p = -setengah : setengah
           for q = -setengah : setengah
             Nilai(indeks) = F(i+p, j+q);
             indeks = indeks + 1;
           end
         end
         indeks = indeks - 1; % jumlah data
         % Urutkan data pada array Nilai         
         for p = 2: indeks
           x = Nilai(p);
           % Sisipkan x ke dalam data[1..p-1]
           q = p - 1;
           ketemu = 0;
           while ((q >= 1) && (~ketemu))
             if (x < Nilai(q))
               Nilai(q+1) = Nilai(q);
               q = q - 1;
             else
               ketemu = 1;
             end
             Nilai(q+1) = x;
           end
         end
         % Gunakan nilai median
         G(i-setengah, j-setengah) = Nilai(floor(ukuran * ukuran/2) + 1);
       end 
end
G = uint8(G); 
       
         