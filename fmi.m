function [mri_map, pet_map] = fmi(ima, imb, imf, feature, w)

if nargin < 3               % Check correct number of arguments
    error('There should be three input images (2 source images and 1 fused image)!');
end

if size(ima) ~= size(imb)	% Check if the source images are of the same size
    error('Size of the source images must be the same!');
end

if size(ima) ~= size(imf)	% Check if the source images are of the same size
    error('Size of the source and fused images must be the same!');
end

if ~exist('feature', 'var')
    feature = 'edge';       % Default feature extraction
end

if ~exist('w', 'var')
    w = 3;                  % Default window size
end

ima = double(ima);
imb = double(imb);
imf = double(imf);


% Feature Extraction

switch feature
    
    case 'none'         % Raw pixels (no feature extraction)              
        aFeature = ima;
        bFeature = imb;
        fFeature = imf;
        
    case 'gradient'     % Gradient
        aFeature = gradient(ima);
        bFeature = gradient(imb);
        fFeature = gradient(imf);
        
    case 'edge'         % Edge
        aFeature = edge(ima);
        bFeature = edge(imb);
        fFeature = edge(imf);
        
    case 'dct'          % DCT
        aFeature = dct2(ima);
        bFeature = dct2(imb);
        fFeature = dct2(imf);
        
    case 'wavelet'      % Discrete Meyer wavelet
        [cA,cH,cV,cD] = dwt2(ima,'dmey');
        aFeature = rerange([cA,cH;cV,cD]);
        [cA,cH,cV,cD] = dwt2(imb,'dmey');
        bFeature = rerange([cA,cH;cV,cD]);
        [cA,cH,cV,cD] = dwt2(imf,'dmey');
        fFeature = rerange([cA,cH;cV,cD]);
       
    otherwise
        error('Please specify a feature extraction method among ''gradient'', ''edge'', ''dct'', ''wavelet'', or ''none'' (raw pixels)!');
        
end


% Sliding window

[m,n] = size(aFeature);
w = floor(w/2);
mri_map = ones(m-2*w, n-2*w);
pet_map = ones(m-2*w, n-2*w);

for p = w+1:m-w
    for q = w+1:n-w
        
        aSub = aFeature(p-w:p+w, q-w:q+w);
        bSub = bFeature(p-w:p+w, q-w:q+w);
        fSub = fFeature(p-w:p+w, q-w:q+w);
        
        l = round((2*w+1).^2);
        
        if aSub == fSub
            fmi_af = 1;
        else
            aMax = max(aSub(:));
            aMin = min(aSub(:));
            if aMax == aMin
                aSub = ones(2*w+1);
            else
                aSub = (aSub - aMin)/(aMax - aMin);
            end
            
            fMax = max(fSub(:));
            fMin = min(fSub(:));
            if fMax == fMin
                fSub = ones(2*w+1);
            else
                fSub = (fSub - fMin)/(fMax - fMin);
            end
            
            % Normalize the feature images to get the marginal PDFs
            aPdf = aSub(:)./(sum(sum(aSub)));
            fPdf = fSub(:)./(sum(sum(fSub)));
            
            % PDF to CDF tranformation
            aCdf = zeros(size(aPdf));
            imshow(aCdf);
            fCdf = zeros(size(fPdf));
            aCdf(1) = aPdf(1);
            fCdf(1) = fPdf(1);
            for i = 2:l
                aCdf(i) = aPdf(i)+aCdf(i-1);
                fCdf(i) = fPdf(i)+fCdf(i-1);
            end
            
            % Pearson correlation between marginal PDFs
            aTemp = aPdf - mean(aPdf);
            fTemp = fPdf - mean(fPdf);
            if sum(aTemp.*fTemp) == 0
                c = 0;
            else
                c = sum(aTemp.*fTemp)/sqrt(sum(aTemp.*aTemp)*sum(fTemp.*fTemp));
            end
            
            % Population standard deviations
            e_aPdf = 0; e2_aPdf = 0; e_fPdf = 0; e2_fPdf = 0; 
            for i = 1:l
                e_aPdf  = e_aPdf  + i.*aPdf(i);         % Expected value of aPdf
                e2_aPdf = e2_aPdf + (i.^2).*aPdf(i);    % 2nd-order moment of aPdf
                e_fPdf  = e_fPdf  + i.*fPdf(i);         % Expected value of fPdf
                e2_fPdf = e2_fPdf + (i.^2).*fPdf(i);	% 2nd-order moment of fPdf
            end
            aSd = sqrt(e2_aPdf - e_aPdf.^2);	% Population standard deviation of aPdf
            fSd = sqrt(e2_fPdf - e_fPdf.^2);	% Population standard deviation of fPdf
            
            
            jointEntropy = 0;
            % Joint PDF calculation using simplified Nelsen method with joint entropy calculation
            if c >= 0
                
                if c == 0 || aSd == 0 || fSd == 0
                    phi = 0;   
                else        
                    covUp = 0;
                    for i = 1:l
                        for j = 1:l
                            % Frechet's upper bound bivariate distributions between f & a
                            covUp = covUp + 0.5*(fCdf(i)+aCdf(j)-abs(fCdf(i)-aCdf(j))) - fCdf(i).*aCdf(j);
                        end
                    end
                    corrUp = covUp/(fSd*aSd); % Upper correlation between f & a
                    phi = c/corrUp;
                end
                
                jpdfUp = 0.5*(fCdf(1)+aCdf(1)-abs(fCdf(1)-aCdf(1)));
                jpdf = phi.*jpdfUp + (1-phi).*fPdf(1).*aPdf(1);
                if jpdf~=0
                    jointEntropy = real(-jpdf.*log2(jpdf)); % Joint entropy
                end
                
                % 1-D boundaries
                for i=2:l
                    jpdfUp = 0.5*(fCdf(i)+aCdf(1)-abs(fCdf(i)-aCdf(1))) - ...
                        0.5*(fCdf(i-1)+aCdf(1)-abs(fCdf(i-1)-aCdf(1)));
                    jpdf = phi.*jpdfUp + (1-phi).*fPdf(i).*aPdf(1);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                for j=2:l
                    jpdfUp = 0.5*(fCdf(1)+aCdf(j)-abs(fCdf(1)-aCdf(j))) - ...
                        0.5*(fCdf(1)+aCdf(j-1)-abs(fCdf(1)-aCdf(j-1)));
                    jpdf = phi.*jpdfUp + (1-phi).*fPdf(1).*aPdf(j);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                % 2-D walls
                for i=2:l
                    for j=2:l
                        jpdfUp = 0.5*(fCdf(i)+aCdf(j)-abs(fCdf(i)-aCdf(j))) - ...
                            0.5*(fCdf(i-1)+aCdf(j)-abs(fCdf(i-1)-aCdf(j))) - ...
                            0.5*(fCdf(i)+aCdf(j-1)-abs(fCdf(i)-aCdf(j-1))) + ...
                            0.5*(fCdf(i-1)+aCdf(j-1)-abs(fCdf(i-1)-aCdf(j-1)));
                        jpdf = phi.*jpdfUp + (1-phi).*fPdf(i).*aPdf(j);
                        if jpdf~=0
                            jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                        end
                    end
                end
                
            end

            if c < 0
                
                if aSd == 0 || fSd == 0
                    theta = 0;
                else
                    covLo = 0;
                    for i = 1:l
                        for j = 1:l
                            % Frechet's lower bound bivariate distributions between f & a
                            covLo = covLo + 0.5*(fCdf(i)+aCdf(j)-1+abs(fCdf(i)+aCdf(j)-1)) - fCdf(i).*aCdf(j);
                        end
                    end
                    corrLo = covLo/(fSd*aSd); % Lower correlation between f & a
                    theta = c/corrLo;
                end
                
                jpdfLo = 0.5*(fCdf(1)+aCdf(1)-1+abs(fCdf(1)+aCdf(1)-1));
                jpdf = theta.*jpdfLo + (1-theta).*fPdf(1).*aPdf(1);
                if jpdf~=0
                    jointEntropy = real(-jpdf.*log2(jpdf)); % Joint entropy
                end
                
                % 1-D boundaries
                for i=2:l
                    jpdfLo = 0.5*(fCdf(i)+aCdf(1)-1+abs(fCdf(i)+aCdf(1)-1)) - ...
                        0.5*(fCdf(i-1)+aCdf(1)-1+abs(fCdf(i-1)+aCdf(1)-1));
                    jpdf = theta.*jpdfLo + (1-theta).*fPdf(i).*aPdf(1);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                for j=2:l
                    jpdfLo = 0.5*(fCdf(1)+aCdf(j)-1+abs(fCdf(1)+aCdf(j)-1)) - ...
                        0.5*(fCdf(1)+aCdf(j-1)-1+abs(fCdf(1)+aCdf(j-1)-1));
                    jpdf = theta.*jpdfLo + (1-theta).*fPdf(1).*aPdf(j);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                % 2-D walls
                for i=2:l
                    for j=2:l
                        jpdfLo = 0.5*(fCdf(i)+aCdf(j)-1+abs(fCdf(i)+aCdf(j)-1)) - ...
                            0.5*(fCdf(i-1)+aCdf(j)-1+abs(fCdf(i-1)+aCdf(j)-1)) - ...
                            0.5*(fCdf(i)+aCdf(j-1)-1+abs(fCdf(i)+aCdf(j-1)-1)) + ...
                            0.5*(fCdf(i-1)+aCdf(j-1)-1+abs(fCdf(i-1)+aCdf(j-1)-1));
                        jpdf = theta.*jpdfLo + (1-theta).*fPdf(i).*aPdf(j);
                        if jpdf~=0
                            jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                        end
                    end
                end
                
            end
            
            % Marginal entropies
            index = find(aPdf~=0);
            aEntropy = sum(-aPdf(index).*log2(aPdf(index)));
            index = find(fPdf~=0);
            fEntropy = sum(-fPdf(index).*log2(fPdf(index)));
            
            % Mutual information between a & f
            mi = aEntropy + fEntropy - jointEntropy;  
            
            % Overall normalized mutual information
            if mi == 0
                fmi_af = 0;
            else
                fmi_af = 2.*mi./(aEntropy+fEntropy);
            end
            
        end
        
        if bSub == fSub
            fmi_bf = 1;
        else
            bMax = max(bSub(:));
            bMin = min(bSub(:));
            if bMax == bMin
                bSub = ones(2*w+1);
            else
                bSub = (bSub - bMin)/(bMax - bMin);
            end

            fMax = max(fSub(:));
            fMin = min(fSub(:));
            if fMax == fMin
                fSub = ones(2*w+1);
            else
                fSub = (fSub - fMin)/(fMax - fMin);
            end

            % PDF of the gradients of the images
            bPdf = bSub(:)./(sum(sum(bSub)));
            fPdf = fSub(:)./(sum(sum(fSub)));

            l = length(bPdf);

            % PDF to CDF tranformation
            bCdf = zeros(size(bPdf));
            fCdf = zeros(size(fPdf));
            bCdf(1) = bPdf(1);
            fCdf(1) = fPdf(1);
            for i=2:l
                bCdf(i) = bPdf(i)+bCdf(i-1);
                fCdf(i) = fPdf(i)+fCdf(i-1);
            end

            % Pearson correlation between marginal PDFs
            bTemp = bPdf - mean(bPdf);
            fTemp = fPdf - mean(fPdf);
            if sum(bTemp.*fTemp) == 0
                c = 0;
            else
                c = sum(bTemp.*fTemp)/sqrt(sum(bTemp.*bTemp)*sum(fTemp.*fTemp));
            end

            % Population standard deviations
            e_bPdf = 0; e2_bPdf = 0; e_fPdf = 0; e2_fPdf = 0; 
            for i = 1:l
                e_bPdf  = e_bPdf  + i.*bPdf(i);         % Expected value of the aPdf
                e2_bPdf = e2_bPdf + (i.^2).*bPdf(i);	% 2nd-order moment of the aPdf
                e_fPdf  = e_fPdf  + i.*fPdf(i);         % Expected value of the bPdf
                e2_fPdf = e2_fPdf + (i.^2).*fPdf(i);	% 2nd-order moment of the bPdf
            end
            bSd = sqrt(e2_bPdf - e_bPdf.^2);	% Population standard deviation of the intensity
            fSd = sqrt(e2_fPdf - e_fPdf.^2);	% Population standard deviation of the intensity


            jointEntropy = 0;
            % JPDF calculation using simplified Nelsen method with joint entropy calculation
            if c >= 0

                if c == 0 || bSd == 0 || fSd == 0
                    phi = 0;   
                else        
                    covUp = 0;
                    for i = 1:l
                        for j = 1:l
                            % Frechet's upper bound bivariate distributions between f & b
                            covUp = covUp + 0.5*(fCdf(i)+bCdf(j)-abs(fCdf(i)-bCdf(j))) - fCdf(i).*bCdf(j);
                        end
                    end
                    corrUp = covUp/(fSd*bSd); % Upper correlation between f & b
                    phi = c/corrUp;
                end

                jpdfUp = 0.5*(fCdf(1)+bCdf(1)-abs(fCdf(1)-bCdf(1)));
                jpdf = phi.*jpdfUp + (1-phi).*fPdf(1).*bPdf(1);
                if jpdf~=0
                    jointEntropy = real(-jpdf.*log2(jpdf)); % Joint entropy
                end

                % 1-D boundaries
                for i=2:l
                    jpdfUp = 0.5*(fCdf(i)+bCdf(1)-abs(fCdf(i)-bCdf(1))) - ...
                        0.5*(fCdf(i-1)+bCdf(1)-abs(fCdf(i-1)-bCdf(1)));
                    jpdf = phi.*jpdfUp + (1-phi).*fPdf(i).*bPdf(1);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                for j=2:l
                    jpdfUp = 0.5*(fCdf(1)+bCdf(j)-abs(fCdf(1)-bCdf(j))) - ...
                        0.5*(fCdf(1)+bCdf(j-1)-abs(fCdf(1)-bCdf(j-1)));
                    jpdf = phi.*jpdfUp + (1-phi).*fPdf(1).*bPdf(j);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                % 2-D walls
                for i=2:l
                    for j=2:l
                        jpdfUp = 0.5*(fCdf(i)+bCdf(j)-abs(fCdf(i)-bCdf(j))) - ...
                            0.5*(fCdf(i-1)+bCdf(j)-abs(fCdf(i-1)-bCdf(j))) - ...
                            0.5*(fCdf(i)+bCdf(j-1)-abs(fCdf(i)-bCdf(j-1))) + ...
                            0.5*(fCdf(i-1)+bCdf(j-1)-abs(fCdf(i-1)-bCdf(j-1)));
                        jpdf = phi.*jpdfUp + (1-phi).*fPdf(i).*bPdf(j);
                        if jpdf~=0
                            jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                        end
                    end
                end

            end

            if c < 0

                if bSd == 0 || fSd == 0
                    theta = 0;
                else
                    covLo = 0;
                    for i = 1:l
                        for j = 1:l
                            % Frechet's lower bound bivariate distributions between f & b
                            covLo = covLo + 0.5*(fCdf(i)+bCdf(j)-1+abs(fCdf(i)+bCdf(j)-1)) - fCdf(i).*bCdf(j);
                        end
                    end
                    corrLo = covLo/(fSd*bSd); % Lower correlation between f & b
                    theta = c/corrLo;
                end

                jpdfLo = 0.5*(fCdf(1)+bCdf(1)-1+abs(fCdf(1)+bCdf(1)-1));
                jpdf = theta.*jpdfLo + (1-theta).*fPdf(1).*bPdf(1);
                if jpdf~=0
                    jointEntropy = real(-jpdf.*log2(jpdf)); % Joint entropy
                end

                % 1-D boundaries
                for i=2:l
                    jpdfLo = 0.5*(fCdf(i)+bCdf(1)-1+abs(fCdf(i)+bCdf(1)-1)) - ...
                        0.5*(fCdf(i-1)+bCdf(1)-1+abs(fCdf(i-1)+bCdf(1)-1));
                    jpdf = theta.*jpdfLo + (1-theta).*fPdf(i).*bPdf(1);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                for j=2:l
                    jpdfLo = 0.5*(fCdf(1)+bCdf(j)-1+abs(fCdf(1)+bCdf(j)-1)) - ...
                        0.5*(fCdf(1)+bCdf(j-1)-1+abs(fCdf(1)+bCdf(j-1)-1));
                    jpdf = theta.*jpdfLo + (1-theta).*fPdf(1).*bPdf(j);
                    if jpdf~=0
                        jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                    end
                end
                % 2-D walls
                for i=2:l
                    for j=2:l
                        jpdfLo = 0.5*(fCdf(i)+bCdf(j)-1+abs(fCdf(i)+bCdf(j)-1)) - ...
                            0.5*(fCdf(i-1)+bCdf(j)-1+abs(fCdf(i-1)+bCdf(j)-1)) - ...
                            0.5*(fCdf(i)+bCdf(j-1)-1+abs(fCdf(i)+bCdf(j-1)-1)) + ...
                            0.5*(fCdf(i-1)+bCdf(j-1)-1+abs(fCdf(i-1)+bCdf(j-1)-1));
                        jpdf = theta.*jpdfLo + (1-theta).*fPdf(i).*bPdf(j);
                        if jpdf~=0
                            jointEntropy = jointEntropy + real(-jpdf.*log2(jpdf)); % Joint entropy
                        end
                    end
                end

            end


            % Marginal entropies
            index = find(bPdf~=0);
            bEntropy = sum(-bPdf(index).*log2(bPdf(index)));
            index = find(fPdf~=0);
            fEntropy = sum(-fPdf(index).*log2(fPdf(index)));

            % Mutual information between b & f
            mi = bEntropy + fEntropy - jointEntropy;  

            % Overall normalized mutual information
            if mi == 0
                fmi_bf = 0;
            else
                fmi_bf = 2.*mi./(bEntropy+fEntropy);
            end

        end
        
        mri_map(p-w,q-w) = fmi_af;
        pet_map(p-w,q-w) = fmi_bf;
        
        
    end
end