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


th = 0.7;

fused_nsct_rpcnn1_rgb = zeros(250,250,3,'uint8');
fused_nsct_rpcnn1_rgb(:,:,1)  =  floor((th .* mri_map_nsct_rpcnn1 + (1-th)).* double(fused_nsct_rpcnn1(6:255,6:255)));
fused_nsct_rpcnn1_rgb(:,:,2)  = floor((th .* pet_map_nsct_rpcnn1 + (1-th)).* double(fused_nsct_rpcnn1(6:255,6:255)));
fused_nsct_rpcnn1_rgb(:,:,3)  = fused_nsct_rpcnn1(6:255,6:255);
imshow(fused_nsct_rpcnn1_rgb);
