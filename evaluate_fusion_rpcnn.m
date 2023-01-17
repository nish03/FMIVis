mri = imread('Images/MRI.png');
pet = imread('Images/PET.png');
fused = imread('Images/Results/Fused.png');

[mri_map, pet_map] = fmi(mri, pet, fused, 'none', 7);
imshow(mri_map);
colormap jet;
colorbar;

imshow(pet_map);
colormap jet;
colorbar;


th = 0.7;

fused_rgb = zeros(250,250,3,'uint8');
fused_rgb(:,:,1)  =  floor((th .* mri_map + (1-th)).* double(fused(6:255,6:255)));
fused_rgb(:,:,2)  = floor((th .* pet_map + (1-th)).* double(fused(6:255,6:255)));
fused_rgb(:,:,3)  = fused(6:255,6:255);
imshow(fused_rgb);
