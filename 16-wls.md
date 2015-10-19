---
title: "Generalized least squares"
author: "Rebecca Barter"
date: "October 19, 2015"
output: html_document
---


# Weighted least squares

Imagine that we want to fit a linear model, $y = X\beta + \epsilon$, where the error terms $\epsilon$ are assumed to be independent of $X$, but we do not believe the usual assumption that each of the error terms $\epsilon\_i$ are iid with $E(\epsilon | X) = 0$ and $Cov(\epsilon | X) = \sigma^2 I$. In particular, what if we have reason to believe that the common variance assumption is violated. That is, instead of each error term having the same variance (homoskedasticity), we allow the error terms to each have different variances (heteroskedasticity):

$$Cov(\epsilon | X) = \Sigma = \left[ \begin{array}{cccc} \sigma\_1^2 & 0 & \dots & 0\\\
 0 & \sigma\_{2}^2 & \dots & 0\\\
 \vdots & \vdots & \ddots & \vdots\\\
 0 & 0 & \dots & \sigma\_{n}^2\end{array} \right]$$
 
 
Note that the standard OLS assumption of homoskedasticity corresponds to the case where $\sigma\_1^2 = \sigma\_2^2 = \dots = \sigma\_n^2 = \sigma^2$. In the variance-covariance matrix above, we still assume *independent* errors, but we no longer assume *identically distributed* errors.

Heteroskedasticity is actually quite common, for example, suppose that we are interested in measuring household expenditure on meals as a function of household income. We might expect households of lower income to be more consistent in their food expenditure by always purchasing inexpensive food. Higher income households, on the other hand, will tend to be more variable in the amount they expend on their meals: on occasion, they will endulge in an extremely fancy and disturbingly expensive meal, while there will likely be other instances where they fall back on less expensive, yet more convenient meal options. Such an example of heteroskedasticity is demonstrated in the figure below, whereby we are observing household meal expenditure on a particular day versus income for 100 different households. We see that there is much less variability in the low-income households, whereas there is much more variability in the high-income households.


<img src = "heteroskedasticity.png" alt="heteroskedasticity" style="width:500px;height:400px;">


Given that for data which exhibits heteroskedasticity we are violating the iid assumption for the errors, can we still use the standard OLS procedure to estimate $\beta$? Technically, yes, we can use whatever estimator we want, however, whenever we violate model assumptions the estimates that we obtain are much less trustworthy. The question is, in what way are the estimates less trustworthy? Are they biased? Do they have incorrect variance? Are they even estimating the right thing? We will explore answers to these questions in the case of heteroskedaasticity below. <FONT COLOR="red">Come back to these questions</FONT>

-----

### Estimating $\beta$ in the presence of heteroskedasticity using weighted least squares

To estimate $\beta$ when we do not have constand variance accross observations, we can use a procedure called weighted least squares (WLS). The motivation behind WLS is that we have less confidence in observations which are extremely variable, and so we would like to reduce their influence on the least squares estimator by downweighting such observations. In the presence of heteroskedasticity, the standard OLS estimator would be dominated by these noisy observations. Our goal is to reduce the impact of the imbalance of noise in our data. The WLS estimator can thus be written as

$$\hat{\beta}\_{WLS} = \underset{\beta}{\text{argmin}} \sum\_{i=1}^n \left(\frac{y\_i - X\_i^T \beta}{\sigma\_i} \right)^2$$

Note that the difference between $\hat{\beta}\_{WLS}$ and $\hat{\beta}\_{OLS}$ is the fact that we are dividing (weighting) by $\sigma\_i$ in the WLS estimator. If we define W to be the matrix where

$$W\_{ij} = \begin{cases} \frac{1}{\sigma\_i^2} & \text{ if } i = j \\\ 0 &\text{otherwise} \end{cases}$$

then it is not too hard to show that our WLS estimator $\hat{\beta}\_{WLS}$ satisfies

$$(X^TWX)\hat{\beta}\_{WLS} = X^TWy$$

(recall that our OLS estimator satisfied $(X^TX)\hat{\beta}\_{OLS} = X^Ty$). So if $X^TWX$ is invertible, our estimator becomes

$$\hat{\beta}\_{WLS} = (X^TWX)^{-1}X^TWy$$














