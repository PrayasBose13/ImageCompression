# ImageCompression
#FInd a possible way to store the image data ,i.e, the vector representation of the image in such a way that the storage size is minimum and the data is easier to work with , we do not lose any important characteristics.
#The above task could be achieved from the very idea of that the pixels in very close vicinity/uniform area of the image would have similar colour information. For example in a picture containing a face the pixels with close vicinity to the few hairs will also be hair.
#This logically can be done, as we can say that pixels in the close vicinity or on an uniform area of the image should form different cluster, in other words the pixels determining the hair and those determining the eyes will have dissimilar values while two adjacents pixels defining hair will have values that is quite related and thus we can see a form of clustering .This can be done by clustering and using the kmeans algorithm(Lloyd's Algorithm).

#3 Steps to image quantization:

#(Prototype vectors) Generally an image of mn pixels is represented in m rows and n columns. But here first we create arrays by grouping together q local pixels by row (that is q adjacent pixels row-wise). Then we have a collection of vectors V = {Vi; i = 1; 2; 3; ::::; mn/q}; where each .Vi is a q dimensional vector. This V is called index and the elements
Vi are called index entry. Some of these vectors,Vi 2 V , will be similar in some respects. For example, many vectors may be extracted from a uniform area of an image. This leads to the following idea.
– Cluster vectors in V into r groups where(r << mn/q ): The smaller the choice of r, the greater is the compression.
– In other words, the set of vectors, V; is partitioned into r distinct sets, S1; S2; :::Sr corresponding to each cluster.
– Each subset Si is then been represented by a suitable representative/prototype vector (may be the cluster mean/mediod). The
set of prototype vectors constitutes the codebook. Each of the member in the codebook is called codeword .
– Thus codebook contains r vectors, each of which has an address,(1; 2; :::; r).Because the number of selected elements is much smaller than the
number of vectors in the image, the number of bits required to represent the address of a prototype vector is much smaller than the number of bits required to represent an image vector.

#(image compression) Now that the prototype vectors have been determined,the next step of VQ consists of image compression and transmission.Each vector in the original image is compared one-at-a-time to each of the prototype vectors in the codebook. The prototype that most closely resembles the input vector is selected, and its address is transmitted/represented. That is the compressed version of the image is only the codebook consisting of r vectors (instead of mn/q vectors) each of which is q dimensional.

#(image decompression) The final step of VQ consists of getting back the image, which will be obviously an approximation to the original
one. i.e., a sequence of mn/q addresses, and decompressing it. Each of the mn/q vectors will be approximated by the corresponding prototype vector in the codebook (that is the cluster center which it belongs to).
Here we will work with a grayscale picture of P.C.Mahalonobis
