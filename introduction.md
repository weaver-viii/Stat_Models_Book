---
layout: post
title: "Introduction"
header-includes: \usepackage{graphicx}
---

# Introduction: Why study applied statistics?

Advances in information technology have made the process of collecting huge amounts of data not only possible, but also extremely easy. The massive quantities of data available in the modern era enable scientists, social scientists, government agencies and companies to ask and answer questions in order to understand the physical world, make pubic policies, and improve productivity. For example, data can now be used to provide answers to an extremely broad array of questions such as "is there a link between alcohol and birth defects?" and "what is the chance that Hilary Clinton will win the next election?". Statistics is an indispensable tool in the process of extracting meaningful answers to the questions being asked based on the collected data. In fact, statistics is more than an analysis tool: statistical experimental design provides principles and methods for ensuring that the data is collected in such a way that facilitates the investigators' ability to effectively address the questions asked.

The tools provided by statistics were first developed as instruments used to solve real-world problems such as demographic census collection and agricultural experiments. As the types of data being collected grew more intricate, detailed and complex, so too did the accompanying statistical methods and the assumptions upon which they are based. Consequently, analyzing a dataset with no real-world knowledge of how the data was collected or what the numbers represent is the equivalent to <FONT COLOR="red">some nice analogy</FONT>. For example, in the famous *iris* dataset, R.A. Fisher (who was not only a statistician, but also an evolutionary biologist and a geneticist) measured the length and width of both the petal and sepal of a number of iris flowers. His domain knowledge of flowers led him to take these measurements but not the roots, stem thickness or chemical makeup of each flower. <FONT COLOR="red">come up with a better example</FONT>.

To ensure that useful questions are asked and valid answers are drawn, domain experts (scientists, for example) should always be in the picture for statisticians to strengthen their domain knowledge by asking questions and brainstorming. Data does not stand alone: it must be viewed with a strong consideration towards the questions being asked, the scientific background of the problem and the data collection process.

This idea can be conveyed through the concept of *data wisdom*. In *Data Wisdom for Data Science*, a piece I wrote for the big data website, *Operational Database Management Systems*, I describe data wisdom as "the ability to combine domain, mathematical and methodological knowledge with experience, understanding, common sense, insight and good judgement in order to think critically about data and to make decisions based on data". The essence of data wisdom can be encompassed in the following set of (not necessarily sequential) questions that a data analyst is encouraged to ask before embarking on and during any data analysis project.

### 1. Question

It is important to explicitly formulate questions to ask. For example, in neuroscience: how does the brain work? Or in banking: to which group of customers should a bank promote a new service? This is where the domain experts come in. They will know which questions are important and how to properly formulate them. Interaction with domain experts is absolutely necessary for the success of the data science project to come.

### 2. Collection

What are the most relevant data to collect to answer the question we are interested in exploring? If the analyst did not collect the data themselves, they should be asking how, when and where the data were collected and what the data is measuring. More explicitly, who collected the data? Over what time period? At what locations? What instruments were used?

### 3. Meaning

Not only must we understand where the data came from, but also what it really measures. For example, it is surprisingly important to ask questions such as what does a number mean in the data? Does it measure what it was supposed to measure? How could things go wrong? What statistical assumptions is one making by assuming that things didn't go wrong?

### 4. Relevance

Is the data collected relevant to answering the question formulated at the birth of the project? If not, what other data should one collect?

### 5. Translation

The analyst must be able to translate the question being asked into a statistical setting. For example, if there are multiple possible translations (such as a translation into a prediction problem or a translation into an inference problem regarding a statistical model), which is the most appropriate? 

### 6. Comparability

The analyst should assess the ability of the data to satisfy the assumptions made by the translation chosen in the previous step. For example, are the data units are comparable (you don't want to combine apples and oranges)? Do they need to be normalized? 

### 7. Visualization

Visualization is an incredibly useful tool for assessing the suitability of both the data and statistical translation in answering the question at hand. Assessing plots of the data can reveal patterns, inconsistencies and unexpected data points that may require further examination. 

### 8. Randomness

It is extremely important to identify where the randomness in the data comes from (for example, was it from the sampling procedure or a random treatment assignment mechanism?). The source of randomness in the data must correspond to the randomness assumed by the statistical model. 

### 9. Stability

The next step is to explore the validity of the conclusions drawn. For example, do different methods yield the same qualitative conclusions? Do perturbations (perhaps by adding noise or subsampling exchangeable data units) change the conclusions drawn? Such checks are vital in ensuring reproducibility. 

### 10. Validation

Finally, the conclusions should be explicitly tested through validation methods, such as by testing the conclusions on other kinds of data.


# What to expect from this book

The primary purpose of this book is to demonstrate what it is like to use statistics in the real world and to how to work together with people who have domain expertise in order to do data analysis with the aim of answering questions outside statistics. As a reader of this book, you will gain insight into the many steps involved in the iterative process of extracting information from data for the purposes of prediction and interpretation. In particular, this book will provide the necessary background to cover basic useful statistical methods in practice and will highlight how judgement and common sense should be used in the process of data analysis and when arriving at valid conclusions. 

Statistical techniques will be introduced through a first-principles approach with a focus on developing intuition, and the reader will learn how to develop appropriate techniques in unfamiliar situations. A number of data analysis labs are provided which are designed to help the reader put into practice the techniques and intuition conveyed throughout the book.

These principles will be demonstrated in the context of an ongoing collaborative genomic *Drasophila* fruitfly project I am working on with several of my students in statistics and my colleagues in the biological sciences. 

# Who should read this book

The reader of this book is assumed to be familiar with concepts typically introduced in upper division mathematical statistics and probability courses. Further, to get the most out of the labs, the reader is encouraged to have familiarity with writing functions, manipulating and cleaning data and creating graphics in a programming language such as R.

This book is ideal for those who are looking to learn how to connect statistics to the real world, not those who are seeking the "optimal" method for broad classes of problems. If you are familiar with statistical concepts but would like to further develop your ability to use common sense, judgement and critical thinking in statistics, then this book is for you.
