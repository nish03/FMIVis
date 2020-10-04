mri_nsst_papcnn1 = imread('Images/Fusion_Win_3_RB/MRI_Input/1.png');
imshow(mri_nsst_papcnn1)
pet_nsst_papcnn1 = imread('Images/Fusion_Win_3_RB/PET_Input/1.png');
imshow(pet_nsst_papcnn1)
fused_nsst_papcnn1 = imread('Images/Fusion_Win_3_RB/Fused Images/fused_nsst-papcnn1.png');
imshow(fused_nsst_papcnn1)
[mri_map_nsst_papcnn1, pet_map_nsst_papcnn1] = fmi(mri_nsst_papcnn1, pet_nsst_papcnn1, fused_nsst_papcnn1, 'none', 3);
imshow(mri_map_nsst_papcnn1)
colormap jet
colorbar;
imshow(pet_map_nsst_papcnn1);
colormap jet;
colorbar;


%fused image with confidence scores in a RGB image
mriGrayIndexnsst_papcnn1 = uint8(floor(mri_map_nsst_papcnn1 * 255));
mri_map_nsst_papcnn1_rgb      = ind2rgb(mriGrayIndexnsst_papcnn1, jet(256));
imshow(mri_map_nsst_papcnn1_rgb)

petGrayIndexnsst_papcnn1      = uint8(floor(pet_map_nsst_papcnn1 * 255));
pet_map_nsst_papcnn1_rgb      = ind2rgb(petGrayIndexnsst_papcnn1, jet(256));
imshow(pet_map_nsst_papcnn1_rgb)

fused_nsst_papcnn1_rgb = zeros(254,254,3,'uint8')
fused_nsst_papcnn1_rgb(:,:,1)  = uint8(floor(mri_map_nsst_papcnn1_rgb(:,:,1) * 255));
fused_nsst_papcnn1_rgb(:,:,2)  = uint8(floor(pet_map_nsst_papcnn1_rgb(:,:,2) * 255));
fused_nsst_papcnn1_rgb(:,:,3)  = fused_nsst_papcnn1(2:255,2:255)
imshow(fused_nsst_papcnn1_rgb)


mri_nsst_papcnn3 = imread('Images/MRI/3.png');
pet_nsst_papcnn3 = imread('Images/PET/3.png');
fused_nsst_papcnn3 = imread('Images/Results/fused_nsst-papcnn3.png');
[mri_map_nsst_papcnn3, pet_map_nsst_papcnn3] = fmi(mri_nsst_papcnn3, pet_nsst_papcnn3, fused_nsst_papcnn3);
imshow(mri_map_nsst_papcnn3);
colormap jet;
colorbar;
imshow(pet_map_nsst_papcnn3);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexnsst_papcnn3 = uint8(floor(mri_map_nsst_papcnn3 * 255));
mri_map_nsst_papcnn3_rgb      = ind2rgb(mriGrayIndexnsst_papcnn3, jet(256));
imshow(mri_map_nsst_papcnn3_rgb)

petGrayIndexnsst_papcnn3 = uint8(floor(pet_map_nsst_papcnn3 * 255));
pet_map_nsst_papcnn3_rgb      = ind2rgb(petGrayIndexnsst_papcnn3, jet(256));
imshow(pet_map_nsst_papcnn3_rgb)

fused_nsst_papcnn3_rgb = zeros(254,254,3,'uint8')
fused_nsst_papcnn3_rgb(:,:,1)  = uint8(floor(mri_map_nsst_papcnn3_rgb(:,:,1) * 255));
fused_nsst_papcnn3_rgb(:,:,2)  = uint8(floor(pet_map_nsst_papcnn3_rgb(:,:,2) * 255));
fused_nsst_papcnn3_rgb(:,:,3)  = fused_nsst_papcnn3(2:255,2:255)
imshow(fused_nsst_papcnn3_rgb)


mri_nsst_papcnn4 = imread('Images/MRI/4.png');
pet_nsst_papcnn4 = imread('Images/PET/4.png');
fused_nsst_papcnn4 = imread('Images/Results/fused_nsst-papcnn4.png');
[mri_map_nsst_papcnn4, pet_map_nsst_papcnn4] = fmi(mri_nsst_papcnn4, pet_nsst_papcnn4, fused_nsst_papcnn4);
imshow(mri_map_nsst_papcnn4);
colormap jet;
colorbar;
imshow(pet_map_nsst_papcnn4);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexnsst_papcnn4 = uint8(floor(mri_map_nsst_papcnn4 * 255));
mri_map_nsst_papcnn4_rgb      = ind2rgb(mriGrayIndexnsst_papcnn4, jet(256));
imshow(mri_map_nsst_papcnn4_rgb)

petGrayIndexnsst_papcnn4 = uint8(floor(pet_map_nsst_papcnn4 * 255));
pet_map_nsst_papcnn4_rgb      = ind2rgb(petGrayIndexnsst_papcnn4, jet(256));
imshow(pet_map_nsst_papcnn4_rgb)

fused_nsst_papcnn4_rgb = zeros(254,254,3,'uint8')
fused_nsst_papcnn4_rgb(:,:,1)  = uint8(floor(mri_map_nsst_papcnn4_rgb(:,:,1) * 255));
fused_nsst_papcnn4_rgb(:,:,2)  = uint8(floor(pet_map_nsst_papcnn4_rgb(:,:,2) * 255));
fused_nsst_papcnn4_rgb(:,:,3)  = fused_nsst_papcnn4(2:255,2:255)
imshow(fused_nsst_papcnn4_rgb)