---
title: "Cross validation"
author: "Rebecca Barter"
output: html_document
---

# Cross validation 



Cross validation (CV) is an extremely useful technique initially developed for use in model validation, but with extremely broad uses. CV is a generalization of the idea of witholding a test set from analysis for the purpose of validating results using independent data. Let's consider an example of using CV to assess prediction performance.

1. Divide the samples into $K$ equal (or as equal as possible) cross-validation folds (subsets of the data) at random.

2. For each fold, $k = 1, 2, ..., K$, the set of observations in the $k$th fold is called the *test set*, while the remaining data is called the *training set*.

    a) Perform the analysis or fit the model using only the observations in the training set.
      
    b) Validate the analysis or assess the model fit (e.g. by calcualting prediction error) using the observations from the witheld test set.
  
3. Calculate the average or sum of the values calculated (such as the prediction errors) over each test set fold.



This procedure provides the user with an empirical estimate of their prediction error.




## Bias



