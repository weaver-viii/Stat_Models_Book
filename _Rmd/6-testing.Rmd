---
title: "Hypothesis Testing"
author: "Rebecca Barter"
date: "October 19, 2015"
output: html_document
---

# Hypothesis testing

Talk about the Neyman-Pearson paper from lecture 5.

At the conceptual level (perhaps less so at the technical level), Neyman's point is still extremely relevant today. People still take the convenient alternative (even if it is misspecified). It is common today to use permutation methods to perform hypothesis testing, without specifying a specific null or alternative hypothesis: such methods simply involve permuting the data and seeing if we observe something different to what we observed in the unpermuted dataset. It's not always possible to articulate an exact hypothesis. An issue with many hypothesis testing procedures and multiple hypothesis testing techniques is that they are based upon assumptions of normality.

## Significance

Much of hypothesis testing is concerned with showing "significance", however, there is a disturbing ambiguity about what that actually means. Typically people rush to perform t-tests and claim significance if their p-value is less than 0.05, without really thinking about important things such as (1) whether a t-test is even valid and (2) what a p-value of 0.05 actually means. 

<!--

Suppose, for example, that we are interested in assessing the causal effect of a treatment on some outcome of interest $y$. Recall from our discussion on [causal inference](http://rlbarter.github.io/Stat_Models_Book/3-causal.html) that such a situation can be described by the Neyman-Rubin potential outcomes framework, whereby each individual will exhibit one of two possible (fixed) responses, the response if they recieve the treatment, $Y\_i(1)$, and the response if they do not, $Y\_i(0)$. Then, we are interested in estimating the sample treatment effect

$$\frac{1}{n} \sum\_{i=1}^n Y\_i(1) - Y\_i(0),$$

which is unobservable, since we can only ever observe one of $Y\_i(1)$ and $Y\_i(0)$. The treatment effect is thus often estimated by

$$\frac{1}{n\_1} \sum\_{i: T\_i = 1} Y\_i - \frac{1}{n\_0} \sum\_{i: T\_i = 0} Y\_i  = \overline{Y}\_T - \overline{Y}\_C$$

where $T\_i = 1$ if observation $i$ is in the treatment group and $T\_i = 0$ if observation $i$ is in the control group. Moreover, the observed outcome is defined by $Y\_i = T\_i Y\_i(1) - (1 - T\_i)Y\_i(0)$.


-->

<FONT COLOR="red">Come back to this section...</FONT>


### Normal assumptions

When we don't have normal data (as is typically the case), we typically use the central limit theorem to justify using a t-test. The central limit theorem tells us that is we have $n$ independent and identically distributed (IID) samples $X\_1, ..., X\_n$ (where each $X\_i$ has expected value $\mu$ and standard deviation $\sigma$), then distribution of the mean (or average), $\bar{X}\_n = \frac{1}{n} \sum\_{i=1}^n X\_i$, tends to the normal distribution as our sample size, $n$ increases to infinity. $$\bar{X}\_n  \overset{\text{approx}}{\sim} N\left(\mu, \frac{\sigma^2}{n}\right) ~~~~~~ \text{ for large $n$}$$

However, if we do not know the true standard deviation, $\sigma$, of our samples, then we have the related result that the distribution of the mean tends to a $t$ distribution with $n-1$ degrees of freedom. $$\frac{\bar{X}\_n - \mu}{SE(\bar{X})} \overset{\text{approx}}{\sim} t_{n-1} ~~~~~~ \text{ for large $n$}$$


However, the approximations mentioned above are exactly that: they are *approximations*. In particular, how do we know that these approximations have kicked in? If we have a non-normal, heavy tailed distribution, then the normal approximation may not kick in for small sample sizes. This might be the best that we can do in a theoretical sense, but the invention of a vast array of computational tools have allowed us to develop methods such as bootstrapping and
permutation, which have significantly fewer assumptions, and are much closer to the origins of the problems at hand.


You should really be aware when you're using normal approximations. The central limit theorem is a *weak convergence*, the theorem says that it converges but doesn't say anything about how quickly it converges. But when we use it, we need our assumptions to kick in quickly, there is no use in using methods whose assumptions are satisfied only in a lovely, but mythical, place called Asymptiopia.

Only recently, people are starting to worry about using normal assumptions in maximum likelihood estimation.

In summary: these classical approaches can still be useful, but we need to worry about

<FONT COLOR="red">this section wasn't entirely clear from the audio -- come back
to it later... </FONT>


### Issues with p-values

There is an asymmetry in terms of the null and alternative hypothesis. When we "accept" the null, that doesn't mean that we have *proved* the null! In fact, in most cases, we need to have quite a large departure from the null in order to reject it.
