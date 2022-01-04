+++
title = "Computer Graphics (Matrix Algorithms)"
date = 2022-01-02
updated = 2022-01-04
[taxonomies]
category = ["uab"]
tags = ["uab", "matrix-algorithms", "linear-algebra"]
+++


# Index
 - [Background](#background)
 - [Householder Transformation](#householder-transformation)
 - [QR Decomposition](#qr-decomposition)
 - [Principal Component Analysis](#pca)
 - [SVD](#svd)
 - [Subdivision Curves](#sd)
 - [Bezier Curves](#bc)
 - [Cubic B-splines](#cbc)
 



## Background

I took and TA'd for a course called Matrix Algorithms which uses advanced linear algebra techniques for numerical computing and computer graphics. Understanding this material is nearly impossible if you don't have prior experience with linear algebra. I'll be metioning the few topics I found useful and their applications.


## Householder Transformation

Orthogonal matrices have some nice properties: they rotate and reflect. As it rotates, the distance is preserved. A Householder matrix is orthogonal and its main goal is to reflect, or "mirror", a vector across a hyperplane.

You have some hyperplane with a normal _u_ (assume unit vector) and the vector _x_ that you are trying to reflect. Togeher, the span of _u_ and _x_ form a two dimensional space. You take the dot product of the two vectors and multiply it by _u_ (the component of _x_ in the _u_ direction): (__u__<sup>t</sup>__x__)__u__ . You change the direction and double this to reach your desired reflected vector: _x_ - 2(_u_<sup> t</sup>_x_)_u_ . Currently, this is just an expression and the matrix that does this transformation (Householder) is as follows: (I - 2 _u_ _u_<sup> t </sup>). The householder vector is _u_, the normal of the reflecting hyperplane.

Many algorithms will use the Householder transformation matrix, mosty when premultiplying existing matrices. The time complexity of Householder is __O(n<sup>2</sup>)__ while its space is __O(n)__ (we normalize _u_).



## QR Decomposition

QR Decomposition involves rectangular, orthogonal and upper triangular matrices. With LU decomposition, we could only work with square matrices. Now, we're able to work with more general things, like least squares, solving linear systems, finding orthogonal bases (Gram-Schmidt) and spectral analysis.

In general, QR is good for building orthogonal matrices but, much of it is used to push towards upper triangular matrices for effeciency.

Q - Orthogonal, R - Upper Triangular