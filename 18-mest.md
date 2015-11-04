---
title: "Alternatives to least squares"
author: "Rebecca Barter"
date: "October 19, 2015"
output: html_document
---


# Alternatives to least squares: least absolute deviation and M-estimation

Above we have focused primarily on estimating $\beta$ in the model $y = X\beta  + \epsilon$ by minimizing the squared loss function (or weighted versions of it):

$$\hat{\beta}\_{OLS} = \underset{\beta}{\text{argmin}} \sum\_{i=1}^n (y\_i - X\_i^T \beta)^2$$

but what's stopping us from using other types of loss functions? The answer is: absolutely nothing! This prompts us to define a general M-estimator (of which least squares is an example): an M-estimate of $\beta$ is any estimator that can be written in the following form

$$\hat{\beta} = \underset{\beta}{\text{argmin}} \sum\_{i=1}^n \rho(y\_i - X\_i^T \beta)$$

where $\rho$ is any suitable function. For example

* $\rho(x) = x^2$ gives us the ordinary least squares estimator.

* $\rho(x) = \vert x \vert$ gives us the least absolute deviation (LAD) estimator.

If in general, we consider the OLS estimate as a generalization of the mean ($\underset{a}{\text{argmin}} \sum\_{i=1}^n (x\_i - a)^2 = \bar{x}$), then the LAD estimate can be thought of as a generalization of the median ($\underset{a}{\text{argmin}} \sum\_{i=1}^n |x\_i - a| = \text{median}(x)$). The LAD is in general much more robust to outliers than the OLS estimator, but it does not confer a closed-form solution (recall that the closed-form solution for the OLS estimator is $\hat{\beta}\_{OLS} = (X^TX)^{-1}X^Ty$). So how can we use LAD to estimate $\beta$?

We can use the fact that $\frac{\vert X \vert^2}{\vert X \vert} = \vert X \vert$ to iteratively compute the LAD estimate using weighted least squares. The procedure is as follows: 

1. Choose an initial estimate (typically we use the standard OLS estimator as our starting point) $$\hat{\beta}^{(0)} = \hat{\beta}\_{OLS}$$.

1. Given a current estimate, $\hat{\beta}^{(t)}$, calculate a new LAD estimate by solving
\begin{aligned}
\hat{\beta}^{(t + 1)} & = \underset{\beta}{\text{argmin}} \sum\_{i=1}^n \frac{\Big\vert y\_i - X\_i^T \beta \Big\vert^2}{\Big\vert y\_i - X\_i^T \beta^{(t)} \Big\vert}\\\
& =  \underset{\beta}{\text{argmin}} \sum\_{i=1}^n w\_i(t) \Big\vert y\_i - X\_i^T \beta \Big\vert^2
\end{aligned}
where $w\_i(t) = \frac{1}{\Big\vert y\_i - X\_i^T \hat{\beta}^{(t)} \Big\vert}.$

1. Continue until convergence has been achieved.

Note that this is equivalent to iteratively solving a WLS problem.



Since the LAD estimator is more robust than the OLS estimator, shouldn't we just always use the LAD estimator? Can you think of an example of why not? Essentially this question boils down to whether or not the median is "better" than the mean as an estimator of a "typical value". In reality, which provides a better estimator depends on what you mean by typical. As an example, consider reporting housing prices in a particular area. If the area consists of mostly moderately sized houses but there are a few extremely large houses, then these large houses will have a large influence on the mean house price (it will inflate it significantly and give a misleading sense of how nice the houses in the area are), but they will have little effect on the median house price. In this situation, since we are interested in the house of a "typical" house in the area, it makes sense to look at the median house price rather than the mean. On the other hand, if the outliers are informative in terms of the questions being asked, then you don't want to ignore them by using a robust estimator or deleting the observations! 

