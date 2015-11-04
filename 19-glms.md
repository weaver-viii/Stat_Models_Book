---
title: "Generalized linear models"
author: "Rebecca Barter"
date: "October 28, 2015"
output: html_document
---


# Generalized linear models

In the previous sections we have introduced a number of alternatives to using ordinary least squares for estimating the coeffieicnets of linear models. For example, we discussed methods of performing least squares when we do not have common variance (weighted least squares) and when our errors have, not only different variances, but also non-zero covariances (generalized least squares). Moreover, we discussed alternatives to the squared loss function by using M-estimators such as least absolute deviation instead of least squares. However, in all of these examples, we have maintained that the model we were trying to fit was of the same linear form:

$$Y = X \beta + \epsilon$$

In this section, we discuss a further generalization, which this time will be a generalization on the form of the model above.




