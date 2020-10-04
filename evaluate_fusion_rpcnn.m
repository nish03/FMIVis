mri_nsct_rpcnn1 = imread('Images/MRI/1.png');
pet_nsct_rpcnn1 = imread('Images/PET/1.png');
fused_nsct_rpcnn1 = imread('Images/Results/fuse_nsct_rpcnn1.png');
[mri_map_nsct_rpcnn1, pet_map_nsct_rpcnn1] = fmi(mri_nsct_rpcnn1, pet_nsct_rpcnn1, fused_nsct_rpcnn1);
imshow(mri_map_nsct_rpcnn1);
colormap jet;
colorbar;
imshow(pet_map_nsct_rpcnn1);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexnsct_rpcnn1 = uint8(floor(mri_map_nsct_rpcnn1 * 255));
mri_map_nsct_rpcnn1_rgb      = ind2rgb(mriGrayIndexnsct_rpcnn1, jet(256));
imshow(mri_map_nsct_rpcnn1_rgb)

petGrayIndexnsct_rpcnn1 = uint8(floor(pet_map_nsct_rpcnn1 * 255));
pet_map_nsct_rpcnn1_rgb      = ind2rgb(petGrayIndexnsct_rpcnn1, jet(256));
imshow(pet_map_nsct_rpcnn1_rgb)

fused_nsct_rpcnn1_rgb = zeros(254,254,3,'uint8')
fused_nsct_rpcnn1_rgb(:,:,1)  = uint8(floor(mri_map_nsct_rpcnn1_rgb(:,:,1) * 255));
fused_nsct_rpcnn1_rgb(:,:,2)  = uint8(floor(pet_map_nsct_rpcnn1_rgb(:,:,2) * 255));
fused_nsct_rpcnn1_rgb(:,:,3)  = fused_nsct_rpcnn1(2:255,2:255)
imshow(fused_nsct_rpcnn1_rgb)




mri_nsct_rpcnn3 = imread('Images/MRI/3.png');
pet_nsct_rpcnn3 = imread('Images/PET/3.png');
fused_nsct_rpcnn3 = imread('Images/Results/fuse_nsct_rpcnn3.png');
[mri_map_nsct_rpcnn3, pet_map_nsct_rpcnn3] = fmi(mri_nsct_rpcnn3, pet_nsct_rpcnn3, fused_nsct_rpcnn3);
imshow(mri_map_nsct_rpcnn3);
colormap jet;
colorbar;
imshow(pet_map_nsct_rpcnn3);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexnsct_rpcnn3 = uint8(floor(mri_map_nsct_rpcnn3 * 255));
mri_map_nsct_rpcnn3_rgb      = ind2rgb(mriGrayIndexnsct_rpcnn3, jet(256));
imshow(mri_map_nsct_rpcnn3_rgb)

petGrayIndexnsct_rpcnn3 = uint8(floor(pet_map_nsct_rpcnn3 * 255));
pet_map_nsct_rpcnn3_rgb      = ind2rgb(petGrayIndexnsct_rpcnn3, jet(256));
imshow(pet_map_nsct_rpcnn3_rgb)

fused_nsct_rpcnn3_rgb = zeros(254,254,3,'uint8')
fused_nsct_rpcnn3_rgb(:,:,1)  = uint8(floor(mri_map_nsct_rpcnn3_rgb(:,:,1) * 255));
fused_nsct_rpcnn3_rgb(:,:,2)  = uint8(floor(pet_map_nsct_rpcnn3_rgb(:,:,2) * 255));
fused_nsct_rpcnn3_rgb(:,:,3)  = fused_nsct_rpcnn3(2:255,2:255)
imshow(fused_nsct_rpcnn3_rgb)


mri_nsct_rpcnn4 = imread('Images/MRI/4.png');
pet_nsct_rpcnn4 = imread('Images/PET/4.png');
fused_nsct_rpcnn4 = imread('Images/Results/fuse_nsct_rpcnn4.png');
[mri_map_nsct_rpcnn4, pet_map_nsct_rpcnn4] = fmi(mri_nsct_rpcnn4, pet_nsct_rpcnn4, fused_nsct_rpcnn4);
imshow(mri_map_nsct_rpcnn4);
colormap jet;
colorbar;
imshow(pet_map_nsct_rpcnn4);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexnsct_rpcnn4 = uint8(floor(mri_map_nsct_rpcnn4 * 255));
mri_map_nsct_rpcnn4_rgb      = ind2rgb(mriGrayIndexnsct_rpcnn4, jet(256));
imshow(mri_map_nsct_rpcnn4_rgb)

petGrayIndexnsct_rpcnn4 = uint8(floor(pet_map_nsct_rpcnn4 * 255));
pet_map_nsct_rpcnn4_rgb      = ind2rgb(petGrayIndexnsct_rpcnn4, jet(256));
imshow(pet_map_nsct_rpcnn4_rgb)

fused_nsct_rpcnn4_rgb = zeros(254,254,3,'uint8')
fused_nsct_rpcnn4_rgb(:,:,1)  = uint8(floor(mri_map_nsct_rpcnn4_rgb(:,:,1) * 255));
fused_nsct_rpcnn4_rgb(:,:,2)  = uint8(floor(pet_map_nsct_rpcnn4_rgb(:,:,2) * 255));
fused_nsct_rpcnn4_rgb(:,:,3)  = fused_nsct_rpcnn4(2:255,2:255)
imshow(fused_nsct_rpcnn4_rgb)