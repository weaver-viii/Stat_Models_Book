---
title: "Prediction"
author: "Rebecca Barter"
output: html_document
---


# Prediction

Much of science, social science and engineering is about finding relationships between predictor variables, typically stored in a matrix $X$, and a response variable, typically stored in a vector, $y$. For example, we might be interested in using socio-economic variables of various communities to predict the corresponding crime rate in those communities, or we could use features extracted from images to predict the response of the brain to viewings of those images. If the response variables are observable or measurable (for example crime rate, brain response, diseased/healthy), then the process of connecting predictor variables to response variables is called *supervised learning*. This is in contrast to *unsupervised learning*, described in previous sections, where our response variable was not observed (recall our discussion on clustering: the clusters were our response variable, but we had not a priori defined the cluster groups in our data). Both supervised and unsupervised learning approaches fall into the monolithic category of *machine learning*, which we will only touch upon here.




Supervised learning is an umbrella term for two primary classes of problems: *regression* for continuous responses (such as brain activity or crime rate), and *classification* for discrete categorical responses (such as an indicator specifying whether an individual is healthy or diseased). A plethora of resources exist for classification tools such as (in order of increasing complexity) discriminant analysis techniques, classification trees (extending to random forests), support vector machines and neural networks, but we will only touch upon them here.


Even for basic science research, good prediction should be one of the primary goals when generating data models. If a model is unable to adequately predict reality, then it is hard to believe that the model is capable of capturing the underlying mechanisms that dictate the relationship between predictor and response. However, this is not always the case, we will see below an extremely simple example of an incorrectly specified model that generates more accurate predictions than a correctly specified model.


### Regularization: a motivational example

It is interesting to note that it is entirely possible that an "incorrect" model can provide better predictions than a "correct" model. For a simple example, suppose that we have $n$ observations, $X\_1, ..., X\_n$ which are independently and identically distributed $N(\theta, \sigma^2)$ random variables, where we know $\sigma^2$ (say, $\sigma^2 = 1$, for example), but we don't know $\theta$. Our goal is to predict the next observation in the sequence, $X\_{n + 1}$, which follows the same distribution as each of the previous $n$ variables and is independent of them. First of all, what kind of model might we come up with to predict $X\_{n + 1}$? If we knew the distribution of these random variables, then we could simply predict that $X\_{n + 1}$ will be the most likely observation to be drawn from that distribution (for example, the mean), but all we know is that the observations are normally distributed: the mean, $\theta$, is unknown, so we must estimate it! 

Let's compare two possible models. In the first model, our background knowledge gave us confidence to assume that $\theta \approx 0$ (even though $\theta = 0$ is probably incorrect), that is, we are assuming that each observation is drawn from a Gaussian distribution with $0$ mean and some known variance $\sigma^2$. In the second model, we have no idea about what the true mean might be, other than knowing that it is nonzero, so we assume only that $\theta \neq 0$. In this second model, each observation is drawn from a Gaussian distribution with some unknown (but presumably nonzero) mean, $\theta$. In Model 1, the mean of the distribution of $X\_{n + 1}$ is assumed to be 0, so it makes sense that our prediction for $X\_{n + 1}$ would be 0. In Model 2, however, we don't know the true mean, so we must estimate it! Given that we have $n$ observations drawn from this $N(\theta, \sigma^2)$ distribution, what estimator can you think of for the population mean, $\theta$? Hopefully, the first thing that came to your mind was the sample mean of the existing observations: $\hat{\theta} = \overline{X}\_n = \frac{1}{n} \sum\_{i = 1}^n X\_i$. It is not hard to show that this estimator is the *maximum likelihood* estimator. So to summarize:

* **Model 1**: assume that $X\_i \sim N(0, 1)$ so we chose $\hat{X}\_{n + 1} = 0$.

* **Model 2**: assume that $X\_i \sim N(\theta, 1)$ where $\theta \neq 0$, so we chose $\hat{X}\_{n + 1} = \overline{X}\_n$.


To assess which of these models yield better predictions for $X\_{n + 1}$ we want to compare the *prediction error* for the estimators $\hat{X}\_{n + 1} = 0$ and $\hat{X}\_{n + 1} = \bar{X}$. The prediction error describes how close our predictions, $\hat{X}\_{n + 1}$, are to the real value $X\_{n + 1}$. We can use the Mean Squared Error (MSE) as a measure of the prediction error:

$$\text{MSE}(\hat{X}\_{n + 1}) = E\left( \hat{X}\_{n + 1} - X\_{n + 1}\right)^2$$


Recall that we still don't know the value of $\theta$, all we know is that $X\_{n + 1} \sim N(\theta, \sigma^2)$, so for Model 1, where we used the estimate $\hat{X}\_{n + 1} = 0$, we have

$$\text{MSE}\_{\text{Model 1}}(\hat{X}\_{n + 1}) = E(X\_{n + 1}^2) = Var(X\_{n + 1}) + E(X\_{n + 1})^2 = \sigma^2 + \theta^2$$

On the other hand, for Model 2, where we used the estimate $\hat{X}\_{n + 1} = \overline{X}\_n$, we have

$$\text{MSE}\_{\text{Model 2}}(\hat{X}\_{n + 1}) =  E(\overline{X}\_n - X\_{n + 1})^2 = E(\overline{X}\_{n}^2) - 2E(X\_{n + 1}\overline{X}\_{n}) + E(X\_{n + 1}^2)$$

Note that $\overline{X}\_n \sim N\left(\theta, \frac{\sigma^2}{n}\right)$ (if you aren't familiar with this result, you should show it yourself!), and $X\_{n + 1}$ is independent of $\overline{X}\_n$, so the above expression simplifies to

\begin{aligned}
\text{MSE}\_{\text{Model 2}}(\hat{X}\_{n + 1}) &=  E\left(\overline{X}\_{n}^2\right) - 2E(X\_{n + 1})E(\overline{X}\_{n}) + E(X\_{n + 1}^2)\\\
& = \left(\frac{\sigma^2}{n} + \theta^2\right) - 2 \theta^2  + (\sigma^2 + \theta^2)\\\
& = \frac{\sigma^2}{n} + \sigma^2
\end{aligned}


So which model has the smallest prediction error? If the true value of $\theta$ is not too far from $0$ (more specifically, if $|\theta| < \frac{\sigma}{\sqrt{n}}$), then Model 1 has the smaller prediction error, even though the true value of $\theta$ might not be exactly $0$! To rephrase from another perspective: even though Model 2 provides an *unbiased estimator* (the sample mean is an unbiased estimator for $\theta$), it is less accurate than the biased estimator of $\hat{X}\_{n + 1} = 0$ from Model 1 (which makes the fairly strong - and likely incorrect - assumption that $\theta = 0$) *more accurately* predicts the true value of $X\_{n + 1}$ even though the true value of $\theta$ might not be 0 at all!

Perhaps at this point you're thinking "how can a biased estimator be better than a biased estimator?". If so, perhaps it's time to have a re-read of our discussion of the bias-variance tradeoff! Estimators with high bias tend to also have low variance and vice versa. Thus, sometimes we can decrease the overall MSE by adding a little bit of bias if this helps to significantly reduce the variance. This concept is known as *regularization* and is highly utilized in high-dimensional techniques.


### Set-up: prediction problems


To frame prediction problems in a more technical way: given training data $x\_i$, $i = 1, ..., n$, where each $x\_i$ is a vector of length $p$ containing a value for each of our $p$ variables of interest (for example for the $i$th person in our dataset we might record the following predictor variables $x\_i = (gender\_i, age\_i, weight\_i, glucose\_i, insulin\_i)$) we would like to predict a response variable $y\_i$ (such as $y\_i = diabetes\_i$). The general approach find a prediction rule, $f(x\_i)$ which maps the predictor vector to a response so that ideally we should have $f(x\_i) \approx y\_i$. Then, given the predictor values, $x$, of a new observation, we can predict the unobserved response variable, $y$, using ${\bf \hat{y}} = f({\bf x})$. In general, the response $y\_i$ is a single value, but there are many cases where we want to predict multiple responses (so that $y\_i$ is a vector), in which case we call such a problem a *multi-response prediction problem*.

What are we assuming by defining some prediction rule, $f$? We're assuming that the situations or observations presented in the training data are similar (in terms of the relationship between predictor and response) to new situations where for which want to predict the outcome. If this is true, then the prediction rules that we defined using our training data are applicable to new predictor variables, and we will obtain reasonable predictions. It might be surprising that in a vast number of situations, this is not the case. For example, it might be the case that the new predictor variables were measured using a different instrument to the old predictor variables, resulting in a slightly different relationship to the response variable.





### Binary prediction methods: classification

In the section above, we discussed the ultimate goal in binary prediction which is to come up with some prediction rule, $f$, such that ${\bf \hat{y}} = f({\bf x})$ is a good approximation to the true classification vector, ${\bf y}$, where ${\bf y}$ is a binary vector consisting of $0$'s and $1$'s, where, for example suppose that we have 9 observations whose true class is given by ${\bf y} = (0, 1, 1, 1, 0, 0, 1, 0, 1)$. This implies that the first observation is in class 0 (e.g. do not have diabetes), while the second, third and fourth observations are in class 1 (e.g. do have diabetes). We want to be able to use the information contained in the predictor variables ${\bf x}\_i = (x\_{i1}, ..., x\_{ip})$, for $i = 1, ..., 9$, to come up with a rule to predict ${\bf y}$. For example, we may end up with ${\bf \hat{y}} = f({\bf x}) = (0, 0, 1, 1, 0, 1, 1, 0, 1)$, which is similar to the true classification vector, ${\bf y}$, but observations two and six are misclassified.





