+++
title = "Computer Vision - Edges"
date = 2021-05-01
+++

# Edges are not lines!

## Background

- **Blurring**
- **Edge Detection**
- **Canny**

NOTE: I will sometimes say kernel or filter but just know that they are the same thing.

Previously, I referenced how color is not that important for the human eye, or edge detection. Well, we don't even need the image to be filled in to understand what it is. We can perceive an image if it is only made up of edges (called an edge map).

But why is this important for computer vision? We can extract information, recognize objects and recover geometry/viewpoint (more on this in Structure From Motion). In short, **we want to get semantic meaning (including shapes) from edges.**

## Blurring

Images come with noise and, in order to extract pure edges, we must blur the image. We can accomplish this by running a filter over the image which chages the pixel values, a process known as "kernel convolution".

Kernel convolution can be used for numerous reasons but the most popular are blurring and finding edges. The most basic blur is called the 'box filter' and just averages its neighbors.

The most common blurring filter is the Gaussian Blur. The gaussian is a normal distribution function but, for images, we use it as a blur. We make a kernel and weight its values heavier in the middle (based off the standard deviation).

An example would be a 3x3 filter with [[, 2, 1], [2, 4, 2], [1, 2, 1]]

This preserves edges and important features very nicely. But, we have to increase the size of our kernel as the standard deviation increases.

## Edge Detection

If you didn't see the title, **edges are not lines**. They may look like lines, but they won't be straight; they can even be curved. Edges are significant local changes in an image and there are different types of discontinuities: **surface normal, depth, surface color and illumination**.

### Gradient

We can compute edges in any direction by using the gradient from calculus. This gives us the magnitude and direction for edges in any direction. The gradient points in the direction of most rapid change in intensity. Something to note is that the gradient is the edges normal, not the edge direction. So, if you want horizontal edges, you look for vertical gradients. This is still limiting because we can only get a single direction at once, not all directions.

### Sobet/Prewitt

Two edge detection filters I would like to quickly mention are Sobel and Prewitt. Prewitt is a pure derivative filter that does not blur while Sobel is a filter that convolves a Gaussian kernel with a 1 dimensional derivative kernel (leverages gradient).

These filters are limiting as they can only find edges only in the horizontal or vertical direction (but not at the same time).

### Laplacian

There are many different flavors of laplacian; I'll just go over the 1D laplacian and Laplacian of Gaussian. Laplacian is the partial of second derivatives and can find all directions of an edge at once (rotationalluy symmetric and anisotropic). We use the 2nd derivative to look at high intensities in the 1st derivative, which will become zeros.

Laplacian of Gaussian (LoG) uses blurring with a 1D derivative filter [1 0 -1] and a second derivative filter [1 -2 1]. This can also be thought of as the difference of Gaussians: 1 0 -1 - 1 0 -1 = [1 -2 1]. Replacing LoG with deifference of Gaussians allows everything to be expressing using colvolution with Gaussian kernels.

### Big Problem

With all of the edge detections I just went over, there is a problem: scale space. There is a scale space issue of where we want the threshold to be in order to decide on which edges to preserve. For example, if we have many things in an image, edges of a butterfly might be more important than edges on a leaf (might not want to have every edge possible on a leaf).

There are two options:

1. Choose lot's of different blurrings and have many thresholds (David Marr/Andrew Witkin).
1. Pick two thresholds for an edge (Canny).

## Canny Edge Detection

Canny is the most widely used edge detector in Computer Vision. We use two thresholds, one low and one high, and use the igh threshold to start edge curves and the low to continue them (this is called "Hysteresis"). Then we do "non-maximum suppression" where edges are too thick and we thin them down to curves.

## Conclusion

For edge detection, we want to identify sudden changes in an image (going from lower to higher intensities). Since there is discontinuity, we want to perform calculus on the image. However, we need to remove noise in images as they would disturb our calculations. A common blur is the Gaussian filter, which will smooth the image but preserves important features. With this, we can now find our edges. The most common edge detector for this is Canny, which performs hysteresis and non-maximum suppression.
