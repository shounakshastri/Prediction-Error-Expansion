function [I_stego, noBitsEmbedded] = EmbeddingHistogramShifting(I_pred, data, T, er, p)
% "I_pred" is the input predicted image. "er" is matrix of prediction
% errors. T is the embedding/extraction threshold and p is a binary predicion map. 
% The map indicates the pixels which have been modified by the prediction.
% This helps in reducing the lines that the function has to go through to
% extract the data. This also helps make the function more flexible as in
% it will apply the embedding process to all the bits which have p = 1.

[m, n] = size(I_pred);
ed = zeros(m, n);%Shifted Prediction Errors
temp = 0;
for ii = 1:m
    for jj = 1:n
        if p(ii, jj) == 1
            if er(ii, jj) >= -T && er(ii, jj) < T
                temp = temp + 1;
%                 data(temp) = randi([0, 1], 1);
                ed(ii, jj) = 2*er(ii, jj) + data(temp);                
            elseif er(ii, jj) >= T
                ed(ii, jj) = er(ii, jj) + T;
            elseif er(ii, jj) < -T
                ed(ii, jj) = er(ii, jj) - T;
            end
        end
    end
end
I_stego = I_pred + ed;
noBitsEmbedded = temp;
end