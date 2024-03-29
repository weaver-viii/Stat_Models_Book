---
title: "Evaluating a prediction rule"
author: "Rebecca Barter"
date: "November 3, 2015"
output: html_document
---

# Evaluating a prediction rule




In the small example given above, where we have 9 observations, each of which fall into one of two classes, ${\bf y} = (0, 1, 1, 1, 0, 0, 1, 0, 1)$, and each of which has an associated vector of predictor variables, ${\bf x}\_1, {\bf x}\_2, ..., {\bf x}\_9$. We defined a hypothetical prediction rule, $f$, which when applied to our 9 observations yielded ${\bf \hat{y}} = f({\bf x}) = (0, 0, 1, 1, 0, 1, 1, 0, 1)$. We noted that this predicted class vector is similar to the true class vector, ${\bf y}$, but observations two and six are misclassified. So we have defined our prediction rule (continuous or binary), $f$, and then tested it using our original data (the same data that was used to define $f$). Is this a good measure of how well this prediction rule will work on new data points whose class we *don't* already know? Probably not; the prediction rule $f$ was defined using the knowledge of the true class of our original data points, and thus probably predicts the class of these data points better than it would on new data points based on which the prediction rule was not defined.


So for any given prediction rule, how can we measure its effectiveness on new data? Our goal is to look at how close the predicted response values are to the observed (true) response values. The problem is that we do not observe the responses (or class) for the new cases (since if we did, why would we need to apply the prediction rule to them?) but we do observe the response for the training data (we will return to this point momentarily). Given that we want to estimate the prediction error by comparing the predicted and observed values, what kind of measure should we use? In general, we need to choose some sort of loss function between the predicted value of a response and a realization of the response. For continuous prediction problems, the $L^2$ loss is a convenient and commonly used choice (the MSE is an $L^2$ loss), but it is not always the appropriate choice. For binary prediction problems, it is more common to look at the misclassification rate (the proportion of observations whose predicted class is different to the true class). It is important to realize, however, that we cannot calculate *true* prediction error (which describes the prediction rule's error rate on the *entire population*), but rather, an *estimate* of it (since in general, we only observe a sample of the population). How can we measure uncertainty in our estimated prediction error? There are other measures of how good our prediction rule is; for example, what will the computational cost be in terms of memory space, access time and CPU time? Is the prediction rule interpretable? In many modern settings we will find that the prediction rules are incredibly uninterpretable, but some might argue that we shouldn't care about interpretability if it predicts well. However, in our work, we tend to favor simplicity in our models: the simplest model is usually the most interpretable.

Now let's return to the point mentioned above about which data we should be using to evaluate a prediction rule. Recall that, ideally, we would like to see how the rule performs on new data points, but the problem is that for new data points, we don't know the response variable (if we did, we wouldn't need to use the prediction rule to predict the response!). For example, suppose we have 200 HIV patients from each of whom we could measure a number of predictor variables (such as the amount of CD4 in their blood, their age etc) and use these variables to predict survival time. In this case, we might define a prediction rule for the responses (time until death) of these 200 patients. We are asking the following question: suppose we had a new HIV patient for whom we could measure CD4 count, age and other predictor variables, how well accurately will the prediction rule that we defined for the original 200 patients be able to predict the survival time of the patient? The patient is still alive, so we don't know their how long they survived after that point: this is the response that we want to predict! So given that we can't use new cases to evaluate the prediction rule, should we use the training data? The problem with this naive approach is that using the training data is that the prediction rule was built using their response information already, so the error rate will be overly optimistic (lower than the true error rate). 

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

Here's a bunch of references for data perturbation schemes for estimating the bias, variance and sampling distribution of an estimator:

* Jackknife: Quenouille (1949, 1956), Tukey (1958), Mosteller and Tukey (1977), or Efron and Stein (1981), Wu (1986), Carlstein (1986), Wu (1990), ... 

* Sub-sampling: Mahalanobis (1949), Hartigan (1969, 1970), Politis and Romano (1992 , 94), Bickel, Götze, and van Zwet (1997), ...

* Cross-validation:  Allen (1974), Stone (1974, 1977), Hall (1983), Li (1985), ...

* Bootstrap: Efron (1979), Bickel and Freedman (1981), Beran (1984),

