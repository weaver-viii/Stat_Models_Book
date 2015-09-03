---
title: "How to be an applied statistician"
author: "Rebecca Barter"
output: html_document
---

# How to be an applied statistician

In essence, this book is about how to be an applied statistician. More precisely, how to use the statistical methods you've picked up (be it through your degree or by necessity) in practice. Before embarking on a journey discussing how to implement statistical methods in reality, we will first spend some time discussing the skills that are necessary for one to be a successful applied statistician. In this section, we focus not on using statistical methods, but on the importance of thinking critically, communicating effectively and understanding the philosophy behind statistics.


## The importance of communication

1. The importance of communication people skills -- you want to be someone people can work with. Even if you don't have the skills they need, the will still come to you if they like you -- get involved. Most people (professors) learn by talking with people with experience.


## The human need to infer causation

Many of you have no doubt heard the much lauded phrase "correlation does not imply causation". It is a well-known fact that although we might wag our fingers and utter the phrase, those less statistically informed continue to mistake correlation for causation, some even abuse the human desire to infer causation. Our desire to infer causation begins from a young age; <FONT COLOR="red">give some example: touch something hot, it hurts -- you learn that touching something hot caused the pain even though don't understand the mechanism behind it. Rub plastic hand infer that the real hand is plastic....? Technically the evidence you have is only association but we believe causation</FONT>. 

Our past experiences lead us to believe that something causes something else. Moreover we continue to infer causality to satisfy our overwhelming desire to explain why how the world around us works. This notion is something that advertising agences are extremely aware of. For example, if we consider drug advertisements, most of them feature extraordinarily happy people, bright colours, and a passing description of what the drug is for. The idea behind these advertisements is that the human mind automatically infers causation from the association between the drug and happy people: the aim is to make people believe that the drug *causes* happiness (which if you listen closely to the speedily spoken side-effects at the end of the ad, is clearly the opposite of what the drug causes). The point is, humans have an innate need to explain associations through causation not just in statistics but also in real life.

### The egg-yolk study

Describe the egg yolk study and the reactions by the newspeople: "Sounds great right?!". What are the problems? 

### Causal Inference

So if correlation doesn't imply causation, what does? In the egg-yold study, we concluded that we probably didn't have enough evidence for causality, but how could we have concevably shown causation in a similar stufy? CAUSAL INFERENCE


## Sources of data

1. The importance of experimental design: people believe that when you have numbers, somehow the answer just pops up. 

1. Getting data from a database is kind of shit...






## Why should we shift away from "optimality"?

It is an unfortunate truth that statistics has become a field obsessed with optimality. Although this may seem like a positive direction in theoretical statistics (well why *wouldn't* we want to find the method with the lowest risk or the quickest run-time?), in the world of applied statistics, this push for optimality is resulting in a statistical philosophy that searches for the "biggest", "best" and "fastest" method, while forgoing interpretability. Moreover, in applied statistics, it is my belief that in the vast majority of situations there is no single optimal approach. By requiring optimality, even by defining optimality, we are constraining our freedom to solve the problem at hand. How would one define optimality in terms of an approach to an applied problem? It's not hard to identify good and bad apporaches, but how can we specify that one single approach is "optimal"? In my experience, I have never seen a data problem for which I feel I have found the "optimal" approach. 

Even in most realms of statisical optimization (perhaps with the exception of convex optimization), quite often the result is not a globally optimal approach, but rather a local one.


## Critical thinking

The need to move away from the search for an optimal solution may leave you asking what type of solutions should you seek? This is where judgement comes in. It may seem contradictory to many of you with a traditionally objective statistical education, but in reality many of the decisions made in applied statistical projects are brought about by thinking critically about the problem and making judgement calls.


1. The importance of critical thinking -- non-conventional problem. Making judgement calls (much harder to learn than mathematical skills).



## For the theoretically inclined

1. The "importance of the theorem" -- and how not every theorem is a good theorem!

That's not to say that I hate thoerems: to the contrary, I think that good theorems are immensely useful. The problem is that not all theorems are "good".


## Using statistics in real life

We have now arrived at the point where we talk about the increasing disconnect between applying statistics in real life and learning (in a class, for example) about statistical methods. This section is in essence a justification for the entire existence of this book. 

If you've ever been in an applied statistics class, the chances are high that it went something like this:

1. "Here's a new method! Let's learn how to derive it!"

1. "It's homework time! Let's use this specific method we just learned how to derive on this pretty, clean and unintetesring dataset and report a p-value!"

1. Repeat steps 1-2 with new methods until the semester ends at which point you will be tested on whether you know how to derive the specific method and use each method when prompted on simple examples.

If this was not your experience, congratulations; perhaps you learned something useful. The problem with the disturbingly common approach described above (ignoring, for the moment, issues with p-values) is that it bears virtually no connection to what it is really like to analyze data (also it's really, really boring). Firstly, in the real world, no one will be telling you what method to use and when. The general idea is to use what you know and then expand your search for a solution and learn new approaches. It is important to realize that within most classroom settings, you are deliberately given clean, doable problems. In reality, the data you encounter will most likely be messy, confusing and often the questions you ask may be impossible to answer using the data at hand. Statisticians need to be comfortable exploring data without guidelines; they need to gain "data wisdom".

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



The concept of data wisdom is based on the notion of *uncontrolled inspiration*: the approach by which we solve problems by first attempting a solution, then, if this solution is unsatisfactory, spending some time reading (or even better, talking to people) the relvent domain and statistical literature to draw inspiration for a new or modified approach, and repeating this process until we have a "satisfactory" solution (keeping in mind that there may be no such thing). Statisticians must be able to learn as they go along.

In this way, data analysis is like detective work: we first form a hypothesis and we then look for evidence in the data to support this hypothesis. Data analysis is also like peeling an onion. You peel one layer, and then another layer, and so on and so forth until you find what you're looking for. The only real difference between statistical data analysis and onions in that onions are guarenteed to have a finiite number of layers.

<FONT COLOR="red">Above are three nice analogies (uncontrolled inspiration, detective, onion) -- probably choose one<FONT>



