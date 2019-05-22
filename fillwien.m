function [Fb] = filwien(berkas, d, k) 
% FILWIEN Digunakan untuk melihat efek filter Wiener  
%     Argumen berkas adalah nama berkas yang diuji, 
%     d menentukan ambang frekuensi, dan k adalah  
%     kosntanta.   
Img=imread('C:\Users\FahRii\Downloads\Compressed\restorasi-citra\1.jpg'); 
[a,b] = size(Img);   
% Peroleh ukuran  untuk kepentingan perluasan citra 
r = nextpow2(2 * max(a, b)); 
p = 2 ^ r; 
q = p;    
% Proses untuk memperoleh citra yang ditapis 
Ff = fft2(Img,p,q); 
H = fillrb(Img, d, 2); 
Fh = Ff .* H;   
Fa = abs(ifft2(Fh)); 
Fa = uint8(255*mat2gray(Fa)); 
Fa = Fa(1:a, 1:b);   
% Menggunakan citra yang ditapis untuk kepentingan inversi 
Fi = fft2(Fa,p,q) .* abs(H).^2 ./ (abs(H) .^ 2 + k) ./ H; 
Fb = abs(ifft2(Fi)); 
Fb = uint8(255*mat2gray(Fb)); 
Fb = Fb(1:a, 1:b);   
% Tampilkan citra asli dan hasil pemrosesan 
close all; 
figure, imshow(Img); 
figure, imshow(Fa); 
figure, imshow(Fb);