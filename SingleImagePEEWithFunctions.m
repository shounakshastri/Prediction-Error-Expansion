clc;
clear all;
close all;

I = double(imread('lena2.tif'));
data = randi([0 1], 1, length(I(:)));
T = 2;
% I = I(:);

%%%%%-----Embedding Process-----%%%%%
%-----Embed in Cross Pixels-----%
[ICrossPred, ec, pc] = crossPrediction(I);
[Ic, crossEC] = EmbeddingHistogramShifting(ICrossPred, data, T, ec, pc);
dataEmbeddedCross = data(1:crossEC);

%-----Embed in Dot Pixels-----%
[IDotPred, ed, pd] = dotPrediction(Ic);
[Istego, dotEC] = EmbeddingHistogramShifting(IDotPred, data(crossEC+1:end), T, ed, pd);
dataEmbeddedDot = data(crossEC+1:crossEC+dotEC);

%%%%%-----Data Extraction and Cover Image Recovery-----%%%%%
%-----Extraction & Recovery: Dot Pixels-----%
[IDotPredExtract, edExtract, pd] = dotPrediction(Istego);
[IDotRec, dataDotRec] = ExtractionHistogramShifting(IDotPredExtract, edExtract, T, pd);

%-----Extraction & Recovery: Cross Pixels-----%
[ICrossPredExtract, ecExtract, pc] = crossPrediction(IDotRec);
[Irec, dataCrossRec] = ExtractionHistogramShifting(ICrossPredExtract, ecExtract, T, pc);

totalEmbeddedData = crossEC + dotEC
embeddingRate = totalEmbeddedData/length(I(:))
embeddedData = data(1:totalEmbeddedData);
recoveredData = [dataCrossRec dataDotRec];

[isequal(embeddedData, recoveredData) isequal(I,Irec)]
psnr(I, Istego);
