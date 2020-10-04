mri_nsct_pcdc1 = imread('Images/MRI/1.png');
pet_nsct_pcdc1 = imread('Images/PET/1.png');
fused_nsct_pcdc1 = imread('Images/Results/fused_nsct_pcdc1.png');
[mri_map_nsct_pcdc1, pet_map_nsct_pcdc1] = fmi(mri_nsct_pcdc1, pet_nsct_pcdc1, fused_nsct_pcdc1);
imshow(mri_map_nsct_pcdc1);
colormap jet;
colorbar;
imshow(pet_map_nsct_pcdc1);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexnsct_pcdc1 = uint8(floor(mri_map_nsct_pcdc1 * 255));
mri_map_nsct_pcdc1_rgb      = ind2rgb(mriGrayIndexnsct_pcdc1, jet(256));
imshow(mri_map_nsct_pcdc1_rgb)

petGrayIndexnsct_pcdc1 = uint8(floor(pet_map_nsct_pcdc1 * 255));
pet_map_nsct_pcdc1_rgb      = ind2rgb(petGrayIndexnsct_pcdc1, jet(256));
imshow(pet_map_nsct_pcdc1_rgb)

fused_nsct_pcdc1_rgb = zeros(254,254,3,'uint8')
fused_nsct_pcdc1_rgb(:,:,1)  = uint8(floor(mri_map_nsct_pcdc1_rgb(:,:,1) * 255));
fused_nsct_pcdc1_rgb(:,:,2)  = uint8(floor(pet_map_nsct_pcdc1_rgb(:,:,2) * 255));
fused_nsct_pcdc1_rgb(:,:,3)  = fused_nsct_pcdc1(2:255,2:255)
imshow(fused_nsct_pcdc1_rgb)


mri_nsct_pcdc3 = imread('Images/MRI/3.png');
pet_nsct_pcdc3 = imread('Images/PET/3.png');
fused_nsct_pcdc3 = imread('Images/Results/fused_nsct_pcdc3.png');
[mri_map_nsct_pcdc3, pet_map_nsct_pcdc3] = fmi(mri_nsct_pcdc3, pet_nsct_pcdc3, fused_nsct_pcdc3);
imshow(mri_map_nsct_pcdc3);
colormap jet;
colorbar;
imshow(pet_map_nsct_pcdc3);
colormap jet;
colorbar;

mriGrayIndexnsct_pcdc3 = uint8(floor(mri_map_nsct_pcdc3 * 255));
mri_map_nsct_pcdc3_rgb      = ind2rgb(mriGrayIndexnsct_pcdc3, jet(256));
imshow(mri_map_nsct_pcdc3_rgb)

petGrayIndexnsct_pcdc3 = uint8(floor(pet_map_nsct_pcdc3 * 255));
pet_map_nsct_pcdc3_rgb      = ind2rgb(petGrayIndexnsct_pcdc3, jet(256));
imshow(pet_map_nsct_pcdc3_rgb)

fused_nsct_pcdc3_rgb = zeros(254,254,3,'uint8')
fused_nsct_pcdc3_rgb(:,:,1)  = uint8(floor(mri_map_nsct_pcdc3_rgb(:,:,1) * 255));
fused_nsct_pcdc3_rgb(:,:,2)  = uint8(floor(pet_map_nsct_pcdc3_rgb(:,:,2) * 255));
fused_nsct_pcdc3_rgb(:,:,3)  = fused_nsct_pcdc3(2:255,2:255)
imshow(fused_nsct_pcdc3_rgb)


mri_nsct_pcdc4 = imread('Images/MRI/4.png');
pet_nsct_pcdc4 = imread('Images/PET/4.png');
fused_nsct_pcdc4 = imread('Images/Results/fused_nsct_pcdc4.png');
[mri_map_nsct_pcdc4, pet_map_nsct_pcdc4] = fmi(mri_nsct_pcdc4, pet_nsct_pcdc4, fused_nsct_pcdc4);
imshow(mri_map_nsct_pcdc4);
colormap jet;
colorbar;
imshow(pet_map_nsct_pcdc4);
colormap jet;
colorbar;

mriGrayIndexnsct_pcdc4 = uint8(floor(mri_map_nsct_pcdc4 * 255));
mri_map_nsct_pcdc4_rgb      = ind2rgb(mriGrayIndexnsct_pcdc4, jet(256));
imshow(mri_map_nsct_pcdc4_rgb)

petGrayIndexnsct_pcdc4 = uint8(floor(pet_map_nsct_pcdc4 * 255));
pet_map_nsct_pcdc4_rgb      = ind2rgb(petGrayIndexnsct_pcdc4, jet(256));
imshow(pet_map_nsct_pcdc4_rgb)

fused_nsct_pcdc4_rgb = zeros(254,254,3,'uint8')
fused_nsct_pcdc4_rgb(:,:,1)  = uint8(floor(mri_map_nsct_pcdc4_rgb(:,:,1) * 255));
fused_nsct_pcdc4_rgb(:,:,2)  = uint8(floor(pet_map_nsct_pcdc4_rgb(:,:,2) * 255));
fused_nsct_pcdc4_rgb(:,:,3)  = fused_nsct_pcdc4(2:255,2:255)
imshow(fused_nsct_pcdc4_rgb)