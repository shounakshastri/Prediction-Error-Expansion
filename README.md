This repo contains MATLAB implementation of the basic Prediction Error Expansion RDH technique.

If you are using these files, please cite the original authors in your document using the accompanying bibtex file.

## Prediction-Error-Expansion (PEE)

Prediction Error Expansion (PEE) hides the secret data by shifting the histogram of errors between the cover and the predicted image. 

This perticular algorithm is one of the first to use this technique and forms the base of most of the modern steganography schemes.

## Description of the files in this repo
This repo contains 6 files.
  1. crossPrediction.m - Generates the cross prediction image and the binary location map
  2. dotPrediction.m - Generates the dot prediction image and the binary location map
  3. EmbeddingHistogramShifting.m - Function to embed the secret data
  4. ExtractionHistogramShifting.m - Function to extract the secret data
  5. SingleImagePEEWithFunctions.m - The main file
  6. Citation.bib - Citation Details
  
The functions have directions for use in the files. 


The main file takes the cover image as the input and gives the Number_of_Bits_Embedded, the Embedding Capacity (EC) and the PSNR as outputs. 
