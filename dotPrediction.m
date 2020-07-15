function [Id, er, p] = dotPredictionNew(I, o)

%This function evaluates the Dot prediction image 'Id' from the input
%image 'I'. er is the dot prediction error matrix. p is a binary map that
%shows the location of the dot pixels by 1. This will be used in embedding.

[m, n] = size(I);
I1 = padarray(I, [1,1]);
p=zeros(size(I1));
Id = I1;%This is the Cross Predicted Image. 
for ii = 2:m+1
    for jj = 2:n+1
        if mod(ii+jj, 2) ~= 0           
                Id(ii, jj) = floor((I1(ii+1, jj) + I1(ii-1, jj) + I1(ii, jj+1) + I1(ii, jj-1))/4);
                p(ii,jj)=1;           
        end
    end
end
Id = Id(2:end-1, 2:end-1);%Predicted Image
p = p(2:end-1, 2:end-1);%Map of cross pixels
er = I - Id;%Prediction Errors
end