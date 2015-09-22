---
title: "Causal Inference"
author: "Rebecca Barter"
output:
  html_document:
    toc: yes
---


## The human need to infer causation

Many of you have no doubt heard the much lauded phrase "correlation does not imply causation". It is a well-known fact that although we continue to wag our fingers and utter the phrase, those less statistically informed (such as the media) continue to mistake correlation for causation. It is not hard to see why this fallacy is so common: there exists a fundamental human desire to infer causation as a result of our innate need to understand and explain the world in which we live. Our desire to draw causal conclusions begins from a young age; as a child you learn that you feel pain when you touch something hot. It is obvious that we don't understand the mechanism of why we felt pain when we touched something hot, but we inferred that it was the physical *touching* of the object that *caused* the pain. 

It is clear that our subconscious need to infer causation is an evolutionary advantage, since although we don't have the means to explain *how* the cause and effect occured, most of the time, our intuition is correct. The problem arises when we continue to draw this need to infer causation into the complex realm of science. As an example, consider drug advertisements. Most drug advertisements feature extraordinarily happy people, bright colors, and a passing description of what the drug is for. The idea behind these advertisements is that the human mind automatically infers causation from the association between the drug and happy people: the aim is to make people believe that the drug *causes* happiness (which if you pay attention to the speedily spoken side-effects at the end of the ad, is clearly the opposite of what the drug causes). 

### The egg-yolk study

Let's consider a Canadian study by Spence et al. on *egg yolk consumption and cartoid plaque* which aimed to identify whether the atherosclerosis burden (as a marker of arterial damage) was related to regular consumption of egg-yolk. The results of the study were touted in the media using phrases such as "A new study suggests eating egg yolks can accelerate heart disease almost as much as smoking", and "No yolk: [is] eating the whole egg as dangerous as smoking?".

The study was based on an 2831 consecutive patients attending vascular prevention clinics at University Hospital were asked to fill out a lifestyle questionnaire at the time of referral to the vascular prevention clinic. From the questionaire, the authors calculated for each patient pack-years of smoking (number of packs per day of cigarettes times the number of years of smoking) and egg-yolk years (number of egg yolks per week times the number of years consumed). For each patient, each plaque identified in the common, external and internal carotid artery on both sides was measured in a longitudinal view, in the plane in which it was biggest. The perimeter of each plaque was measured by tracing a cursor on a computer screen. Of the 2831 patients with data on egg yolk consumption, 1231 concented to use the data and had data on pack-years of smoking and carotid total plaque area. Data range checks were performed and data entry errors such as decimal errors were identified by scatterplots of age against each continuous variable. The author's interpretation of the results in their study is that the "data sugegsts a strong association between egg consumption and carotid plaque burden", and they conclude that their "findings suggest that regular consumption of egg yolk should be avoided by persons at risk of vardiovascular disease".



Can you see any issues with this study? Are the conclusions drawn reasonable?


There are in fact a number of issues:

1. The study is only considering people who had been referred to a particular vascular prevention clinic, yet the conclusion is making claims about the general population.

1. The study is observational AND they have no control group for comparison.

1. Do the measurements of plaque area seem reasonable? To me they seem very crude and are potentially a large source of error. This was not discussed at all in the media reports of the study.

1. "All patients with complete data for each analysis were included": there is no explination of how many patients had incomplete data, nor potential reasons for this. For example, what if people who did not consume egg-yolks or smoke simply chose not to fill out the questionaire.

1. Less than half of the original study population were actually used in the study (either as a result of lack of concent or missing data) -- we are offered no information on how those who were used in the study differ from those who were not.

1. They jumped to causation in their conclusion by suggesting that "regular consumption of egg yolk should be avoided by persons at risk of cardiovascular disease", which implies that consumption of egg yolk *causes* heart disease.

<FONT COLOR="red">Need to fill this out with a lot more information: make it clear why each point listed above is an issue.</FONT>




### Quality over quantity: is a large sample size always better?

Compare the relatively large egg-yolk study with the NZ filmmaker who put himself on a calorie controlled diate, but ensured that all of the calories came from high-fat junk food. Within 8 weeks he had gained an enormous amount of weight. This is a study with only one person (an incredibly small sample size), but which study would you believe more? Clearly sample size is not the only important thing; having a good design is *much* more important (quality over quantitiy).


# An introduction to causal inference

In the egg-yolk study described above, we discussed the many issues with the study and touched upon why the study didn't provide enough evidence to draw a causal conclusion. We now move on to describe the general principles for designing studies from which we could conceviebly draw causal conclusions. We will also introduce the Neyman-Rubin model for describing the causal inference framework.




## Observational studies vs randomized controlled experiments

It generally considered that the gold-standard for drawing causal inferences is to conduct a randomized, controlled experiment. The idea begind this notion is as follows: suppose that, from your population of interest, you randomly select $N$ people. You then randomly split your sample in half, so that $N/2$ are in the "treatment" group and $N/2$ are in the "control" group. Then, on average, the treatment and control groups would be statistically equivalent. In particular, if we apply an intervention (a treatment) to the treatment group, but not to the control group, then the only difference between these two groups is the fact that the treatment group recieved the treatment. Thus, any difference observed after applying the treatment must be a causal effect of the treatment itself (rather than a reflection of some intial underlying difference between the two groups).

In contrast, an observational study in one in which the experimenter simply observes the differences between subjects who have placed themselves in the treatment group and those who have not (this is in contrast to a randomized, controlled experiment, where the experimenter decided, albeit randomly, who recieved the treatment and who did not). An example is if we wanted to estimate the causal effect of smoking on cancer. It would certainly be unethical to randomly assign half of our sample of people to smoke and the other half not to be. A much more reasonable approach would be to compare people who are already smokers to people who are not smokers and compare the proportion of people in each group who develop lung cancer. What is wrong with this approach? The primary issue is that there may be underlying differences (for example genetic differences) between people who choose to smoke and people who do not, and these issues may cause those who smoke to also develop lung cancer. In general, the principal problem with observational studies is that there may be underlying differences between the treatment and control group, other than the treatment itself, which influences the response. Such variables are called *confounders*. The question to ask thus becomes: how can we be sure that any differences we observe between the treatment and the control group are due to the treatment rather than the confounding variables?


## Why randomize?



The most obvious argument for randomization is related to the issues discussed above with observatonal studies: to allow for balanced covariates (variables related to the response) between the treatment and control groups. However, there is a common misconception that randomization *ensures* balanced covariates. This is not necessarily true, and the likelihood of balanced covariates depends strongly on the randomization procedure undertaken. Consider, for example, the case where assignment to treatment is done by the flip of a coin: for each individual, if the coin flip shows heads then they are assigned to the treatment group, and if it shows tails they are assigned to the control group. Then, if there are $N$ individuals in the study, there are $2^N$ different possible ways to treatment assignment (each individual has two possible assignments: treatment or control). Moreover, several of these treatment assignment outcomes result in useless studies: it is entirely possible (though unlikely) that under this randomization procedure, everyone will be assigned to the treatment group. In which case it is impossible to make a causal inference about the effect of the treatment on the response (since you have no control group to compare to).

For another example, consider a study aimed at assessing the effectiveness of a type of heart surgery on 1,000 patients from a total of 12 different hospitals. Surely the outcome will vary from hospital to hospital. Thus even if the randomization is conducted such that half of the patients are in the treatment group and the other half are in the control group, there is the possibility that the treatment group will contain only patients from hospitals 1, 2, 4, 7, 8 and 12 and the control group contained only patients from hospitals 3, 5, 6, 9, 10 and 11. This mechanism has the property that we are never comparing patients from the same hospital, moreover, it is likely that each hospital is different, and thus that our treatment and control groups are not necessarily comparable. How could we conduct the randomization to increase the chance obtaining more comparable (more balanced) treatment and control groups? One way is to perform the randomization procedure individually *within* each hospital. This process is called *stratification*.

Thus it is certainly not the case that a randomization ensures that the study will be well-designed, but hopefully we can agree that randomization studies are more likely to lead to balanced covariates than observational studies. An analyst needs to think carefully about how to conduct the randomization to ensure that the control and treatment groups are equivalent. In the (rare) case that the covariates are perfectly balanced between the treatment and control groups, then to obtain an unbiased estimate the causal effect of the treatment, we could simply calculate:

(Average outcome of the treatment group) - (Average outcome of the control group)

In ideal situations, this is the only number we ever really need to look at. Why would we need to fit linear models or conduct hypothesis tests when the difference in average outcomes tells us everything we need to know. <FONT COLOR="red">Expand on this</FONT> 

Another point in favour of randomization of treatment assignment is that it makes the randomness in the problem explicit. More specifically, we know exactly how the randomness was created and it is easily replicable. As we will discuss when we introduce the Neyman-Rubin causal inference model, the only randomness in these types of problems comes from the assignment to treatment (in particular, the measured outcome is non-random). This is strikingly different to the traditional approach in which the outcome of interest is a random variable and the traditional approaches such as hypothesis testing and confidence intervals rest on properly defined probability distributions or sample spaces. This allows for more transparancy in the problem.


Randomization is certainly the gold-standard in inferring causation (although it is important not to accept a study as perfect just because the experiment was randomized. See the fruitfly experiment as an example).

Although the first people to truly emphasize the importance of randomization was R.A Fisher did so for experimental reasons. <FONT COLOR="red">a history of randomization</FONT>. These days, randomization has many uses beyond just experimental design. The modern approaches involve many randomized algorithms such as: compressed sensing, randomized algorithms for big data, Shannon's randomized channel code, random projections, non-parametric testing, etc.


## Can we infer causation from observational studies? 

As discussed above, using randomized experiments it's certainly possible to infer that a treatment *causes* a change in some outcome, however we haven't yet discussed whether it's even possible to infer causation from observational studies. You may have heard the phrase *"no causation without manipulation"*, however we will consider an example (smoking) that represents a counterexample.

* matching - consider all confounders (never know if you've observed *all* of them!)

* 

This is great news -- there are certainly many instances in which observational trials would be preferred to randomized trials.

## The Neyman-Rubin model

Everything we have discussed in this chapter so far has a philosophical and non-rigorous flavour to it. The Neyman-Rubin framework allows us to introduce rigour into the vague language of causal inference. The Neyman-Rubin model is named after Jerzy Neyman, who introduced the potential-outcomes framework for causality in 1923, and Donald Rubin who is a pioneer in extending this framework into the modern of causal inference in observational and randomized experiments.

The model is rooted in the notion that each individual in a two-arm study (control and treatment) has two *potential outcomes*. To make our descriptions transparant, we will embed our description of the Neyman-Rubin model within an example: suppose that we are interested in testing the effectiveness of a new drug on reducing the incidence of monthly headaches (our response). The patients assigned to the control group are not provided with the drug (perhaps they are provided with a placebo to make the study blinded, but we won't worry about this now), while the patients in the treatment group are provided with the drug and are told to take it daily. Each patient in each group then reports the number of headaches they experience in a month.

Let's think hypothetically about an individual patient (patient $i$). Suppose that when patient $i$ is assigned to the control group, they report experiencing 10 headaches. The notation we use is $Y\_{i0} = 10$, where the 0 index corresponds to "control". Alternatively, when patient $i$ is assigned to the treatment group, they report experiencing 8 headaches, and we write $Y\_{i1} = 8$, where the 1 index corresponds to "treatment". In reality, however, we can *only observe one* of these outcomes, since patient $i$ will be assigned *either* to the control group or to the treatment group, *but not both*. Hence we call $Y\_{i0}$ and $Y\_{i1}$ the *potential outcomes* for patient $i$. It is crucial to realize that both $Y\_{i0}$ and $Y\_{i1}$ are *fixed* values (i.e. they are not random!). The *observed* outcome (the outcome that we actually observe) for patient $i$ can be written as

$$Y\_i = (1 - T\_i) Y\_{i0} + T\_i Y\_{i1}$$

where $T\_i = 1$ if patient $i$ is assigned to the treatment group and $T_i = 0$ if patient $i$ is assigned to the control (recall that only one of these will occur). Note that if patient $i$ is assigned to the treatment group, we have

$$Y\_i = 0 \\times Y\_{i0} + 1 \\times Y\_{i1} = Y\_{i1}$$

whereas if patient $i$ is assigned to the control group, we have

$$Y\_i = 1 \\times Y\_{i0} + 0 \\times Y\_{i1} = Y\_{i0}$$

That is, we observe the potential outcome corresponding to which group patient $i$ is assigned.


### Where is the randomness in the Neyman-Rubin model?

When presented with a new formulation or model, it is good practice to ask "where does the randomness come from in this model?". In essence, we are asking "what assumptions are we making about the randomness by using this model?".

Recall that the potential outcomes, $Y\_{i0}$ and $Y\_{i1}$, are considered *fixed* (non-random) values. The observed outcome, $Y\_i$, however, is considered to be random. But given that $Y\_i$ is just a linear combination of the potential outcomes, where does the randomness come from? The answer is that the randomness comes from the treatment assignment variable, $T\_i$. That is, under this formulation, the only reason that we consider the observed outcome to be random is because the decision to place the patient in the treatment group or control group was random.


Thus the key difference between the Neyman-Rubin formulation and the traditional formulation is that in the Neyman-Rubin formulation a subject's outcome under each treatment is considered fixed, but the outcome that we observe is random (since it is random which treatment group the subject will be assigned to). In the traditional formulation, the response is considered to be random itself, but it is usually not explained where the randomness comes from. That is, the Neyman-Rubin model makes the randomness explicit!

<FONT COLOR="red">I need to explain what I mean by the "traditional formulation"</FONT>

Note that in the typical setting, we consider the [randomness](1-philosophy.html#random) to come from the sampling procedure where we draw our sample from the population. Although this randomness also exists when we use the Neyman-Rubin model, we are not using this source of randomness for our analysis. In the Neyman-Rubin model, the primary source of randomness comes from the random assignment to the treatment or control group.

### What is the population




### Can we extend the results to people not in the study?








## Conclusion

## Notes



In this chapter, we have just touched on the deep field of causal inference. For those who would like to delve further into the Neyman-Rubin approach to causal inference and learn more about the existing methods for conducting and analysing experimental and observational experiments, Imbens and Rubin's book, <a href="http://www.amazon.com/Causal-Inference-Statistics-Biomedical-Sciences/dp/0521885884">Causal Inference for Statistics, Social, and Biomedical Sciences: An Introduction</a>, is an excellent resource.

Further, it is worth noting that there are a number of alternative approaches to the language of causal inference, the most prominent of which is that of graphical models introduced by Judea Pearl.

[how]: 1-philosophy.html