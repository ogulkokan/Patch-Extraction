clc
clear all


img = imread('./image/1.png');
figure(1);
imshow(img)

patch_size = 20; %this is patch size.if you only click it always 
%extract always square patches. i.e 20x20. But if you drag mouse, you can
%choose any shape or size.

patch_number = 5; % number of patches you want to extract.



S = [0 0 patch_size-1 patch_size-1];

for i = 1:patch_number
hold on
rect = getrect;
z = S + rect;
h = imrect(gca, z);
patch = imcrop(img,z);
imwrite(patch,sprintf('./patches_jpg/%d.jpg',i))
hold off

%save every patches inside .mat file as matrix
filename = fullfile(pwd, sprintf('./patches_matrix/patch_%d%d.mat',i));
% 'patch_matrix.mat';
save(filename,'patch')
end

%save the image showing with patch locations
img = getframe;
save_file_name = strcat('./patch_locations/', 'patch_locations.jpg');
imwrite(img.cdata, save_file_name)






