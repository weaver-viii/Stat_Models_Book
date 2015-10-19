---
title: "Method Validation"
author: "Rebecca Barter"
output: html_document
---

# Method Validation

In statistics, the focus is typically on how to invent and compute statistical methods. However, how do we know if the method we are using suits the problem we are trying to solve? It is vital that we validate our methods, but there is so little emphasis on just how to do this. In this section we will discuss methods of validation and provide examples.

### Visualization

Visualization of data is an extremely useful way to mentally validate that a procedure is working well. If we can examine the data with our own eyes, we are much more likely to obtain an accurate understanding of the structure of the data and the results of models built on it. Summary statistics can be misleading since they condense all of the relevant information into a single number (or sometimes a couple of numbers). If we can visualize the data, for example by plotting residuals against a variable of interest or the fitted values, then we can get a feel for where the model works well and where it does not. This is just one common example, however, there are many other types of visualization for validation! 


### Prediction


If a model produces accurate predictions, then it is likely that the model is capturing some of the underlying mechanisms that exist in the data generation process. Although there exist a number of methods often considered to be "uninterpretable" or are known to be biased that provide better predictions than the more interpretable models. 

### Interpretability

If our model can be shown to have a meaningful interpretation, then we might be more inclined to accept its results. For example, if we have found that particular genes were significant using genetic data, and we could use domain biological knowledge to show that these genes were known to be biologically significant, then this is certainly a form of validating our results. Applied statisticians are encouraged to communicate with domain experts to identify whether their results are meaningful. An idea is to show the domain experts, not just your results, but also manipulated results (for example by selecting random gene names) and let them choose which one is more meaningful. This kind of approach can be used to ensure that your domain knowledge collaborators are not simply finding interpretations of your results because they tend to see what they want to see, or want to find results where there are none. <FONT COLOR="red">Write this in a nicer way!</FONT> 

### Replication of results

Perhaps one of the most important techniques for validation of results is to replicate the results in an independent setting. Unfortunately, there are many naive approaches to "replication" which can provide misleading confidence; primarily when the validation is performed using the same data that was used to generate the model or draw the conclusions. This is an example of *data snooping*. Another example is when we use a dataset to fish for interesting facts and then subsequently use the same dataset to prove these facts! This often leads to overfitting of models, high false positive rates and selective simulation results (choosing the simulation results that look the best, but are not necessarily representative).

How can we avoid data snooping? Probably the best is to have another lab or group replicate the experiment by generating completely new data and performing their own analysis. If they independently arrive at the same conclusions, then we have stronger evidence in favor of the validity our conclusions and models. Unfortunately, however, in most situations it is impractical to have others independently repeat our experiments. For this reason, it is good practice to use a test set of data points (or set aside a test set from our overall dataset) so that we can use this test data at a later date to validate the conclusions drawn and models developed from the remaining training data. In general, it is recommended that exploratory data analysis and confirmatory data analysis should be done separately (on separate datasets).



### Robustness 

Ideally our conclusions and methods should be robust to both the specific samples used as well as departures from model assumptions.

#### Robustness to sampling

One approach to identifying whether or not your results are nonsense is to perturb the data (for example by resampling and using various different random subsets of the data) and re-evaluate your results or re-fit your model. If you are obtaining equivalent results on the perturbed data, then this means that the results were not dependent on the specific set of observations used (this is a good thing!). 

#### Robustness to assumptions

There is also the question of how robust our conclusions are to the assumptions of the model used. For example, if the model assumes normality, how reasonable are our conclusions when our data is not *exactly* normal? For most commonly used methods, there exist a lot of work describing the effect of departures from the base assumptions. For example, it is known that $t$-tests are somewhat robust to the normality assumption (particularly for large sample sizes), whereas $F$-tests are not. It is thus important to assess not only whether your data satisfies the required assumptions of your analysis, but also, if there turns out to be slight deviations, to assess whether this has significantly affected the conclusions drawn. If the effects departures from the assumptions are not known for the method at hand, then it might be an idea to conduct some simulations.



