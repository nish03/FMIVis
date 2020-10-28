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



## Evaluated fusion methods
As mentioned in the paper, we used several existing fusion methods to visualise the FMI heat maps between the input images and the fused images generated from each of them. The code for each of the evaluated fusion methods are publicly available. In case of any questions related to these fusion methods, please contact the corresponding authors.

## How to cite
N. Kumar, N. Hoffmann, M. Kirsch and S. Gumhold, "Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas," 2020 IEEE 17th International Symposium on Biomedical Imaging (ISBI), Iowa City, IA, USA, 2020, pp. 1-5, doi: 10.1109/ISBI45749.2020.9098504.
