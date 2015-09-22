---
title: "Linear models"
author: "Rebecca Barter"
output: html_document
---

# Linear models


### Regression towards the mean (the regression fallacy)

Consider students in a class where the assessment includes a midterm in the middle of the semester and a final exam at the end of the semester. If we look at the students who do really well in the midterm and then examine their final exam grade. With a very high probability, although these students will still do very well in the final exam, they will do worse in the final exam than in the midterm. Similarly, if we look at the students who did not do well in the midterm, then there is a very high chance that they will do better in the final exam than they did in the final exam.

We can propose many plausable mechanisms for why this may happen: for example, the students who did very well in the midterm felt that they could relax and didn't study as hard for the final exam as they otherwise might have if they were dissapointed with their grade. Similarly, the students who performed poorly in the midterm were worried about their grade and studied very hard for the final exam with the end result that they did better on the final exam than they did on the midterm.



<img src="http://www.math.uah.edu/stat/sample/SampleRegressionMean.png" alt="QQ plot log-transformed gap data" style="width:300px;height:300px;">

For example, we tend to experience "football shaped" scatterplots, such as that presented above. We see that all of the points are clustered around the mean (the blue regression line), but the observations which are extreme in both axes tend to be closer to the regression line.

It is important not to confuse a difference in the test scores with regression to the mean.


## Regularization


## Lasso

The Least Absolute Shrinkage and Selection Operator (LASSO) was introduced by Robert Tibshirani in 1996







