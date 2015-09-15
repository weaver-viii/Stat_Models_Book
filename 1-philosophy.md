---
title: "How to be an applied statistician"
author: "Rebecca Barter"
output:
  html_document:
    toc: yes
---

# How to be an applied statistician (this section is currently a smörgåsbord of wisdoms we wish to impart)

In essence, this book is about how to be an applied statistician. More precisely, how to use the statistical methods you've picked up (be it through your degree or by necessity) in practice and collaboration. Before embarking on a journey discussing how to implement your statistical skills in reality, we will first spend some time discussing the tools that are necessary for one to be a successful applied statistician. In this section, we focus not on using statistical methods, but on the importance of thinking critically, communicating effectively and understanding the philosophy behind statistics.


## The importance of communication

There is an unfortunate presumption that statisticians (along with mathematicians, computer scientists, etc) are terrible at communication. If you have great ideas or are doing inspirational work but lack the skills to adequately communicate it (not just to other statisticians, but also potential collaborators), then you will find it hard to make much of an impact. Modern mathematical and statitsical education has equipped a generation that lacks awareness on the importance of being communicative, approachable and even likable, particularly for those who wish to work with non-statistician collaborators. 


Not only do we devalue verbal communication skills, but we also underappreciate the importance of written communication skills. We focus so much on mastering the "language of mathematics" that we completely undermine our ability to portray our work to the outside world. Even our mathematical writing should have a narrative: words and imagery are just as important as equations, since your readers are much more likely to remember graphics and the overall story than theorems and formulae.


## Sources of data

A common problem among statisticians is finding good sources of data. The truth is that in most cases we are not the ones who actually go and collect the data, and as a result those without collaborators turn to databases. The problem with this approach is that there is a lack of transparency about data taken from databases. For example suppose a neuroscientist collected some fMRI (functional MRI; brain imaging) data. It is likely that there were a number of pre-processing steps that were undertaken throughout this data collection procedure. For instance, not every brain is alike, and the images need to be co-registered to an anatomical space and then spatially-normalized (squashed and stretched to match some image template). The images are also blurred to accommodate the heterogeneity in individual anatomy. Finally the images are then typically converted to a matrix of numbers. Clearly the process of translating the original image to numeric data involved a large number of assumptions. If a statistician simply obtained their fMRI data from a database, they would be ignorant to the assumptions made and the pre-processing steps taken, each of which are significant sources of noise in the data. All they see is a matrix of numbers (or many matrices of numbers) but they do not know how those numbers arose from the experiment was undertaken which leads to the possibility of misinterpretation.

As exemplified above, it is extremely important to understand the experimental design including all pre-processing steps when analyzing data. It is vital to understand what the numbers in your dataset mean and how they were obtained. Moreover, if the experimental design was poor, then the statistician will be able to take this knowledge into consideration for their analysis and will know to approach with caution and take the conclusions generated with a grain of salt. Numbers are not magical; they can be severely misleading if their origin is ignored. The upshot of this discussion is that we should be weary of analyses performed on data taken from sources without knowledge of the data collection process.




### Sources of randomness in the data

Whenever presented with a new dataset, it is good practice to begin by asking "where did the randomness come from?". Sometimes, the randomness is explicit; for example if it is from tossing a coin or simple random sampling, however, in most scenarios it is less black-and-white. Knowing the source of randomness can be extremely useful when the postulated model does not work.

It might help to carry out a thought experiment whereby you try to replicate the data collection process in order to identify possible sources of randomness, especially if you intend to postulate an observed dataset as realizations of random variables (as is assumed by most statistical models). For example, you might want to ask how you would go about collecting another set of data that share the same distribution as the data that you have already, or how would you replicate the experiment that generated the data that you have.

## Why should we shift away from "optimality"?

It is an unfortunate truth that statistics has become a field obsessed with optimality. Although this may seem like a positive direction in theoretical statistics (why *wouldn't* we want to find the method with the lowest risk or the quickest run-time?), in the world of applied statistics this push for optimality is resulting in a statistical philosophy that searches for the "biggest", "best" and "fastest" method, forgoing interpretability. Moreover, in the vast majority of situations in applied statistics there is no single optimal approach. By requiring optimality, even by defining optimality, we are constraining our freedom to solve the problem at hand. Firstly, how would one even define optimality in terms of an approach to an applied problem? It's not hard to identify good and bad approaches, but how can we specify that one single approach is "optimal"? In my experience, I have never seen a data problem for which I feel I have found the "optimal" approach. 

Even in most realms of theoretical statistical optimization (perhaps with the exception of convex optimization), quite often the result is not a globally optimal approach, but rather a local one.



## Critical thinking

The need to move away from the search for an optimal solution may understandably leave you asking what type of solutions you should seek. This is where judgement comes in: it may seem contradictory to many of you with a traditional objective statistical education, but in reality many of the decisions made in applied statistical projects are brought about by thinking critically about the problem and making judgement calls.

Many, if not most, applied statistical problems you will face in reality cannot necessarily be solved using straightforward traditional method. As an applied statistician, you will be faced with non-conventional problems which will require you to think critically and creatively, rather than automatically. Since no two problems are the same, the kind of skills required for true applied statistics will, for most people, be much harder to learn than formulaic mathematical skills. These skills are significantly more subjective and non-linear; traits that make many people uncomfortable (particularly those who would much rather prove theorems).

Although this book focuses on taking a step back from the theory when tackling applied problems, it certainly not true that theory is useless! Far from it; good theorems are extremely useful, and are indepsensible to the development and advancement of statistics. In the modern academic realm, however, there is such an expectation to produce new theorems, that a large amount of theorems presented in papers today encompass a disconnect between the assumptions upon which they are based and the methods.


## Using statistics in real life

We have now arrived at the point where we talk about the increasing disconnect between applying statistics in real life and learning (in a class, for example) about statistical methods. This section is in essence a justification for the entire existence of this book. 

If you've ever been in an applied statistics class, the chances are high that it went something like this:

1. "Here's a new method! Let's learn how to derive it!"

1. "It's homework time! Let's use this specific method we just learned how to derive on this pretty, clean and uninteresting dataset and report a p-value!"

1. Repeat steps 1-2 with new methods until the semester ends at which point you will be tested on whether you know how to derive the specific method and use each method when prompted on simple examples.

If this was not your experience, congratulations; perhaps you learned something useful. The problem with the disturbingly common approach described above (ignoring, for the moment, issues with p-values) is that it bears virtually no connection to what it is really like to analyze data (also this approach can be really, really boring). Firstly, in the real world, there is typically no one ti tell you what method to use and when. The general idea is to use what you know and then expand your search for a solution and learn new approaches. It is important to realize that within most classroom settings, you are deliberately given clean, doable problems. In reality, the data you encounter will most likely be messy, confusing and often the questions you ask may be impossible to answer using the data at hand. Statisticians need to be comfortable exploring data without guidelines; they need to gain "data wisdom".



### Data wisdom

Data wisdom is "the ability to combine domain, mathematical and methodological knowledge with experience, understanding, common sense, insight and good judgement in order to think critically about data and to make decisions based on data". The essence of data wisdom can be encompassed in the following set of (not necessarily sequential) questions that a data analyst is encouraged to ask before embarking on and during any data analysis project.

#### 1. Question

It is important to explicitly formulate questions to ask. For example, in neuroscience: how does the brain work? Or in banking: to which group of customers should a bank promote a new service? This is where the domain experts come in. They will know which questions are important and how to properly formulate them. Interaction with domain experts is absolutely necessary for the success of the data science project to come.

#### 2. Collection

What are the most relevant data to collect to answer the question we are interested in exploring? If the analyst did not collect the data themselves, they should be asking how, when and where the data were collected and what the data is measuring. More explicitly, who collected the data? Over what time period? At what locations? What instruments were used?

#### 3. Meaning

Not only must we understand where the data came from, but also what it really measures. For example, it is surprisingly important to ask questions such as what does a number mean in the data? Does it measure what it was supposed to measure? How could things go wrong? What statistical assumptions is one making by assuming that things didn't go wrong?

#### 4. Relevance

Is the data collected relevant to answering the question formulated at the birth of the project? If not, what other data should one collect?

#### 5. Translation

The analyst must be able to translate the question being asked into a statistical setting. For example, if there are multiple possible translations (such as a translation into a prediction problem or a translation into an inference problem regarding a statistical model), which is the most appropriate? 

#### 6. Comparability

The analyst should assess the ability of the data to satisfy the assumptions made by the translation chosen in the previous step. For example, are the data units are comparable (you don't want to combine apples and oranges)? Do they need to be normalized? 

#### 7. Visualization

Visualization is an incredibly useful tool for assessing the suitability of both the data and statistical translation in answering the question at hand. Assessing plots of the data can reveal patterns, inconsistencies and unexpected data points that may require further examination. 

#### 8. Randomness

It is extremely important to identify where the randomness in the data comes from (for example, was it from the sampling procedure or a random treatment assignment mechanism?). The source of randomness in the data must correspond to the randomness assumed by the statistical model. 

#### 9. Stability

The next step is to explore the validity of the conclusions drawn. For example, do different methods yield the same qualitative conclusions? Do perturbations (perhaps by adding noise or subsampling exchangeable data units) change the conclusions drawn? Such checks are vital in ensuring reproducibility. 

#### 10. Validation

Finally, the conclusions should be explicitly tested through validation methods, such as by testing the conclusions on other kinds of data.



The concept of data wisdom is based on the notion of *uncontrolled inspiration*: the approach by which we solve problems by first attempting a solution, then, if this solution is unsatisfactory, spending some time reading (or even better, talking to people) the relevant domain and statistical literature to draw inspiration for a new or modified approach, and repeating this process until we have a "satisfactory" solution (keeping in mind that there may be no such thing). Statisticians must be able to learn as they go along.

In this way, data analysis is like detective work: we first form a hypothesis and we then look for evidence in the data to support this hypothesis. Data analysis is also like peeling an onion. You peel one layer, and then another layer, and so on and so forth until you find what you're looking for. The only real difference between statistical data analysis and onions in that onions are guaranteed to have a finite number of layers.

<FONT COLOR="red">Above are three nice analogies (uncontrolled inspiration, detective, onion) -- probably choose one</FONT>



# Notes

The egg-yolk study, *egg yolk consumption and crotid plaque* was undertaken by Spence et al. (2012), and printed in the Elsevier journal of Atherosclerosis. 



