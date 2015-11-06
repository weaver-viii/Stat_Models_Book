---
title: "Generalized linear models"
author: "Rebecca Barter"
date: "October 28, 2015"
output: html_document
---


# Generalized linear models

In the previous sections we have introduced a number of alternatives to using ordinary least squares for estimating the coefficients of linear models. For example, we discussed methods of performing least squares when we do not have common variance (weighted least squares) and when our errors have, not only different variances, but also non-zero covariances (generalized least squares). Moreover, we discussed alternatives to the squared loss function by using M-estimators such as least absolute deviation instead of least squares. However, in all of these examples, we have maintained that the model we were trying to fit was of the same linear form:

$$Y = X \beta + \epsilon$$

In this section, we discuss a further generalization, which this time will be a generalization on the form of the model above. 

### The link function

The essence of the generalization to the linear model is captured by the *link function*, which describes how we relate the response variable, $y\_i$, to it's expected value, $\mu\_i := E(y\_i)$. In particular, the link function is the function $g$ such that

$$g(\mu\_i) = x\_i^T \beta$$

For standard linear regression, we have

$$\mu\_i = E(Y\_i | x\_i) = x\_i^T\beta$$

and so our link function, $g$, can be described by the identity function

$$g(\mu\_i) = \mu\_i$$

#### Logistic regression

Recall that for logistic regression, we had $y\_i \sim Bernoulli\left( \frac{e^{x\_i^T\beta}}{1 + e^{x\_i^T\beta}}\right)$, and our model was specified by

$$P(y\_i = 1 |x\_i) = \frac{e^{x\_i^T\beta}}{1 + e^{x\_i^T \beta}}$$

which implies that 
$$\mu\_i = E(y\_i | x\_i) = P(y\_i = 1 |x\_i) = \frac{e^{x\_i^T\beta}}{1 + e^{x\_i^T\beta}} = \frac{1}{1 + e^{-x\_i^T\beta}}$$ 

Thus, inverting this expression to make $x\_i^T\beta$ the subject, we have that

$$x\_i^T\beta = g(\mu\_i) = \log \left( \frac{\mu\_i}{1 - \mu\_i} \right)$$ 

#### Probit regression

Another common example of a generalized linear model is the probit regression model which, like the logistic regression model allows the user to estimate the probability that an observation with a given predictor vector will fall into one of two possible classes (that is, the response is binary, i.e. $y\_i \in \\{ 0, 1\\}$). The model can be written as

$$P(y\_i = 1 | x\_i) = \Phi\left(x\_i^T\beta\right)$$

where $\Phi(\cdot)$ is the CDF of a standard normal distribution, defined by

$$\Phi(x) = \int^x\_{-\infty} \frac{1}{\sqrt{2\pi}} e^{-\frac{t}{2}} dt$$

As such, we have the following relationship between $\mu\_i$ and $x\_i^T\beta$:

$$\mu\_i = E(y\_i | x\_i) = P(y\_i = 1 | x\_i) = \Phi\left(x\_i^T \beta\right)$$

implying that the link function is the inverse of the standard normal CDF, i.e. $g^{-1}(\cdot) = \Phi(\cdot)$. It is worth noting that we could realistically choose any CDF to be the inverse of a link function. 

#### Poisson regression

Finally, what if we wanted to model our responses as a Poisson distribution. We would have (recall that the expected value of a $Poisson(\lambda)$ random variable is simply $\lambda$)

$$y\_i \sim Poisson(\mu\_i)$$

so that $\mu\_i = E(y\_i | x\_i)$. How could we relate our linear combination of predictors, $x\_i^T\beta$, to our response, $y\_i$? We could naively fit a linear regression model

$$E(y\_i | x\_i) = x\_i^T \beta $$

in which case we would have the identity link function since $\mu\_i = E(y\_i| x\_i) = x\_i^T\beta$, where the first equality comes from the distributional assumption that $y\_i \sim Poisson(\mu\_i)$ and the second equality comes from the model assumption that $E(y\_i | x\_i)  = x\_i^T \beta$. What is the problem with this formulation? First of all, this is a concise way of writing $y\_i = x\_i^T \beta + \epsilon\_i$, and we haven't claimed any distributional assumptions about $\epsilon\_i$. <FONT COLOR="red">Why is this model a bad idea?</FONT>. What if, instead, we used a log-linear model (often called Poisson regression) that is, we modeled the *log* of our response as a linear combination of the predictors <FONT COLOR="red">Why log-linear model for Poisson data?</FONT>:


$$\log \left( E\left( y\_i | x\_i\right) \right) = x\_i^T \beta$$

Thus, our relation can be specified as

$$\log(\mu\_i) = \log(E(y\_i | x\_i)) = x\_i^T \beta$$

so that the link function is

$$g(\mu\_i) = \log(\mu\_i)$$



### Exponential families

Generalized linear models unify standard linear regression, logistic regression, probit regression, Poisson regression and other regression types under a common umbrella. In fact, each of the underlying distributions for these models (normal, Bernoulli, Poisson, etc) lie within a family of distributions known as the **exponential family**, and for a regression model to be a GLM, we need the responses, $y\_i$, to be independent and follow an exponential family distribution. All densities which fall within the one-dimensional (single parameter) exponential family of distributions have the following form

$$f(y, \theta) = \exp\\{a(y) b(\theta) + c(\theta) + d(y)\\}$$

In this setting, $a(y)$ is usually referred to as a *sufficient statistic* for the parameter, $\theta$, $b(\theta)$ is some transformation of the prameter $\theta$ and $c(\theta)$ is the normalizing function. It is common to deal with the *canonical parametrization* corresponding to the case where $a(y) = y$.

For example, if we consider the $N(\mu, \sigma^2)$ distribution to be a one-dimensional distribution (where $\mu$ is the parameter of interest and $\sigma$ is just a nuisance parameter), we have

\begin{aligned}
f(y, \mu) &= \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left\\{ - \frac{1}{2\sigma^2}(y - \mu)^2 \right\\} \\\
&= \exp\left\\{ \frac{y\mu}{\sigma^2}  -\frac{y^2}{2\sigma^2} - \frac{\mu^2}{2\sigma^2} - \frac{1}{2}\log(2 \pi \sigma^2) \right\\}
\end{aligned}

so that

$$a(y) = y, ~~~~b(\mu) = \frac{\mu}{\sigma^2}, ~~~~ c(\mu) = - \frac{\mu^2}{2\sigma^2} - \frac{1}{2} \log(2 \pi \sigma^2), ~~~~ d(y) = - \frac{y^2}{2\sigma^2}$$


Note that if $a(y) = y$, then using the facts that 

$$\int f(y, \theta) dy = 1$$

which implies that 
$$\frac{d}{d\theta} \int f(y, \theta) dy = 0$$
which in turn implies that
$$\frac{d^2}{d\theta^2} \int f(y, \theta) dy = 0$$

it is not hard to show the following (extremely useful) results

$$E(Y) = - \frac{c^\prime(\theta)}{b^\prime(\theta)}$$

$$Var(Y) = \frac{b^{\prime \prime}(\theta) c^\prime(\theta) - c^{\prime \prime}(\theta)b^\prime(\theta)}{\left(b^\prime(\theta)\right)^3}$$

Why are these useful, you ask? Well suppose that we know that a distribution is in the experiential family and we are asked to compute its mean and variance, then, instead of calculating a number of tedious integrals or sums, we can simply use the above formula to obtain an immediate answer! Here's a brief walk-through of the proof of the formula for the expected value (we're going to assume that we can interchange integration and differentiation; this is a valid assumption, but the proof is beyond the scope of this book). From our second assumption above,

\begin{aligned}
0 &= \frac{d}{d\theta} \int f(y, \theta) dy \\\
& = \int \frac{d}{d\theta}  f(y, \theta) dy \\\
& = \int \frac{d}{d\theta} \left( \exp \\{y b(\theta) + c(\theta) + d(y) \\} \right) dy\\\
& \int \left( b^\prime(\theta) y + c^\prime(\theta) \right) f(y, \theta) dy\\\
& = E\left( b^\prime(\theta) Y + c^\prime(\theta) \right)
\end{aligned}

which implies that

$$E(Y) = - \frac{c^\prime(\theta)}{b^\prime(\theta)}$$

The proof of the formula for the variance follows a similar approach, and is left to the extremely interested reader.

In summary, to specify a GLM, we need the following two crucial pieces of information:

1. the *link function*

1. the * distribution of $y\_i$* which must be a member of the exponential family.

For example, for the standard linear model, the distribution of $y\_i$ is normal and the link function is the identity function, $g(\mu\_i) = \mu\_i$; for the logistic regression model, the distribution of $y\_i$ is Bernoulli and the link function is the logit function, $g(\mu\_i) = \log \left( \frac{\mu\_i}{1 - \mu\_i} \right)$.


### Fitting a generalized linear model

The above discussion concerns the formulation of the class of models known as generalized lienar models, but we have not discussed how to estimate the coefficients of interest, $\beta$. In this section, we will show that the maximum likelihood estimate (MLE) of $\beta$ for GLMs is in fact an iteratively weighted least squares estimate (IWLS). In fact, we have already shown this for the logistic regression case, but here we will focus on the general model where the responses are drawn independently from an exponenital family distribution.

Recall that if $Y\_i$ comes from an exponential family distribution, then 

$$E(Y\_i) = \mu\_i = -\frac{c^\prime(\theta\_i)}{b^\prime(\theta\_i)}$$

and that by definition of the link function, $g$, 
$$g(\mu\_i) = g(E(Y\_i)) = x\_i^T \beta$$

What this implies is that there is some dependency between the exponential family parameter $\theta$ and the model parameter $\beta$, which we will now begin to explore. To proceed in a general setting, suppose that the responses, $Y\_i$, are random variables drawn from an exponential family distribution, and that the predicors, $x\_i$, are fixed. We can now make the following general definitions

\begin{aligned} \mu\_i := E(Y\_i)  \end{aligned}

and

$$\eta\_i = x\_i^T \beta$$

Further, we will make the crucial assumption that these two entities are related by a link function, $g$. That is

$$g(\mu\_i) = \eta\_i$$

and recall that if the distribution of the $Y\_i$ lies in the exponential family of distributions with parameter $\theta\_i$, then

$$\mu\_i = -c^\prime(\theta\_i)/b^\prime(\theta\_i)$$

Note that $\theta\_i$ is a distribution parameter, while $\beta$ is a model parameter.

We will now delve into a discussion of the maximum likelihood estimator for the model parameter, $\beta$, and we will describe an iterative approach to the estimation problem. Recall that by independence of the $Y\_i$, the likelihood function is given by $L(y, \beta) = f\_{\beta}(y\_1, ..., y\_n) = f\_{\beta}(y\_1)f\_{\beta}(y\_2) \dots f\_{\beta}(y\_n)$, To begin, the log-likelihood function is given by

\begin{aligned}
\ell(\beta) & = \log (Ly, \beta) \\\
& = \left( \prod\_{i=1}^n f\_{\beta}(y\_i) \right) \\\
& = \sum\_{i=1}^n \log f\_\beta(y\_i) \\\
& = \sum\_{i=1}^n \left( a(y\_i) b(\theta\_i) + c(\theta\_i) + d(y\_i) \right)
\end{aligned}

Ideally we would like to find the value of $\beta$ that maximizes $\ell(\beta)$, however note that as it is written above, $\beta$ doesn't even appear in $\ell(\beta)$. In actuality $\beta$ does appear in the above expression via dependencies of the other parameters. Recall that we claimed above that there exists some dependency between the exponential family parameter $\theta$ and the model parameter $\beta$; it is this dependency that we will exploit when we attempt to maximize the likelihood with respect to $\beta$.

It turns out that, again, there will be no closed form solution to $\hat{\beta} = \underset{\beta}{\text{argmax}} \ell(\beta)$, and we must use numeric methods such as Newton-Rhapson. Recall that the intuition behind such approaches is based on making increasingly accurate approximations by at each iteration, defining our new estimate by taking a step in the direction of the derivative of the function that we are trying to maximize. If there exists a nearby maxima or minima, then this process guarentees that by this procedure we will get closer and closer to the maxima or minima.

#### The Fisher-scoring iteration method for estimating $\beta$

In a general setting, suppose that we have iid random variables $Y\_1, ..., Y\_n$ with a twice differentiable density $f(y; \theta)$ where our problem of interest is in calculating the MLE for $\theta$. Given a starting point $\theta\_0$, a Taylor expansion of the score function about $\theta\_0$, $U(\theta) = \ell^\prime(\theta)$, yields

$$U(\theta) \approx U(\theta\_0) - \mathcal{J}(\theta\_0)(\theta - \theta\_0)$$

where $\mathcal{J}(\theta) = E(-H(\ell)) = E(U(\theta)U(\theta)^T)$ is the Fisher information matrix and $H(\ell)$ is the Hessian matrix of the likelihood function defined by

$$H(\ell) = \left[ \begin{array}{cccc} \frac{\partial^2l}{\partial \beta\_1^2} & \frac{\partial^2l}{\partial \beta\_1\partial \beta\_2} & \dots & \frac{\partial^2l}{\partial \beta\_1\partial \beta\_p} \\\
\frac{\partial^2l}{\partial \beta\_2\partial \beta\_1} & \frac{\partial^2l}{\partial^2 \beta\_2} & \dots & \frac{\partial^2l}{\partial \beta\_2\partial \beta\_p}\\\
\vdots & \vdots & \ddots & \vdots\\\
\frac{\partial^2l}{\partial \beta\_p\partial \beta\_1} & \frac{\partial^2l}{\partial \beta\_p\partial \beta\_2} & \dots & \frac{\partial^2l}{\partial^2 \beta\_p}\end{array}\right]$$

Note that traditional Newton-Rhapson takes a similar approach although instead of the Fisher information, which is the expected value of the Hessian matrix, the traditional NR approach uses the empirical Hessian matrix. 

Note that, by definition of $\hat{\theta}\_{MLE}$ as the value of $\theta$ that maximizes $\ell(\theta)$, it follows that $U\left(\hat{\theta}^{MLE}\right) = 0$, and so rearranging the above Taylor expansion, we get that

$$\hat{\theta}^{MLE} \approx \theta\_0 + \mathcal{J}^{-1}(\theta\_0)U(\theta\_0)$$

which inspires the final iterative algorithm

$$\theta\_{m + 1} = \theta\_m + \mathcal{J}^{-1}(\theta\_m)U(\theta\_m)$$

The (somewhat tedious) details provided in the appendix show that for the case of GLMs, given a current estimate $\beta^{(m-1)}$, the Fisher Scoring algorithm simplifies to solving

$$X^TWX \beta^{(m)} = X^TWZ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ (\*)$$

for $\beta^{(m)}$ where $Z$ is a vector with elements given by

$$Z\_i = \sum\_{k=1}^px\_{ik}\beta\_k^{(m-1)} + (Y\_i - \mu\_i) \frac{d\eta\_i}{d\mu\_i}$$

Note that the form of $(\*)$ is extremely similar to that of the normal equations for weighted least squares (WLS) on a standard linear model ($X^TX \hat{\beta}\_{OLS} = X^TY$), with the crucial difference that in the GLM situation, the expression is weighted must be solved iteratively. In particular, we have shown that for GLMs, the maximum likelihood estimates of $\beta$ are obtained by an *iterative weighted least squares* procedure.

---------

# Appendix: derivation of the Fisher scoring algorithm for GLMs

The iterative algorithm for deriving the MLE for GLMs is given by

$$\theta\_{m + 1} = \theta\_m + \mathcal{J}^{-1}(\theta\_m)U(\theta\_m)$$

Recall that the *score function*, $U(\beta)$, is defined to be the derivative of the likelihood function, however, if $\beta$ is a vector instead of a scalar variable, we instead take elementwise derivatives:

$$U(\beta) = \Delta \ell(\beta) = \left(\frac{\partial \ell(\beta)}{\partial \beta\_1},... , \frac{\partial \ell(\beta)}{\partial \beta\_p}\right)$$

Our goal is to find the values of $\beta$ such that $U(\beta) = 0$, this value will correspond to the value of $\beta$ that maximizes the log-likelihood function. Note that using the chain rule for differentiation we can write

$$[(U(\beta)]\_j = \frac{\partial \ell(\beta)}{\partial \beta\_j} = \sum\_{i=1}^n \frac{d \ell}{d \theta\_i} \frac{d\theta\_i}{d\mu\_i} \frac{d\mu\_i}{d\eta\_i} \frac{d\eta\_i}{d\beta\_j}$$


To understand where each of these decompositions came from, note that

* the only parameters that appears in $\ell = \sum\_{i=1}^n \left( a(y\_i) b(\theta\_i) + c(\theta\_i) + d(y\_i) \right)$ are the $\theta\_i$, so $\ell$ is primarily a function of the $\theta\_i$ (we wrote it as $\ell(\beta)$ above to emphasize that we will be maximizing with respect the $\beta$),

* the relation $\mu\_i = -c^\prime(\theta\_i)/b^\prime(\theta\_i)$ implies that we could write $\theta\_i$ as a function of $\mu\_i$,

* by definition of the link function, $g(\mu\_i) = \eta\_i$ so $\mu\_i = g^{-1}(\eta\_i)$ is a function of $\eta\_i$,

* and $\eta\_i = x\_i^T \beta = \beta\_0 + x\_{i1} \beta\_1 + ... + x\_{ij} \beta\_j + ... + x\_{ip} \beta\_p$ implying that $\eta\_i$ is a function of $\beta\_j$.



Thus in order to calculate the score function at the $j$th parameter, $[U(\beta)]\_j$, we need to first calculate, $frac{d \ell}{d \theta\_i}$, $\frac{d\theta\_i}{d\mu\_i}$, $\frac{d\mu\_i}{d\eta\_i}$ and $\frac{d\eta\_i}{d\beta\_j}$. More specifically, supposing that we are using the canonical parametrization ($a(Y\_i) = Y\_i$), we have

\begin{aligned}
\frac{d\ell}{d\theta\_i} &= a(Y\_i) b^\prime(\theta\_i) + c^\prime(\theta\_i)\\\
& = Y\_i b^\prime(\theta\_i) + c^\prime(\theta\_i)\\\
& = b^\prime(\theta\_i) \left( Y\_i + \frac{c^\prime(\theta\_i)}{b^\prime(\theta\_i)} \right)\\\
& = b^\prime(\theta\_i)(Y\_i - \mu\_i)
\end{aligned}

Next, we have

\begin{aligned}
\frac{d\theta\_i}{d\mu\_i} &= \frac{1}{d\mu\_i/d\theta\_i} \\\
& = - \left( \frac{b^\prime(\theta\_i) c^{\prime \prime}(\theta\_i) - b^{\prime \prime}(\theta\_i) c^\prime(\theta\_i)}{b^\prime(\theta\_i)^2} \right)^{-1}\\\
& = (b^\prime(\theta\_i)Var(Y\_i))^{-1}
\end{aligned}

and finally since $\eta\_i = x\_i^T \beta = \beta\_0 + x\_{i1} \beta\_1 + ... + x\_{ij} \beta\_j + ... + x\_{ip} \beta\_p$, we have that

$$\frac{d\eta\_i}{d\beta\_j} = x\_{ij}$$


Thus the $j$th entry of the score function is given by

$$[U(\beta)]\_j = \sum\_{i=1}^n \frac{Y\_i - \mu\_i}{Var(Y\_i)} \frac{d\mu\_i}{d\eta\_i} x\_{ij}$$

Next, the Fisher information matrix can be derived as follows

\begin{aligned}
\mathcal{J}\_{jk} & = E(-H(\ell))\_{jk} = E\left(U(\beta)U(\beta)^T\right)\_{jk}\\\
& = E\left( \left( \sum\_{i=1}^n \frac{Y\_i - \mu\_i}{Var(Y\_i)} \frac{d\mu\_i}{d\eta\_i} x\_{ij} \right)\left( \sum\_{l=1}^n \frac{Y\_l - \mu\_l}{Var(Y\_l)} \frac{d\mu\_l}{d\eta\_l} x\_{lk} \right)\right)\\\
& = E\left( \sum\_{i=1}^n \frac{(Y\_i - \mu\_i)^2}{Var(Y\_i)^2} \left( \frac{d\mu\_i}{d\eta\_i} \right)^2 x\_{ij}x\_{ik} \right)\\\
& = \sum\_{i=1}^n \frac{x\_{ij}x\_{ik}}{Var(Y\_i)} \left(\frac{d\mu\_i}{d\eta\_i} \right)^2
\end{aligned}

where the last equality uses the fact that $E(Y\_i - \mu\_i)^2 = Var(Y\_i)$. Thus we have shown that

$$\mathcal{J} = X^TWX$$

where the diagonal weight matrix, $W$, has entries

$$W\_{ii} = \frac{1}{Var(Y\_i)} \left( \frac{d\mu\_i}{d\eta\_i}\right)^2$$


Finally, recall that the Fisher-scoring iterative method for estimating the MLE is given by

$$\beta^{(m)} = \beta^{(m - 1)} + \left( \mathcal{J}^{(m-1)}\right)^{-1}U(\beta^{(m-1)})$$

where $\beta^{(m-1)}$ is the estimate for $\beta$ at the $(m-1)$th iteration. Multiplying both sides of the above expression by $\mathcal{J}^{(m-1)}$ yields

$$\mathcal{J}^{(m-1)} \beta^{(m)} = \mathcal{J}^{(m-1)} \beta^{(m-1)} + U\left(\beta^{(m-1)}\right)$$

which, from the derivations above, is equivalent to

$$\sum\_{k=1}^p \sum\_{i=1}^n \frac{x\_{ij}x\_{ik}}{Var(Y\_i)} \left( \frac{d\mu\_i}{d\eta\_i} \right)^2 \beta\_k^{(m)} = \sum\_{k=1}^p \sum\_{i=1}^n \frac{x\_{ij}x\_{ik}}{Var(Y\_i)} \left( \frac{d\mu\_i}{d\eta\_i}\right)^2 \beta^{(m-1)} + \sum\_{i=1}^n \frac{Y\_i - \mu\_i}{Var(Y\_i)} \frac{d\mu\_i}{d\eta\_i} x\_{ij}$$

which can be written infinitely more concicely in matrix form as

$$X^TWX \beta^{(m)} = X^TWZ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ (\*)$$

where $Z$ is a vector with elements given by

$$Z\_i = \sum\_{k=1}^px\_{ik}\beta\_k^{(m-1)} + (Y\_i - \mu\_i) \frac{d\eta\_i}{d\mu\_i}$$

To summarize, given an estimate $\beta^{(m-1)}$, the new estimate is given by $\beta^{(m)}$ that satisfies the expression given in $(\*)$.



