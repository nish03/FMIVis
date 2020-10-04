%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tumor visualisation maps  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
th = 0.7
source1_im = imread('Images/Translation_Win_7_RG/Non_tumor_source/W_source_1.png');
source1_im = rgb2gray(source1_im)
source2_im = imread('Images/Translation_Win_7_RG/Non_tumor_source/W_source_2.png');
source2_im = rgb2gray(source2_im)
W_target_1_100 = imread('Images/Translation_Win_7_RG/Non_tumor_targets/W_target_1_100.png');
imshow(W_target_1_100)
W_target_1_100 = rgb2gray(W_target_1_100)
[W_target_1_conf1_100, W_target_1_conf2_100] = fmi(source1_im, source2_im, W_target_1_100, 'none', 7);
W_target_1_vis_100  = zeros(250,250,3,'uint8')
W_target_1_vis_100(:,:,1)  = W_target_1_100(4:253,4:253)%floor((th.*W_target_1_conf1_100 + (1-th)).* double(W_target_1_100(4:253,4:253)));
W_target_1_vis_100(:,:,2)  = floor((th.*W_target_1_conf2_100 + (1-th)).* double(W_target_1_100(4:253,4:253)));
W_target_1_vis_100(:,:,3)  = W_target_1_100(4:253,4:253)
imshow(W_target_1_vis_100)
imwrite(W_target_1_vis_100,'Images/W_target_1_vis_100_g.png');
imshow(source2_im)
source2_im_gauss = 0.9*imnoise(source2_im,'gaussian',0 ,0.0001) + 0.1
imshow(source2_im_gauss)
[T_target_1_conf1_100, T_target_1_conf2_100] = fmi(0.9*source2_im + 0.1, source2_im, 0.95*source2_im_gauss + 0.05, 'none', 9);
imshow(T_target_1_conf1_100)
colormap jet
colorbar
T_target_1_vis_100  = zeros(250,250,3,'uint8')
T_target_1_vis_100(:,:,1)  = T_target_1_100(4:253,4:253);
T_target_1_vis_100(:,:,2)  = floor((th.*T_target_1_conf2_100 + (1-th)).* double(T_target_1_100(4:253,4:253)));
T_target_1_vis_100(:,:,3)  = T_target_1_100(4:253,4:253)
imshow(T_target_1_vis_100)
imwrite(T_target_1_vis_100,'Images/T_target_1_vis_100_g_gauss.png');

source2_im_gauss_1 = imnoise(source2_im,'gaussian',1)
imshow(source2_im_gauss)
[T_target_1_conf1_100, T_target_1_conf2_100] = fmi(source1_im, source2_im_gauss_1, T_target_1_100, 'none', 7);
T_target_1_vis_100  = zeros(250,250,3,'uint8')
T_target_1_vis_100(:,:,1)  = T_target_1_100(4:253,4:253);
T_target_1_vis_100(:,:,2)  = floor((th.*T_target_1_conf2_100 + (1-th)).* double(T_target_1_100(4:253,4:253)));
T_target_1_vis_100(:,:,3)  = T_target_1_100(4:253,4:253)
imshow(T_target_1_vis_100)
imwrite(T_target_1_vis_100,'Images/T_target_1_vis_100_g_gauss_1.png');

source2_im_gauss_1 = imnoise(source2_im,'gaussian',2)
imshow(source2_im_gauss)
[T_target_1_conf1_100, T_target_1_conf2_100] = fmi(source1_im, source2_im_gauss_2, T_target_1_100, 'none', 7);
T_target_1_vis_100  = zeros(250,250,3,'uint8')
T_target_1_vis_100(:,:,1)  = T_target_1_100(4:253,4:253);
T_target_1_vis_100(:,:,2)  = floor((th.*T_target_1_conf2_100 + (1-th)).* double(T_target_1_100(4:253,4:253)));
T_target_1_vis_100(:,:,3)  = T_target_1_100(4:253,4:253)
imshow(T_target_1_vis_100)
imwrite(T_target_1_vis_100,'Images/T_target_1_vis_100_g_gauss_2.png');

