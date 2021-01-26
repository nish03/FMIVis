# FMIVis: Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas

This is the open source toolkit for the ISBI 2020 paper titled [Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas](https://ieeexplore.ieee.org/document/9098504) by **N.Kumar et al**. 

**Note**: Please cite the following two papers if you are using this code in your research:
* [A non-reference image fusion metric based on mutual information of image features](http://dx.doi.org/10.1016/j.compeleceng.2011.07.012)
* [Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas](https://ieeexplore.ieee.org/document/9098504)

![GitHub Logo](/docs/FMIVis.png)

The paper performs the following tasks:
* The paper spatially computes feature mutual information (FMI) metric scores between corresponding pixels of two grayscale images. 
* The paper apply the FMI metric to visualise the mutual information between the local features of an image pair obtained using image fusion and image translation algorithms. For image fusion methods, the FMI heat maps are computed between the input image and the fused image. For image translation methods, the FMI heat maps are computed between the input image and the translated image.

## Prerequisites
* MATLAB


## Results
![GitHub Logo](/docs/Results.png)

## Data
The images for evaluating our method were acquired from [Harvard Whole Brain Atlas](http://www.med.harvard.edu/AANLIB/) which is publicly available. Please note our method is adaptable to any kind of grayscale image pair with same dimension.

## Usage
1. For obtaining FMI heat maps in a fusion setup, you should have two equally sized grayscale input images and an output grayscale fused image. 
   -  To compute heat maps for a particular image fusion method, you need to run: ```  [input1_heat, input2_heat] = fmi(input1, input2, fused, feature, window_size) ``` in **evaluate_fusion_rpcnn.m** file where feature define the type of feature extraction
   that needs to be performed on the input image. If no feature extraction is required, then the default is 'none'. window_size is the patch dimension within which
   the mutual information between the input patch and the fused patch needs to be estimated.

   -  You can visualize the RGB image where the FMI heat maps between input images and the fused image is in the first two red and green channels and the fused image itself in the blue channel as shown in the following code snippet:
   
   ```
   rgb_image(:,:,1)  = input1_heat
   rgb_image(:,:,2)  = input2_heat
   rgb_image(:,:,3)  = fused 
   ```

2. For obtaining FMI heat maps in an image translation setup, you should have two equally sized grayscale images with one from input image modality and another from target image modality while the third image should be the predicted target image from one of the image translation methods. 
   -  To compute heat maps for a particular image translation method, you need to run: ``` [input_heat, target_heat] = fmi(input, target, predicted_target,  feature, window_size); ``` in **evaluate_translation_tumor.m** file where 'input' is the input image, 'target' is the groundtruth image for the target and 'predicted_target' is the image obtained from a particular image translation method.

   -  To visualize the RGB image where the FMI heat map between input image and the predicted target image is in the red channel, heat map between groundtruth target image and the predicted target image is in the green channel while the predicted target image is in the blue channel as shown in the following code snippet:

   ```
   rgb_image(:,:,1)  = th.*input_heat + (1-th).* double(predicted_target)
   rgb_image(:,:,2)  = th.*target_heat + (1-th).* double(predicted_target)
   rgb_image(:,:,3)  = predicted_target
   ```

## Evaluated fusion methods
As mentioned in the paper, we used several existing fusion methods to visualise the FMI heat maps between the input images and the fused images generated from each of them. The code for each of the evaluated fusion methods are publicly available. In case of any questions related to these fusion methods, please contact the corresponding authors.

## How to cite
N. Kumar, N. Hoffmann, M. Kirsch and S. Gumhold, "Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas," 2020 IEEE 17th International Symposium on Biomedical Imaging (ISBI), Iowa City, IA, USA, 2020, pp. 1-5, doi: 10.1109/ISBI45749.2020.9098504.
