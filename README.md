# FMIVis: Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas

This is the open source toolkit for the ISBI 2020 paper titled [Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas](https://ieeexplore.ieee.org/document/9098504) by **N.Kumar et al**. 

**Note**: Please cite the following two papers if you are using this code in your research:
* [A non-reference image fusion metric based on mutual information of image features](http://dx.doi.org/10.1016/j.compeleceng.2011.07.012)
* [Visualisation of Medical Image Fusion and Translation for Accurate Diagnosis of High Grade Gliomas](https://ieeexplore.ieee.org/document/9098504)


The paper performs the following tasks:


## Prerequisites
* MATLAB

## Results

## Data


## Usage


## Evaluation metrics
As mentioned in the paper, we quantitatively evaluated the quality of our end-to-end unsupervised learning based medical image fusion method with some popular fusion metrics using MATLAB. The code of the fusion metrics used has been provided in the folder 'Fusion metrics' in this repository. The author and citation details of each of these metrics are given in the comment section of the code. If you use these fusion metrics for evaluation of your own fusion method, we recommend you to properly cite the original contribution. For running these metrics, you need two grayscale input images and a grayscale fused image. For getting the metric scores all at once, you need to run fusionAssess.m file.

## Evaluated fusion methods
As mentioned in the paper, we used several existing fusion methods and compared their metric scores with those obtained from FunFuseAn. The code for the evaluated fusion methods are publicly available. In case of any questions related to these fusion methods, please contact the corresponding authors.   
