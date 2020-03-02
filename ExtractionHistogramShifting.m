function [Irec, dataRec] = ExtractionHistogramShifting(Isteg, er, T, p)
% "Isteg" is the input stego image. "er" is matrix of prediction errors. T
% is the embedding/extraction threshold and p is a binary predicion map. 
% The map indicates the pixels which have been modified by the prediction.
% This helps in reducing the lines that the function has to go through to
% extract the data. This also helps make the function more flexible as in
% it will apply the extraction process to all the bits which have p = 1.

[m, n] = size(Isteg);
temp = 0;
dataRec = [];
e = zeros(m, n);
for ii = 1:m
    for jj = 1:n
        if p(ii, jj) == 1
            if er(ii, jj) >= -2*T && er(ii, jj) < 2*T
                temp = temp + 1;
                dataRec(temp) = mod(er(ii, jj), 2);
                e(ii, jj) = floor(er(ii, jj)/2);                
            elseif er(ii, jj) < -2*T 
                e(ii, jj) = er(ii, jj) + T;
            elseif er(ii, jj) >= 2*T
                e(ii, jj) = er(ii, jj) - T;
            end
        end
    end
end
Irec = Isteg + e;
end