%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%First dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mri_lpsr1 = imread('Images/MRI/1.png');
pet_lpsr1 = imread('Images/PET/1.png');
fused_lpsr1 = imread('Images/Results/fused_lp_sr1.png');
[mri_map_lpsr1, pet_map_lpsr1] = fmi(mri_lpsr1, pet_lpsr1, fused_lpsr1);
imshow(mri_map_lpsr1);
colormap jet;
colorbar;
imshow(pet_map_lpsr1);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexlpsr1 = uint8(floor(mri_map_lpsr1 * 255));
mri_map_lpsr1_rgb      = ind2rgb(mriGrayIndexlpsr1, jet(256));
imshow(mri_map_lpsr1_rgb)

petGrayIndexlpsr1 = uint8(floor(pet_map_lpsr1 * 255));
pet_map_lpsr1_rgb      = ind2rgb(petGrayIndexlpsr1, jet(256));
imshow(pet_map_lpsr1_rgb)

fused_lpsr1_rgb = zeros(254,254,3,'uint8')
fused_lpsr1_rgb(:,:,1)  = uint8(floor(mri_map_lpsr1_rgb(:,:,1) * 255));
fused_lpsr1_rgb(:,:,2)  = uint8(floor(pet_map_lpsr1_rgb(:,:,2) * 255));
fused_lpsr1_rgb(:,:,3)  = fused_lpsr1(2:255,2:255)
imshow(fused_lpsr1_rgb)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Second dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mri_lpsr3 = imread('Images/MRI/3.png');
pet_lpsr3 = imread('Images/PET/3.png');
fused_lpsr3 = imread('Images/Results/fused_lp_sr3.png');
%perturbed images
fused_lpsr3_gaussian = imnoise(fused_lpsr3,'gaussian')
imshow(fused_lpsr3_gaussian)
imwrite(fused_lpsr3_gaussian, 'Images/Results/fused_lpsr3_gaussian.png')

fused_lpsr3_poisson = imnoise(fused_lpsr3,'poisson')
imshow(fused_lpsr3_poisson)
imwrite(fused_lpsr3_poisson, 'Images/Results/fused_lpsr3_poisson.png')

fused_lpsr3_salt_pepper = imnoise(fused_lpsr3,'salt & pepper')
imshow(fused_lpsr3_salt_pepper)
imwrite(fused_lpsr3_salt_pepper, 'Images/Results/fused_lpsr3_salt_pepper.png')

fused_lpsr3_speckle = imnoise(fused_lpsr3,'speckle')
imshow(fused_lpsr3_speckle)
imwrite(fused_lpsr3_speckle, 'Images/Results/fused_lpsr3_speckle.png')

fused_lpsr3_blur= imgaussfilt(fused_lpsr3,2);
imshow(fused_lpsr3_blur)
imwrite(fused_lpsr3_blur, 'Images/Results/fused_lpsr3_blur.png')


%confidence score calculation
[mri_map_lpsr3, pet_map_lpsr3] = fmi(mri_lpsr3, pet_lpsr3, fused_lpsr3);
[mri_map_lpsr3_gaussian, pet_map_lpsr3_gaussian] = fmi(mri_lpsr3, pet_lpsr3, fused_lpsr3_gaussian);
[mri_map_lpsr3_poisson, pet_map_lpsr3_poisson] = fmi(mri_lpsr3, pet_lpsr3, fused_lpsr3_poisson);
[mri_map_lpsr3_salt_pepper, pet_map_lpsr3_salt_pepper] = fmi(mri_lpsr3, pet_prop3, fused_lpsr3_salt_pepper);
[mri_map_lpsr3_speckle, pet_map_lpsr3_speckle] = fmi(mri_lpsr3, pet_lpsr3, fused_lpsr3_speckle);
[mri_map_lpsr3_blur, pet_map_lpsr3_blur] = fmi(mri_lpsr3, pet_lpsr3, fused_lpsr3_blur);

%plot respective heat maps
imshow(mri_map_lpsr3);
colormap jet;
colorbar;

imshow(mri_map_lpsr3_gaussian);
colormap jet;
colorbar;

imshow(mri_map_lpsr3_poisson);
colormap jet;
colorbar;

imshow(mri_map_lpsr3_salt_pepper);
colormap jet;
colorbar;

imshow(mri_map_lpsr3_speckle);
colormap jet;
colorbar;

imshow(mri_map_lpsr3_blur);
colormap jet;
colorbar;


imshow(pet_map_lpsr3);
colormap jet;
colorbar;


imshow(pet_map_lpsr3_gaussian);
colormap jet;
colorbar;

imshow(pet_map_lpsr3_poisson);
colormap jet;
colorbar;

imshow(pet_map_lpsr3_salt_pepper);
colormap jet;
colorbar;

imshow(pet_map_lpsr3_speckle);
colormap jet;
colorbar;

imshow(pet_map_lpsr3_blur);
colormap jet;
colorbar;


%fused image with confidence scores in a RGB image
mriGrayIndexlpsr3 = uint8(floor(mri_map_lpsr3 * 255));
mri_map_lpsr3_rgb      = ind2rgb(mriGrayIndexlpsr3, jet(256));
imshow(mri_map_lpsr3_rgb)

petGrayIndexlpsr3 = uint8(floor(pet_map_lpsr3 * 255));
pet_map_lpsr3_rgb      = ind2rgb(petGrayIndexlpsr3, jet(256));
imshow(pet_map_lpsr3_rgb)

fused_lpsr3_rgb = zeros(254,254,3,'uint8')
fused_lpsr3_rgb(:,:,1)  = uint8(floor(mri_map_lpsr3_rgb(:,:,1) * 255));
fused_lpsr3_rgb(:,:,2)  = uint8(floor(pet_map_lpsr3_rgb(:,:,2) * 255));
fused_lpsr3_rgb(:,:,3)  = fused_lpsr3(2:255,2:255)
imshow(fused_lpsr3_rgb)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Third dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mri_lpsr4 = imread('Images/MRI/4.png');
pet_lpsr4 = imread('Images/PET/4.png');
fused_lpsr4 = imread('Images/Results/fused_lp_sr4.png');
[mri_map_lpsr4, pet_map_lpsr4] = fmi(mri_lpsr4, pet_lpsr4, fused_lpsr4);
imshow(mri_map_lpsr4);
colormap jet;
colorbar;
imshow(pet_map_lpsr4);
colormap jet;
colorbar;

%fused image with confidence scores in a RGB image
mriGrayIndexlpsr4 = uint8(floor(mri_map_lpsr4 * 255));
mri_map_lpsr4_rgb      = ind2rgb(mriGrayIndexlpsr4, jet(256));
imshow(mri_map_lpsr4_rgb)

petGrayIndexlpsr4 = uint8(floor(pet_map_lpsr4 * 255));
pet_map_lpsr4_rgb      = ind2rgb(petGrayIndexlpsr4, jet(256));
imshow(pet_map_lpsr4_rgb)

fused_lpsr4_rgb = zeros(254,254,3,'uint8')
fused_lpsr4_rgb(:,:,1)  = uint8(floor(mri_map_lpsr4_rgb(:,:,1) * 255));
fused_lpsr4_rgb(:,:,2)  = uint8(floor(pet_map_lpsr4_rgb(:,:,2) * 255));
fused_lpsr4_rgb(:,:,3)  = fused_lpsr4(2:255,2:255)
imshow(fused_lpsr4_rgb)