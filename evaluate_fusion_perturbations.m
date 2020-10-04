%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%First dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%input and fused images
mri_prop1 = imread('Images/Fusion_Win_3_RB/MRI_Input/1.png');
imshow(mri_prop1)
pet_prop1 = imread('Images/Fusion_Win_3_RB/PET_Input/1.png');
imshow(pet_prop1)
fused_prop1 = imread('Images/Fusion_Win_3_RB/Fused Images/fused_prop1.png');
imshow(fused_prop1)

%perturbed images
fused_prop1_gaussian = imnoise(fused_prop1,'gaussian')
imshow(fused_prop1_gaussian)
imwrite(fused_prop1_gaussian, 'Images/Results/fused_prop1_gaussian.png')

fused_prop1_poisson = imnoise(fused_prop1,'poisson')
imshow(fused_prop1_poisson)
imwrite(fused_prop1_poisson, 'Images/Results/fused_prop1_poisson.png')

fused_prop1_salt_pepper = imnoise(fused_prop1,'salt & pepper')
imshow(fused_prop1_salt_pepper)
imwrite(fused_prop1_salt_pepper, 'Images/Results/fused_prop1_salt_pepper.png')

fused_prop1_speckle = imnoise(fused_prop1,'speckle')
imshow(fused_prop1_speckle)
imwrite(fused_prop1_speckle, 'Images/Results/fused_prop1_speckle.png')

fused_prop1_blur= imgaussfilt(fused_prop1,2);
imshow(fused_prop1_blur)
imwrite(fused_prop1_blur, 'Images/Results/fused_prop1_blur.png')


%confidence score calculation
[mri_map_prop1, pet_map_prop1] = fmi(mri_prop1, pet_prop1, fused_prop1);
[mri_map_prop1_gaussian, pet_map_prop1_gaussian] = fmi(mri_prop1, pet_prop1, fused_prop1_gaussian);
[mri_map_prop1_poisson, pet_map_prop1_poisson] = fmi(mri_prop1, pet_prop1, fused_prop1_poisson);
[mri_map_prop1_salt_pepper, pet_map_prop1_salt_pepper] = fmi(mri_prop1, pet_prop1, fused_prop1_salt_pepper);
[mri_map_prop1_speckle, pet_map_prop1_speckle] = fmi(mri_prop1, pet_prop1, fused_prop1_speckle);
[mri_map_prop1_blur, pet_map_prop1_blur] = fmi(mri_prop1, pet_prop1, fused_prop1_blur);

%plot respective heat maps
imshow(mri_map_prop1);
colormap jet;
colorbar;

imshow(mri_map_prop1_gaussian);
colormap jet;
colorbar;

imshow(mri_map_prop1_poisson);
colormap jet;
colorbar;

imshow(mri_map_prop1_salt_pepper);
colormap jet;
colorbar;

imshow(mri_map_prop1_speckle);
colormap jet;
colorbar;

imshow(mri_map_prop1_blur);
colormap jet;
colorbar;


imshow(pet_map_prop1);
colormap jet;
colorbar;


imshow(pet_map_prop1_gaussian);
colormap jet;
colorbar;

imshow(pet_map_prop1_poisson);
colormap jet;
colorbar;

imshow(pet_map_prop1_salt_pepper);
colormap jet;
colorbar;

imshow(pet_map_prop1_speckle);
colormap jet;
colorbar;

imshow(pet_map_prop1_blur);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
%input and fused images
mri_prop1 = imread('Images/Fusion_Win_3_RB/MRI_Input/3.png');
imshow(mri_prop1)
pet_prop1 = imread('Images/Fusion_Win_3_RB/PET_Input/3.png');
imshow(pet_prop1)
fused_prop1 = imread('Images/Fusion_Win_3_RB/Fused Images/fused_nsst-papcnn3.png');
imshow(fused_prop1)
[mri_map_prop1, pet_map_prop1] = fmi(mri_prop1, pet_prop1, fused_prop1,'none', 7);
%mri_rgb_map_prop1 = ind2rgb(uint8(255*mri_map_prop1), jet(256))
%imshow(mri_rgb_map_prop1)
%imwrite(mri_rgb_map_prop1,'Images/Fusion_Win_9_RG/MRI_conf_maps/mri_map_papcnn3.png')
%pet_rgb_map_prop1 = ind2rgb(uint8(255*pet_map_prop1), jet(256))
%imshow(pet_rgb_map_prop1)
%imwrite(pet_rgb_map_prop1,'Images/Fusion_Win_9_RG/PET_conf_maps/pet_map_papcnn3.png')
th = 0.7
fused_prop1_th_0_pt_7 = zeros(250,250,3,'uint8')
fused_prop1_th_0_pt_7(:,:,1)  = floor((th .* mri_map_prop1 + (1-th)).* double(fused_prop1(4:253,4:253)));
fused_prop1_th_0_pt_7(:,:,2)  = floor((th .* pet_map_prop1 + (1-th)).* double(fused_prop1(4:253,4:253)));
fused_prop1_th_0_pt_7(:,:,3)  = fused_prop1(4:253,4:253)
imshow(fused_prop1_th_0_pt_7)
imwrite(fused_prop1_th_0_pt_7,'Images/Fusion_Win_7_RG/Fusion_vis_maps/Th_0.7/fused_papcnn3_th_0_pt_7.png')





mri_prop3 = imread('Images/Fusion_Win_3/MRI_Input/3.png');
imshow(mri_prop3)
pet_prop3 = imread('Images/Fusion_Win_3/PET_Input/3.png');
imshow(pet_prop3)
fused_prop3 = imread('Images/Fusion_Win_3/Fused Images/fused_prop3.png');
imshow(fused_prop3)

[mri_map_prop3, pet_map_prop3] = fmi(mri_prop3, pet_prop3, fused_prop3);

th = 0.1
fused_prop3_th_0_pt_7 = zeros(254,254,3,'uint8')
fused_prop3_th_0_pt_7(:,:,1)  = floor((th .* mri_map_prop3 + (1-th)).* double(fused_prop3(2:255,2:255)));
fused_prop3_th_0_pt_7(:,:,3)  = floor((th .* pet_map_prop3 + (1-th)).* double(fused_prop3(2:255,2:255)));
fused_prop3_th_0_pt_7(:,:,2)  = fused_prop3(2:255,2:255)
imshow(fused_prop3_th_0_pt_7)
imwrite(fused_prop3_th_0_pt_7,'Images/Fusion_Win_3/Fusion_vis_maps_RB/Th_0.1/fused_prop3_th_0_pt_7.png')



mri_prop4 = imread('Images/Fusion_Win_3/MRI_Input/4.png');
imshow(mri_prop4)
pet_prop4 = imread('Images/Fusion_Win_3/PET_Input/4.png');
imshow(pet_prop4)
fused_prop4 = imread('Images/Fusion_Win_3/Fused Images/fused_prop4.png');
imshow(fused_prop4)

[mri_map_prop4, pet_map_prop4] = fmi(mri_prop4, pet_prop4, fused_prop4);

th = 0.9
fused_prop4_th_0_pt_7 = zeros(254,254,3,'uint8')
fused_prop4_th_0_pt_7(:,:,1)  = floor((th .* mri_map_prop4 + (1-th)).* double(fused_prop4(2:255,2:255)));
fused_prop4_th_0_pt_7(:,:,3)  = floor((th .* pet_map_prop4 + (1-th)).* double(fused_prop4(2:255,2:255)));
fused_prop4_th_0_pt_7(:,:,2)  = fused_prop4(2:255,2:255)
imshow(fused_prop4_th_0_pt_7)
imwrite(fused_prop4_th_0_pt_7,'Images/Fusion_Win_3/Fusion_vis_maps_RGB/Th_0.9/fused_prop4_th_0_pt_7.png')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Second dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mri_prop3 = imread('Images/Fusion_Win_3_RB/MRI_Input/3.png');
pet_prop3 = imread('Images/Fusion_Win_3_RB/PET_Input/3.png');
fused_prop3 = imread('Images/Fusion_Win_3_RB/Fused Images/fuse_nsct_rpcnn3.png');

%perturbed images
fused_prop3_gaussian = imnoise(fused_prop3,'gaussian')
imshow(fused_prop3_gaussian)
imwrite(fused_prop3_gaussian, 'Images/Fusion_Win_3_RB/Gaussian Noise/fused_rpcnn3_gaussian.png')

fused_prop3_poisson = imnoise(fused_prop3,'poisson')
imshow(fused_prop3_poisson)
imwrite(fused_prop3_poisson, 'Images/Fusion_Win_3_RB/Poisson Noise/fused_rpcnn3_poisson.png')

fused_prop3_salt_pepper = imnoise(fused_prop3,'salt & pepper')
imshow(fused_prop3_salt_pepper)
imwrite(fused_prop3_salt_pepper, 'Images/Fusion_Win_3_RB/Salt and Pepper Noise/fused_rpcnn3_salt_pepper.png')

fused_prop3_speckle = imnoise(fused_prop3,'speckle')
imshow(fused_prop3_speckle)
imwrite(fused_prop3_speckle, 'Images/Fusion_Win_3_RB/Speckle Noise/fused_rpcnn3_speckle.png')

fused_prop3_blur= imgaussfilt(fused_prop3,2);
imshow(fused_prop3_blur)
imwrite(fused_prop3_blur, 'Images/Fusion_Win_3_RB/Blur Noise/fused_rpcnn3_blur.png')


%confidence score calculation
[mri_map_prop3, pet_map_prop3] = fmi(mri_prop3, pet_prop3, fused_prop3,'none',7);
[mri_map_prop3_gaussian, pet_map_prop3_gaussian] = fmi(mri_prop3, pet_prop3, fused_prop3_gaussian,'none',7);
[mri_map_prop3_poisson, pet_map_prop3_poisson] = fmi(mri_prop3, pet_prop3, fused_prop3_poisson,'none',7);
[mri_map_prop3_salt_pepper, pet_map_prop3_salt_pepper] = fmi(mri_prop3, pet_prop3, fused_prop3_salt_pepper,'none',7);
[mri_map_prop3_speckle, pet_map_prop3_speckle] = fmi(mri_prop3, pet_prop3, fused_prop3_speckle,'none',7);
[mri_map_prop3_blur, pet_map_prop3_blur] = fmi(mri_prop3, pet_prop3, fused_prop3_blur,'none',7);

%imwrite(ind2rgb(uint8(255*pet_map_prop3_gaussian), jet(256)), 'Images/Fusion_Win_3_RB/Gaussian Noise/fused_pet_rpcnn3_gaussian.png')

th = 0.7
fused_prop1_th_0_pt_7 = zeros(250,250,3,'uint8')
fused_prop1_th_0_pt_7(:,:,1)  = floor((th .* mri_map_prop3_blur + (1-th)).* double(fused_prop3_blur(4:253,4:253)));
fused_prop1_th_0_pt_7(:,:,2)  = floor((th .* pet_map_prop3_blur + (1-th)).* double(fused_prop3_blur(4:253,4:253)));
fused_prop1_th_0_pt_7(:,:,3)  = fused_prop3_blur(4:253,4:253)
imshow(fused_prop1_th_0_pt_7)
imwrite(fused_prop1_th_0_pt_7,'Images/Fusion_Win_3_RB/fused_vis_blur_rpcnn3.png')


%plot respective heat maps
imshow(mri_map_prop3);
colormap jet;
colorbar;

imshow(mri_map_prop3_gaussian);
colormap jet;
colorbar;

imshow(mri_map_prop3_poisson);
colormap jet;
colorbar;

imshow(mri_map_prop3_salt_pepper);
colormap jet;
colorbar;

imshow(mri_map_prop3_speckle);
colormap jet;
colorbar;

imshow(mri_map_prop3_blur);
colormap jet;
colorbar;


imshow(pet_map_prop3);
colormap jet;
colorbar;


imshow(pet_map_prop3_gaussian);
colormap jet;
colorbar;

imshow(pet_map_prop3_poisson);
colormap jet;
colorbar;

imshow(pet_map_prop3_salt_pepper);
colormap jet;
colorbar;

imshow(pet_map_prop3_speckle);
colormap jet;
colorbar;

imshow(pet_map_prop3_blur);
colormap jet;
colorbar;


%fused image with confidence scores in a RGB image
fused_prop3_rgb = zeros(254,254,3,'uint8')
fused_prop3_rgb(:,:,1)  = floor(( mri_map_prop3 ).* double(fused_prop3(2:255,2:255)));
fused_prop3_rgb(:,:,2)  = floor(( pet_map_prop3) .* double(fused_prop3(2:255,2:255)));
fused_prop3_rgb(:,:,3)  = fused_prop3(2:255,2:255)
imshow(fused_prop3_rgb)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Third dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mri_prop4 = imread('Images/MRI/4.png');
pet_prop4 = imread('Images/PET/4.png');
fused_prop4 = imread('Images/Results/fused_prop4.png');
[mri_map_prop4, pet_map_prop4] = fmi(mri_prop4, pet_prop4, fused_prop4);
imshow(mri_map_prop4);
colormap jet;
colorbar;
imshow(pet_map_prop4);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndex4 = uint8(floor(mri_map_prop4 * 255));
mri_map_prop4_rgb      = ind2rgb(mriGrayIndex4, jet(256));
imshow(mri_map_prop4_rgb)

petGrayIndex4 = uint8(floor(pet_map_prop4 * 255));
pet_map_prop4_rgb      = ind2rgb(petGrayIndex4, jet(256));
imshow(pet_map_prop4_rgb)

fused_prop4_rgb = zeros(254,254,3,'uint8')
fused_prop4_rgb(:,:,1)  = uint8(floor(mri_map_prop4_rgb(:,:,1) * 255));
fused_prop4_rgb(:,:,2)  = uint8(floor(pet_map_prop4_rgb(:,:,2) * 255));
fused_prop4_rgb(:,:,3)  = fused_prop4(2:255,2:255)
imshow(fused_prop4_rgb)
