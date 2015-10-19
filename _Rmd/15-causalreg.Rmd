---
title: "Regression in Causal Inference"
author: "Rebecca Barter"
output: html_document
---





## Using regression in Causal Inference

Recall our discussion on [causal inference](http://rlbarter.github.io/Stat_Models_Book/3-causal.html). In this section, we introduced the Neyman-Rubin model of potential outcomes where we have two possible outcomes: the outcome if subject $i$ is assigned to treatment, $Y\_{i1}$, and the outcome if subject $i$ is assigned to control $Y\_{i0}$. For any given subject, we can only observe *one* of these two outcomes, and we can write the response that we do observe as
$$Y\_i = ( 1- T\_i) Y\_{i0} + T\_i Y\_{i1}$$

where $T\_i$ is the treatment indicator (and is a *random variable*) whereby $T\_i = 1$ is subject $i$ is assigned to treatment and $T\_i = 0$ if subject $i$ is assigned to control. We are interested in estimating the causal effect:
$$\frac{1}{N}\sum\_{i=1}^N (Y\_{i1} - Y\_{i0})$$
which is an unobservable quantity that we typically estimate by the observed average outcome difference between the treatment and control groups:
$$\tau = \frac{1}{n\_1} \sum\_{i : T\_i = 1} Y\_i - \frac{1}{n\_0} \sum\_{i : T\_i = 0} Y\_i$$

It turns out that we can very naturally relate causal effect and linear regression. Suppose that we fit a linear model to the outcome using treatment assignment as the sole predictor:

$$Y\_i = \beta\_0 + \beta\_1 T\_i + \epsilon\_i$$

Then $\beta$ can be thought of as the treatment effect on the outcome, and we can estimate it using OLS as described above. It can be shown that this estimate of the treatment effect is more or less equivalent to the simple estimator of the sample average treatment effect (SATE) of the form:

$$\tau = \frac{1}{n\_1} \sum\_{i : T\_i = 1} Y\_i - \frac{1}{n\_0} \sum\_{i : T\_i = 0} Y\_i$$

It is common to "adjust for covariates" by adding them into the regression equation

$$Y\_i = \beta\_0 + \beta\_1 T\_i + \beta\_2 x\_i +  \epsilon\_i$$

however, the only reason we should ever even be *tempted* to do this is if we believe that the covariate, $x$, is imbalanced between treatment and control in some way. This approach involving estimating the causal effect of the treatment by estimating $\beta\_1$ using regression in which we adjust for covariates seems simple, and at first glance, very reasonable; in fact, this is the reason that this approach is so widely used (and misused!). There are however a huge number of critiques of this approach, primarily in the case of observational studies. One of the main issues is the assumption of *linearity*. If this assumption is unjustified, then our OLS estimates will be significantly worse than the simple difference in means SATE estimates! Moreover, if we adjust for covariates in our linear model, it is often the case that we will introduce extra bias into our estimate of treatment effect! For example, Berk et al. (2010) claim that "Random assignment does not justify any form of regression with covariates. If regression adjustments are introduced nevertheless, there is likely to be bias in any estimates of treatment effects and badly biased standard errors". There are examples of adjustments for which this disparaging view of using regression to adjust for covariates is not justified (see, for an example, [Lin (2010)](http://www.stat.berkeley.edu/~winston/agnostic.pdf)), but these models should still be used with caution.

In general, the only reason we would want to use regression to estimate our causal effect is to adjust for covariates; if we did not feel that any of our covariates differed between the treatment and control group, then we might as well simply calculate the more general SATE estimator, $\tau$. If, however, we did feel concerned about covariate imbalance, then perhaps this adjusted regression is justified, however, there are a number of other approaches to consider: notable we might perform *matching* which involves comparing subjects in the treatment to comparable subjects in the control group (where two subjects are comparable if they have similar covariate measurements).






