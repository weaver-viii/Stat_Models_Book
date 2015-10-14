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

