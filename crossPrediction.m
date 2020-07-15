function [Ic, er, p] = crossPrediction(I)

%This function evaluates the Cross prediction image 'Ic' from the input
%image 'I'. er is the cross prediction errors and p is the map indicating
%the location of the cross pixels by displaying a 1. This map should be
%used in the embedding.

[m, n] = size(I);
I1 = padarray(I, [1,1]);%This is a padded image. No operations
                                     %are done on this image. DO NOT USE
                                     %THE 'REPLICATE' OPTION HERE !!!
p=zeros(size(I1));%This is the map which indicates the cross pixels by 1.
Ic = I1;%This is the Cross Predicted Image. 
for ii = 2:m+1
    for jj = 2:n+1
        if mod(ii+jj, 2) == 0
            Ic(ii, jj) = floor((I1(ii+1, jj) + I1(ii-1, jj) + I1(ii, jj+1) + I1(ii, jj-1))/4);
            p(ii,jj)=1;
        end
    end
end
Ic = Ic(2:end-1, 2:end-1);%Predicted Image
p = p(2:end-1, 2:end-1);%Map of cross pixels
er = I - Ic;%Prediction Errors
end