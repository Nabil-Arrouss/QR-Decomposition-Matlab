# QR-Decomposition-Matlab

## Overview
This set of MATLAB functions provides implementations for QR-decomposition using Gram-Schmidt orthogonalization and Householder transformation. The four functions are named gramschmidt, householder, hhgraph, and hhalg.
- Tests are available within the source codes

## Functions

1). gramschmidt.m - QR-Decomposition using Gram-Schmidt

- Input Parameter: Square matrix (A).
  
- Output Arguments: Orthogonal matrix (Q) and upper triangular matrix (R) such that A = Q · R.
  
- Functionality:
  
  . Checks the existence of the decomposition (ensures linear independence of columns of A).
  
  . Uses the Gram-Schmidt orthogonalization method.
  
  . Can utilize MATLAB functions for computing norms or calculate norms via definition.
  
2). householder.m - Householder Transformation Matrix

- Input Parameters: Coordinates of the point and its image (P, P').
  
- Output: Householder transformation matrix.

- Functionality:
  
  . Creates the matrix of a Householder transformation.
  
  . Takes care of choosing signs during transformation, where the parameter σ affects the stability of the method.
  
3). hhgraph.m - Graphical Input for Householder Transformation

- Functionality:

  . Asks for graphical input for 2D points.
  
  . Displays points and the hyperspace of reflection.
  
  . Asks for another point via graphical input and applies the transformation using the householder function.
  
4). hhalg.m - QR-Decomposition with Householder Algorithm

- Input Parameter: Square matrix (A).
  
- Output Arguments: Orthogonal matrix (Q) and upper triangular matrix (R) such that A = Q · R
  
- Functionality:
  
  . Realizes QR-decomposition using the Householder algorithm.
  
  . Calls the householder function for Householder transformations.
