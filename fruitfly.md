---
title: "The Fruitfly Project"
author: "Rebecca Barter"
output: html_document
---

# The *Drosophila* fruitfly project

Throughout this book we will embed many of the concepts we are discussing within a real-life project, which we will call "the fruitfly project". The fruitfly project is a genomics project that I have been involved in with several of my students and my collaborators at Lawrence Berkeley National Laboratory (LBNL). <FONT COLOR="red">How did I get involved in this project? How was I introduced to Erwin and co?</FONT>. 

As most do, the fruitfly project began with a question: "Is spatial information useful for making gene-gene interaction discoveries?". To expand and de-code this question for the non-biologists, what the group was really asking is whether it is possible to use stained images (more specifically, images of Drosophila embryos) to identify whether genes interact with one another. For an individual embryo, the staining process involves using dye to stain specific products that are produced when a particular gene is being expressed (these products are typically proteins). The upshot of the staining process is that areas within the embryo where the stain is visible correspond to physical locations within the embryo where the gene of interest is being expressed. 

With this question in mind, the group of biologists at LBNL had generated 1640 spatial gene expression images <FONT COLOR="red">I need an example image!</FONT> representing 755 genes for early *Drosophila* embryos. In each image, the gene of interest is being expressed at the locations within the embryo where the blue stain is visible. Each processed expression image can be represented by a numeric vector with 405 entries, one for each of the 405 pixels inside the ellipse template.

<FONT COLOR="red"> So the biologists had the data and the question but no idea how to answer it? They then invited Bin and co. to offer statistical insights whereby after much trial and error, we arrived at the non-negative matrix factorization approach. This approach allowed us to derive 21 principal patterns (PPs) using which we constructed spatially local correlation networks for all patterned transcroption factors during early Drosophila development



1. What the project is all about? What is our question? Bring back to "data wisdom".

1. How did the LBNL group get around to asking the question of "can spatial information be used to make gene-gene interaction discoveries?"

1. How did you get involved in the project?

1. How was the data collected?

1. What had the LBNL group tried (in terms of analysis) before Bin was brought in?

1. What was the process that lead to using the non-negative matrix factorization? Was that the first approach? Did you first try things that didn't work?

1. Could you explain clearly how we can use the spatial data to identify whether genes interact with one another?

