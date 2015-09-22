---
title: "Principal component analysis"
author: "Rebecca Barter"
output: html_document
---

# Principal component analysis

Principal component analysis (PCA) is one of the most widely used methods for dimensionality reduction. Why might we want to reduce the dimension of our data? Doesn't that mean that we're losing information? Well... yes, but this can be a good thing if what we're throwing away is the bits of our data that aren't useful! When we have more concise information, it is more interpretable, and if we can effectively condense our masses of information into smaller, more concise, parcels of information then that's just great! Dimensionality reduction is used for a huge array of reasons including visualization, faster computation, smaller storage and faster communication of data and it can even be considered to be a form of regulatization (by indirectly reducing the variance of our estimation).

The idea behind PCA is that we want to decompose our variables into informative orthogonal components consisting of linear combinations of the original variables. We want to find the components which posess the smallest ($L^2$) distance from the original data. There are a number of different algorithms to produce these components for example by using singular value decomposition (SVD) or eigen decomposition: Let $G = X^TX$ be the sample covariance matrix which is symmetric. The eigenvalue decomposition of $G$ is given by

$$G = UDU^T$$

where $U$ is unitary or orthogonal matrix (that means $U^TU = I$) and $D$ is a diagonal matrix with non-negative diagonal entries that are the eigenvalues of $G$. Let the $j$th column vector of $U$ be $U\_j$ and of $D$ be $d\_j$, that is

$$GU\_j = d\_j U\_j$$

The prinicpal components are linear combinations of the original variables in our data, and the idea is typically that we want to use some of these principal components as our new variables (typically those that capture the most variability within the data). Why might we be weary of considering linear combinations of our data, rather than considering each variable individually? One of the primary reason is that we lose interpretability. What does a principal component measure? 

The first prinicipal component is the linear combination of the variables that captures the most variability within the data, while the second principal component is the linear combination that captures the most variability that is not captured (or is left over) by the first principal component, and so on and so forth. 

Another way to think about the principal components is that we want to find the projection of the data such that along that projection, the variability is maximized. 

It is common to center the data prior to conducting PCA. 

Let's walk through the theoretical steps: <FONT COLOR="red"> Do it</FONT>



* talk about looking at how much variability each PC captures (screeplot -- plot the eigenvalues in decreasing order -- inspect to find a gap to decide how many principal components to keep)



