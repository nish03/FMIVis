%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%First dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mri_lp_cnn1 = imread('Images/MRI/1.png');
pet_lp_cnn1 = imread('Images/PET/1.png');
fused_lp_cnn1 = imread('Images/Results/fuse_lp_cnn1.png');
[mri_map_lp_cnn1, pet_map_lp_cnn1] = fmi(mri_lp_cnn1, pet_lp_cnn1, fused_lp_cnn1);
imshow(mri_map_lp_cnn1);
colormap jet;
colorbar;
imshow(pet_map_lp_cnn1);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexlpcnn1 = uint8(floor(mri_map_lp_cnn1 * 255));
mri_map_lp_cnn1_rgb      = ind2rgb(mriGrayIndexlpcnn1, jet(256));
imshow(mri_map_lp_cnn1_rgb)

petGrayIndexlpcnn1 = uint8(floor(pet_map_lp_cnn1 * 255));
pet_map_lp_cnn1_rgb      = ind2rgb(petGrayIndexlpcnn1, jet(256));
imshow(pet_map_lp_cnn1_rgb)

fused_lp_cnn1_rgb = zeros(254,254,3,'uint8')
fused_lp_cnn1_rgb(:,:,1)  = uint8(floor(mri_map_lp_cnn1_rgb(:,:,1) * 255));
fused_lp_cnn1_rgb(:,:,2)  = uint8(floor(pet_map_lp_cnn1_rgb(:,:,2) * 255));
fused_lp_cnn1_rgb(:,:,3)  = fused_lp_cnn1(2:255,2:255)
imshow(fused_lp_cnn1_rgb)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Second dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mri_lp_cnn3 = imread('Images/MRI/3.png');
pet_lp_cnn3 = imread('Images/PET/3.png');
fused_lp_cnn3 = imread('Images/Results/fuse_lp_cnn3.png');
[mri_map_lp_cnn3, pet_map_lp_cnn3] = fmi(mri_lp_cnn3, pet_lp_cnn3, fused_lp_cnn3);
imshow(mri_map_lp_cnn3);
colormap jet;
colorbar;
imshow(pet_map_lp_cnn3);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexlpcnn3 = uint8(floor(mri_map_lp_cnn3 * 255));
mri_map_lp_cnn3_rgb      = ind2rgb(mriGrayIndexlpcnn3, jet(256));
imshow(mri_map_lp_cnn3_rgb)

petGrayIndexlpcnn3 = uint8(floor(pet_map_lp_cnn3 * 255));
pet_map_lp_cnn3_rgb      = ind2rgb(petGrayIndexlpcnn3, jet(256));
imshow(pet_map_lp_cnn3_rgb)

fused_lp_cnn3_rgb = zeros(254,254,3,'uint8')
fused_lp_cnn3_rgb(:,:,1)  = uint8(floor(mri_map_lp_cnn3_rgb(:,:,1) * 255));
fused_lp_cnn3_rgb(:,:,2)  = uint8(floor(pet_map_lp_cnn3_rgb(:,:,2) * 255));
fused_lp_cnn3_rgb(:,:,3)  = fused_lp_cnn3(2:255,2:255)
imshow(fused_lp_cnn3_rgb)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Third dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mri_lp_cnn4 = imread('Images/MRI/4.png');
pet_lp_cnn4 = imread('Images/PET/4.png');
fused_lp_cnn4 = imread('Images/Results/fuse_lp_cnn4.png');
[mri_map_lp_cnn4, pet_map_lp_cnn4] = fmi(mri_lp_cnn4, pet_lp_cnn4, fused_lp_cnn4);
imshow(mri_map_lp_cnn4);
colormap jet;
colorbar;
imshow(pet_map_lp_cnn4);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexlpcnn4 = uint8(floor(mri_map_lp_cnn4 * 255));
mri_map_lp_cnn4_rgb      = ind2rgb(mriGrayIndexlpcnn4, jet(256));
imshow(mri_map_lp_cnn4_rgb)

petGrayIndexlpcnn4 = uint8(floor(pet_map_lp_cnn4 * 255));
pet_map_lp_cnn4_rgb      = ind2rgb(petGrayIndexlpcnn4, jet(256));
imshow(pet_map_lp_cnn4_rgb)

fused_lp_cnn4_rgb = zeros(254,254,3,'uint8')
fused_lp_cnn4_rgb(:,:,1)  = uint8(floor(mri_map_lp_cnn4_rgb(:,:,1) * 255));
fused_lp_cnn4_rgb(:,:,2)  = uint8(floor(pet_map_lp_cnn4_rgb(:,:,2) * 255));
fused_lp_cnn4_rgb(:,:,3)  = fused_lp_cnn4(2:255,2:255)
imshow(fused_lp_cnn4_rgb)