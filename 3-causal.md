---
title: "Causal Inference"
author: "Rebecca Barter"
output: html_document
---

# An introduction to causal inference

Recall the egg-yolk study from the [how to be an applied statistician][how] section in which we discussed the many issues with the study and touched upon why the study didn't provide enough evidence to draw a causal conclusion. In this section, we describe the general principles for designing studies from which we could conceviebly draw causal conclusions. We will also introduce the Neyman-Rubin model for describing the causal inference framework.


[how]: 1-philosophy.html

## Observational studies vs randomized controlled experiments

It generally considered that the gold-standard for drawing causal inferences is to conduct a randomized, controlled experiment. The idea begind this notion is as follows: suppose that, from your population of interest, you randomly select $N$ people. You then randomly split your sample in half, so that $N/2$ are in the "treatment" group and $N/2$ are in the "control" group. Then, on average, the treatment and control groups would be statistically equivalent. In particular, if we apply an intervention (a treatment) to the treatment group, but not to the control group, then the only difference between these two groups is the fact that the treatment group recieved the treatment. Thus, any difference observed after applying the treatment must be a causal effect of the treatment itself (rather than a reflection of some intial underlying difference between the two groups).

In contrast, an observational study in one in which the experimenter simply observes the differences between subjects who have placed themselves in the treatment group and those who have not (this is in contrast to a randomized, controlled experiment, where the experimenter decided, albeit randomly, who recieved the treatment and who did not). An example is if we wanted to estimate the causal effect of smoking on cancer. It would certainly be unethical to randomly assign half of our sample of people to smoke and the other half not to be. A much more reasonable approach would be to compare people who are already smokers to people who are not smokers and compare the proportion of people in each group who develop lung cancer. What is wrong with this approach? The primary issue is that there may be underlying differences (for example genetic differences) between people who choose to smoke and people who do not, and these issues may cause those who smoke to also develop lung cancer. In general, the principal problem with observational studies is that there may be underlying differences between the treatment and control group, other than the treatment itself, which influences the response. Such variables are called *confounders*. The question to ask thus becomes: how can we be sure that any differences we observe between the treatment and the control group are due to the treatment rather than the confounding variables?


## Why randomize?

The most obvious argument for randomization is related to the issues discussed above with observatonal studies: to allow for balanced covariates (variables related to the response) between the treatment and control groups. However, there is a common misconception that randomization *ensures* balanced covariates. This is not necessarily true, and the likelihood of balanced covariates depends strongly on the randomization procedure undertaken. Consider, for example, the case where assignment to treatment is done by the flip of a coin: for each individual, if the coin flip shows heads then they are assigned to the treatment group, and if it shows tails they are assigned to the control group. Then, if there are $N$ individuals in the study, there are $2^N$ different possible ways to treatment assignment (each individual has two possible assignments: treatment or control). Moreover, several of these treatment assignment outcomes result in useless studies: it is entirely possible (though unlikely) that under this randomization procedure, everyone will be assigned to the treatment group. In which case it is impossible to make a causal inference about the effect of the treatment on the response (since you have no control group to compare to).

For another example, consider a study aimed at assessing the effectiveness of a type of heart surgery on 1,000 patients from a total of 12 different hospitals. Surely the outcome will vary from hospital to hospital. Thus even if the randomization is conducted such that half of the patients are in the treatment group and the other half are in the control group, there is the possibility that the treatment group will contain only patients from hospitals 1, 2, 4, 7, 8 and 12 and the control group contained only patients from hospitals 3, 5, 6, 9, 10 and 11. This mechanism has the property that we are never comparing patients from the same hospital, moreover, it is likely that each hospital is different, and thus that our treatment and control groups are not necessarily comparable. How could we conduct the randomization to increase the chance obtaining more comparable (more balanced) treatment and control groups? One way is to perform the randomization procedure individually *within* each hospital. This process is called *stratification*.

Thus it is certainly not the case that a randomization ensures that the study will be well-designed, but hopefully we can agree that randomization studies are more likely to lead to balanced covariates than observational studies. An analyst needs to think carefully about how to conduct the randomization to ensure that the control and treatment groups are equivalent. In the (rare) case that the covariates are perfectly balanced between the treatment and control groups, then to obtain an unbiased estimate the causal effect of the treatment, we could simply calculate:

(Average outcome of the treatment group) - (Average outcome of the control group)

In ideal situations, this is the only number we ever really need to look at. Why would we need to fit linear models or conduct hypothesis tests when the difference in average outcomes tells us everything we need to know. <FONT COLOR="red">Expand on this</FONT> 

Another point in favour of randomization of treatment assignment is that it makes the randomness in the problem explicit. As we will discuss when we introduce the Neyman-Rubin causal inference model, the only randomness in these types of problems comes from the assignment to treatment (in particular, the measured outcome is non-random). This is strikingly different to the traditional approach in which the outcome of interest is a random variable and the traditional approaches such as hypothesis testing and confidence intervals rest on properly defined probability distributions or sample spaces. This allows for more transparancy in the problem.


## Can we infer causation from observational studies? 

As discussed above, using randomized experiments it's certainly possible to infer that a treatment *causes* a change in some outcome, however we haven't yet discussed whether it's even possible to infer causation from observational studies. You may have heard the phrase *"no causation without manipulation"*, however we will consider an example (smoking) that represents a counterexample.

* matching - consider all confounders (never know if you've observed *all* of them!)

* 

This is great news -- there are certainly many instances in which observational trials would be preferred to randomized trials.

## The Neyman-Rubin model

Everything we have discussed in this chapter so far has a philosophical and non-rigorous flavour to it. The Neyman-Rubin framework represents the need to introduce rigour into the vague language of causal inference. The Neyman-Rubin model is named after Jerzy Neyman, who introduced the potential-outcomes framework for causality in 1923 and Donald Rubin who was a pioneer in extending the framework into the modern realm of causal inference in observational and randomized experiments.


## Notes

There are a number of alternative approaches to the language of causal inference, the most prominent of which is that introduced by Judea Pearl.

In this chapter, we have just touched on the deep field of causal inference. For those who would like to delve further into the Neyman-Rubin approach to causal inference and learn more about the existing methods for conducting and analysing experimental and observational experiments, Imbens and Rubin's book, <a href="http://www.amazon.com/Causal-Inference-Statistics-Biomedical-Sciences/dp/0521885884">Causal Inference for Statistics, Social, and Biomedical Sciences: An Introduction</a>, is an excellent resource.


