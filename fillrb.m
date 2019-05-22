function H=fillrb(F, d0, n) 
% FILLRB Digunakan untuk membentuk fungsi transfer 
%    filter lolos-rendah Butterworth. 
%    F = citra berskala keabuan 
%    d0 = ambang frekuensi (0 s/d 1) 
%    n = orde filter   

[a, b] = size(F);  %Peroleh ukuran citra   
% Menentukan ukuran baru untuk perluasan citra 
r = nextpow2(2 * max(a, b)); 
p = 2 ^ r; 
q = p;   

% Menentukan jangkauan frekuensi u dan v 
u = 0:(p - 1); 
v = 0:(q - 1);   

% Hitung indeks untuk meshgrid 
idx = find(u > q/2); 
u(idx) = u(idx) - q; 
idy = find(v > p/2); 
v(idy) = v(idy) - p;

% Peroleh array meshgrid 
[V, U] = meshgrid(v, u);   

% Hitung jarak D(v,u) 
D = sqrt(V.^2 + U.^2);   

% Menentukan n kalau n tidak disebutkan 
if nargin == 2
      n = 1; 
end   

ambang = d0 * p;  % Hitung frekuensi ambang 
H = exp(-(D.^2) ./ (2 * ambang ^ 2)); 