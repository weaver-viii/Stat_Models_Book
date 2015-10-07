---
title: "Prediction"
author: "Rebecca Barter"
output: html_document
---


# Prediction

Much of science, social science and engineering is about finding relationships between predictor variables, typically stored in a matrix $X$, and a response variable, typically stored in a vector, $y$. For example, we might be interested in using socio-economic variables of various communities to predict the corresponding crime rate in those communities, or we could use features extracted from images to predict the response of the brain to viewings of those images. If the response variables are observable or measurable (for example crime rate, brain response, diseased/healthy), then the process of connecting predictor variables to response variables is called *supervised learning*. This is in contrast to *unsupervised learning*, described in previous sections, where our response variable was not observed (recall our discussion on clustering: the clusters were our response variable, but we had not a priori defined the cluster groups in our data). Both supervised and unsupervised learning approaches fall into the monolithic category of *machine learning*, which we will only touch upon here.




Supervised learning is an umbrella term for two primary classes of problems: *regression* for continuous responses (such as brain activity or crime rate), and *classification* for discrete categorical responses (such as an indicator specifying whether an individual is healthy or diseased). We will be focusing in this book on regression, but a plethora of resources exist for classification tools such as (in order of increasing complexity) discriminant analysis techniques, classification trees (extending to random forests), support vector machines and neural networks.


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


To frame prediction problems in a more technical way: given training data $x\_i$, $i = 1, ..., n$, where each $x\_i$ is a vector of length $p$ containing a value for each of our $p$ variables of interest (for example for the $i$th person in our dataset we might record the following predictor variables $x\_i = (gender\_i, age\_i, weight\_i, glucose\_i, insulin\_i)$) we would like to predict a response variable $y\_i$ (such as $y\_i = diabetes\_i$). The general approach find a prediction rule, $f(x\_i)$ which maps the predictor vector to a response so that ideally we should have $f(x\_i) \approx y\_i$. Then, given the predictor values, $x$, of a new observation, we can predict the unobserved response variable, $y$, using $\hat{y} = f(x)$. In general, the response $y\_i$ is a single value, but there are many cases where we want to predict multiple responses (so that $y\_i$ is a vector), in which case we call such a problem a *multi-response prediction problem*.

What are we assuming by defining some prediction rule, $f$? We're assuming that the situations or observations presented in the training data are similar (in terms of the relationship between predictor and response) to new situations where for which want to predict the outcome. If this is true, then the prediction rules that we defined using our training data are applicable to new predictor variables, and we will obtain reasonable predictions. It might be surprising that in a vast number of situations, this is not the case. For example, it might be the case that the new predictor variables were measured using a different instrument to the old predictor variables, resulting in a slightly different relationship to the response variable.


### Evaluating a prediction rule

Next, given that we have defined a prediction rule, how can we measure its effectiveness? Certainly we should first look at how close the predicted values are to the observed values. Keep in mind, however, that we do not observe the response for the new cases (since if we did, why would we need to apply the prediction rule to them?) but we do observe the response for the training data (we will return to this point momentarily). Given that we want to estimate the prediction error by comparing the predicted and observed values, what kind of measure should we use? In general, we need to choose some sort of loss function between the predicted value of a response and a realization of the response. The $L^2$ loss is a convenient and often used choice (the MSE is an $L^2$ loss), but it is not always the appropriate choice. It is important to realize, however, that any value that we come up with is not the *true* prediction error (which describes the prediction rule's error rate on the *entire population*), but rather, an *estimate* of it (since in general, we only observe a sample of the population). Given this, how can we measure uncertainty in our estimated prediction error? There are other measures of how good our prediction rule is; for example, what will the computational cost be in terms of memory space, access time and CPU time? Is the prediction rule interpretable? In many modern settings we will find that the prediction rules are incredibly uninterpretable, but some might argue that we shouldn't care about interpretability if it predicts well. However, in our work, we tend to favour simplicity in our models: the simplest model is usually the most interpretable.

Now let's return to the point mentioned above about which data we should be using to evaluate a prediction rule. Recall that, ideally, we would like to see how the rule performs on new data points, but the problem is that for new data points, we don't know the response variable (if we did, we wouldn't need to use the prediction rule to predict the response!). For example, suppose we have 200 HIV patients from each of whom we could measure a number of predictor variables (such as the amount of CD4 in their blood, their age etc) and use these variables to predict survival time. In this case, we might define a prediction rule of the responses (time until death) of these 200 patients. We are asking the following question: suppose we had a new HIV patient for whom we could measure CD4 count, age and other predictor variables, how well accurately will the prediction rule that we defined for the original 200 patients be able to predict the survival time of the patient? The patient is still alive, so we don't know their how long they survived after that point: this is the response that we want to predict! So given that we can't use new cases to evaluate the prediction rule, should we use the training data? The problem with this naive approach is that using the training data is that the prediction rule was built using their response information already, so the error rate will be overly optimistic (lower than the true error rate). 

How could we avoid this problem? *Before* defining the prediction rule, we could **set aside some of the data** (perhaps a third of the original data) that we will not touch until we are ready to assess our model (we will not use this data when we are building the prediction rule: we will pretend that it does not exist!). Let's call this data the *test dataset*. The remaining data will be the *training data*, and this is the data that we will use to define the prediction rule. But how do we choose which third of the data to set aside? Do we simply choose randomly? What if we randomly get a training set consisting mostly of males and a test set consisting mostly of females? Perhaps we could average the prediction error estimates obtained over many different random partitions into training and test sets. However, if our sample size is already small, we might be reluctant to set aside a third of the data and only train the prediction rule using the remaining two thirds. Can you think of a way of minimizing this problem? If you read our earlier section on cross-validation (CV), perhaps you can! 

#### Cross-validation

CV allows us to re-use the same data units for training and testing. The general $K$-fold cross-validation procedure is as follows:

1. Partitioning the data into $K$ subsets.

1. Set aside the first subset as our test set and train the prediction rule on the remaining $K-1$ subsets. Use the withheld test set to obtain a prediction error estimate. 

1. Replace the withheld subset, and remove the second subset and train on the remaining $K-1$ subsets to obtain a second prediction error estimate using the second subset as the test set. 

1. Repeat this procedure until we have obtained $K$ estimates of the prediction error.

1. Our final estimate is the average of these $K$ prediction error estimates.

One particularly noteworthy version of$K$-fold cross validation is *leave one out cross-validation* where each subset consists of only one single data unit (which we will use as our test set at each step), and we are training the prediction rule using all but one of the data points. This approach is similar to the jackknife procedure (from the 1940s) for estimating bias and later variance (Tukey in the 1950s).


**Warning: when the number of data units is small relative to the complexity of the prediction rule, CV can yield estimates of prediction error that are far away from the real prediction error and thus it cannot be trusted! CV error is NOT the true prediction error**

As the warning above suggests, although some of the literature would entice you to believe otherwise, cross-validation is not perfect! It estimates the prediction error, and as an estimator it could have large variance when our sample size is small relative to the complexity of the prediction rule due to the fact that the summands in CV are often positively correlated due to the large amount of shared data used to generate the estimates. This is a problem because positively correlated summands yield higher variance estimates than independent summands.


Another approach to cross-validation motivated in our discussion above is the *random split CV*:

1. Randomly select $(1 - \alpha) \times 100\\%$ of the data points to form the training set and use the remaining $\alpha \times 100\\%$ of the data points as the test set. 

1. Repeat this process $M$ times and average the resulted prediction errors. 


It is common to use $\alpha = 0.1$ or $0.2$ and $M = 50, 100$ or $200$.



**The fundamental theorem of cross-validation: the data units are exchangeable**

This theorem is frequently violated for stock return data or economic index data.



#### Prediction error estimation in batch mode


In many modern settings we are constantly accumulating new data for example in web-based problems such as predicting whether someone will click on an advertisement based on characteristics of the user. Much of the recent machine learning research has focused on prediction in the batch mode: whereby given a set of training data, we repeatedly recompute the prediction scheme after the arrival of every new data point and evaluate the new prediction rule by predicting the response of the next data point that arrives (which we will subsequently be used to re-evaluate the prediction rule), and so on and so forth. The prediction errors obtained at each step can be added up (or accumulated in some other way). This formulation is sometimes called Prequential Analysis and is closely related to predictive coding and the predictive form of the Minimum Description Length (MDL) of Rissanen. Further, this approach can be viewed as *one-way cross validation* since each future observation is not involved in the computation of its own prediction rule. The general approach can be described as follows:

1. Assume the data units form some natural order such as a time series.

1. Start with an initial predictor which could take into account subject knowledge or information from previous data

1. At time $t$ use all of the data points available at this time to form a predictor.

1. Use the observation at time $t + 1$ to evaluate the prediction error

1. Continue for all times $t + 1$, $t + 2$, and so on.

1. Finally, when we are done, average over of the prediction errors obtained at each time $t$.

This accumulated prediction error can be used to compare different prediction rules and select among competing models.


## Notes

Here's a bunch of references for data perturbation schemes for estiamting the bias, variance and sampling distribution of an estimator:

* Jackknife: Quenouille (1949, 1956), Tukey (1958), Mosteller and Tukey (1977), or Efron and Stein (1981), Wu (1986), Carlstein (1986), Wu (1990), ... 

* Sub-sampling: Mahalanobis (1949), Hartigan (1969, 1970), Politis and Romano (1992 , 94), Bickel, Götze, and van Zwet (1997), ...

* Cross-validation:  Allen (1974), Stone (1974, 1977), Hall (1983), Li (1985), ...

* Bootstrap: Efron (1979), Bickel and Freedman (1981), Beran (1984),

