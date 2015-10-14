---
title: "Uncategorized Topics"
author: "Rebecca Barter"
output: html_document
---

# Hypothesis testing

Talk about the Neyman-Pearson paper from lecture 5.

At the conceptual level (perhaps less so at the technical level), Neyman's point is still extremely relevant today. People still take the convenient alternative (even if it is misspecified). It is common today to use permutation methods to perform hypothesis testing, without specifying a specific null or alternative hypothesis: such emthods simply involve permuting the data and seeing if we observe something different to what we observed in the unpermuted dataset. It's not always possible to articulate an exact hypothesis. An issue with many hypothesis testing procedures and multiple hypothesis testing techniques is that they are based upon assumptions of normality.

### Normal assumptions

When we don't have normal data (as is typically the case), we typically use the central limit theorem to justify using a t-test. The central limit theorem tells us that is we have $n$ independent and identically distributed (IID) samples $X\_1, ..., X\_n$ (where each $X\_i$ has expected value $\mu$ and standard deviation $\sigma$), then distribution of the mean (or average), $\bar{X}\_n = \frac{1}{n} \sum\_{i=1}^n X\_i$, tends to the normal distribution as our sample size, $n$ increases to infinity.
$$\frac{\bar{X}\_n - \mu}{\sigma} \overset{\text{approx}}{\sim} N\left(\mu, \frac{\sigma^2}{n}\right) ~~~~~~ \text{ for large $n$}$$

However, if we do not know the true standard deviation, $\sigma$, of our samples, then we have the related result that the distribution of the mean tends to a $t$ distribution with $n-1$ degrees of freedom.
$$\frac{\bar{X}\_n - \mu}{SE(\bar{X})} \overset{\text{approx}}{\sim} t_{n-1} ~~~~~~ \text{ for large $n$}$$


However, the approximations mentioned above are exactly that: they are *approximations*. In particular, how do we know that these approximations have kicked in? If we have a non-normal, heavy tailed distirbution, then the normal approximation may not kick in for small sample sizes. This might be the best that we can do in a theoreticaly sense, but now we have methods such as bootstrapping and resampling, which have significantly fewer assumptions.


You should really be aware when you're using normal approximations. The central limit theorem is a *weak convergence*, the theorem says that it converges but doesn't say anything about how quickly it converges. But when we use it, we need our assumptions to kick in quickly, theres no use in using methods whose assumptions are satisfied only in a lovely, but mythical, place called Asymptiopia.

Only recently, people are starting to worry about using normal assumptions in maximum likelihood estimation.

In summary: these classical approaches can still be useful, but we need to worry about 

<FONT COLOR="red">this section wasn't entirely clear from the audio -- come back to it later... </FONT>


### Issues with p-values

There is an asymmetry in terms of the null and alternative hypothesis. When we "accept" the null, that doesn't mean that we have *proved* the null! In fact, in most cases, we need to have quite a large departure from the null in order to reject it.



