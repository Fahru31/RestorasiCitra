clear all;
img = imread('2.jpg');
[G] = drimpuls(img, 0.2);
%[K] = filyp(img,9,-5);
figure(1);
subplot(1,2,1);imshow(G);title('G')
subplot(1,2,2);imshow(img);title('asli')
