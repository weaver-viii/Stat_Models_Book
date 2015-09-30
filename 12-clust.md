---
title: "Clustering"
author: "Rebecca Barter"
output: html_document
---

# Clustering

The basic idea behind clustering is that we want to find groups of similar observations in our dataset. The observations within these groups should "cluster together" more than with observations from other groups. The question is, how do we find these groups given that we have no idea even of the number of groups that exist in the dataset? First, we need to define some "distance" metric to describe how "far" different observations are from one another. Clustering is often called *unsupervised learning*: unsupervised in the sense that we don't pre-define the groups so that our algorithms are not being "supervised" by these pre-existing classes, they much find their own! We will focus on some of the most common approaches to clustering such as K-means, PAM, hierarchical clustering, spectral clustering and the EM algorithm.

Clustering is very much related to network analysis which are extremely prominant in areas such as social network analysis: there are multitudes of researchers whose sole purpose in their professional or academic life (perhaps even in their entire life) is to find communities within social networks, such as those in the images below.


<img src="network.png" alt="Minard" style="width:500px;height:700px;">



## K-means


One of the most intuitive clustering algorithms is the K-means algorithm (often called the Lloyd-Max algorithm). The K-means algorithm finds $k\_c$ clusters (this number must be specified by the user) by first choosing $k\_c$ data points at random as the initial cluster centers ("centroids") and subsequently assigning each data point to the cluster whose center it is closest to. Each centroid is then replaced by the mean of all data points assigned to that cluster, and the process is iterated until no data point is reassigned to a different cluster. The end result is a partition of the index set $\\{1, ..., n\\}$ into clusters $I\_1, ..., I\_{k\_c}$ and cluster centers (or centroids), $C\_1, ..., C\_{k\_c}$ that minimize the following global objective function (for any distance metric, $d$):

$$(C\_1, ..., C\_{k\_c}) = \underset{(C\_1, ..., C\_{k\_c})}{\text{argmax}} \sum\_{i=1}^{k\_c} \sum\_{x\_j : j \in I\_i} d(x\_j, C\_i)$$

For example, if our distance metric is the regular $L^2$ norm, then this is simply

$$(C\_1, ..., C\_{k\_c}) = \underset{(C\_1, ..., C\_{k\_c})}{\text{argmax}} \sum\_{i=1}^{k\_c} \sum\_{x\_j : j \in I\_i} (x\_j - C\_i)^2$$

<img src="kmeans.png" alt="K-means" style="width:500px;height:400px;">

The specific K-means algorithm can be described as follows:

1. **The initial step**: Specify $k\_c$ initial cluster/group centers (for example by randomly selecting $k\_c$ points without replacement from our $n$ observations). Denote these centers as
$$C\_1^0, ..., C\_{k\_c}^0$$
Then generate a partition of our observations (which we will identify by the index set $\\{1, ..., n\\}$) into non-overlapping subsets of the index set
$$I\_1^0, ..., I\_{k\_c}^0$$
based on the following assignment rule: observation $i$ belongs to $I\_k^0$ iff $i$ is closer to $C\_k^0$ than all other centers in $d$-distance.

1. Determine new centers
$$C\_1^1, ..., C\_{k\_c}^1$$
by find the point such that the sum of its distances to all other points in the corresponding clusters $I^0\_0, ..., I^0\_{k\_c}$ is minimized. If $d$ is the usual Euclidean $L^2$-norm, then this corresponds to taking the mean of the points in a cluster to find the new center. If $d$ is the $L^1$ norm, then we are finding the median point.
Partition the observations into new clusters
$$I\_0^1, ..., I\_{k\_c}^1$$
by the assignment rule from the previous point.

1. Repeat the above step by finding the centers of our new clusters, and then reclustering based on assignment rule for the new cluster centers.

1. Stop the process if two successive iterations lead to the same partition or when a stopping criterion is satisfied (for example, the decrease in within-groups variance falls below a certain threshold, or a preset maximum number of iterations is achieved).






As an aside, suppose that we want to find $k$ unique clusters. We can re-write K-means in a more modern setting as follows

$$\hat{\mu} = \underset{M \in \mathcal{R}(n, k)}{\text{arg}~\text{min}} \\| X - M\\|\_F^2$$

where $\\| \cdot \\|\_F^2$ is the *Frobenius norm*, (where for an $m \times n$ matrix $A$, $\\|A\\|\_F = \sqrt{\sum\_{i=1}^m \sum\_{j=1}^n |a\_{ij}|^2}$) and $\mathcal{R}(n, k)$ is the set of matrices with $k$ columns and $n$ rows, but only $k$ of these rows are *unique*. The unique rows correspond to the $k$ centroid in the K-means objective function. This formulation allows for direct comparison with other optimization methods such as PCA. Note that
$$\underset{M \in \mathcal{R}(n,k)}{\min} \\|X - M\\|\_F^2 = \underset{\\{m\_1, ..., m\_k\\} \subset \mathcal{R}^k} \sum\_i \underset{g}{\min} \\|x\_i - m\_g \\|\_2^2$$


To understand what the above formulation is saying: note that K-means aims to minimize the overall distance between the data and the centroids.





## PAM

The Partitioning Around Medoids (PAM) clustering method (often called the K-medoids algorithm) is a modified version of K-means whereby it attempts to minimize the global sum of squares (as in K-means with the Euclidean $L^2$ metric), but subject to the constraint that the centers $C\_1, ... C\_{k\_c}$ must be an actual data point (rather than just the average of data points, which may not itself be a data point). 

One way to minimize this constrained objective function is to modify the K-means or Lloyd-Max algorithm by first finding the mean location within the group (as per usual), and then replacing each center by the data point closest to it. 


## Hierarchical clustering

To conduct hierarchical clustering, we begin with each observation being in its own lonely cluster. For example, we have $\\{1\\}, \\{2\\}, \\{3\\}, \\{4\\}$. Next, we find the two points that are the closest, and combine their clusters. So that, if the first an the second observations were the "closest" pair of points, our new partitioning is $\\{1, 2\\}, \\{3\\}, \\{4\\}$. We now have $n-1$ points to cluster. Let's repeat this process: find the next two closest points and aggregate their clusters. If the next smallest pairwise distance was between observations $1$ and $3$, then our new partitioning would be $\\{1, 2, 3\\}, \\{4\\}$, but if it were between observations $3$ and $4$, then our new partitioning would be $\\{1, 2\\}, \\{3, 4\\}$.

The idea is to continue this process until all observations are in a single cluster (which would require only one more step in the example above). This process generates a hierarchical clustering tree: at each level, we have a different number of clusters. We can choose to cut the tree at any point to get different numbers of clusters, and the number of custers increases as the cut-point approaches the initial point.

This hierarchical representation is particular nice since it generates *many* possible clusters: the result is a set of $n$ nested partitions containig anywhere from $1$ to $n$ clusters.



## Spectral clustering

Recall our discussion on PCA. Luckily for you, spectral clustering, though it might seem scary at first, is essentially just PCA (the "spectrum" of a matrix refers to its eigenvalues) combined with K-means. The method actualy is actually very prominantly used in network analysis. To make life easier below, we will begin with some network notation. A network (or "graph"), $G$ consists of a *vertex set* $V$ (for example, each vertex might correspond to a person or a gene) and an *edge set*, $E$, which contains the set of edges between pairs of vertices (for example, there might be an edge between individual $1$ and $7$ because they are best friends, but there might not be an edge between individual $1$ and $3$ if they severely dislike one another). We often use the notation
$$G = (V, E)$$
to describe a network $G$. In community detection, what we're really trying to do is to find $k$ communities (subsets) of nodes (observations) in the graph such that the nodes within each cluster are more highly connected to one another than to the nodes in other clusters. We can define our a set of all possible $k$ communities, $\mathcal{C}\_k$ to be
$$\mathcal{C}\_k = \left\\{ (C\_1, C\_2, ..., C\_k) : \forall i \neq j, ~~ C\_i \cap C\_j = \emptyset, ~ ~ \bigcup\_i C\_i = V \right\\}$$
which can be read as *"the $k$ disjoint communities $C\_1, C\_2, ..., C\_k$ that together, contain all of the nodes in $V$"*. But we still haven't described how to come up with these communities! One formulation is to find the $k$ communities which are defined such that they maximize some partition quality measure (a function that tells us how good out communities are at partitioning the data), $f\_G$:

$$\underset{(C\_1, ..., C\_k) \in \mathcal{C}_k}{\text{arg}~\text{max}}f\_G(C\_1, ..., C\_k)$$

So we've now formulated the problem, but how do we find a suitable measure $f\_G$, especially since in most situations, this problem is NP-hard! We'll now describe the spectral clustering approach to this problem, and show that it is essentially PCA combined with K-means.

First, we need to translate the network into a matrix: let's use the symmetric *adjacency matrix*, $W \in \mathbb{R}^{n \times n}$, whose entries 
$$W\_{ij} = W\_{ji} = \begin{cases} 1 & \text{if } (i, j) \in E \\\ 0 & \text{otherwise} \end{cases}$$ 
represent whether or not there exists an edge between observation $i$ and observation $j$ in the network. We can also define the *diagonal degree matrix*, $ D \in \mathbb{R}^{n \times }$, whose diagonal entries specify the degree (number of incident edges or connections) of each node:
$$D\_{ii} = \sum\_j W\_{ij}$$


You might ask, why would we want to use an adjacency matrix? Surely we can define a more informative matrix, for example, instead of simply defining $W\_{ij}$ to be $1$ when there is an edge between observations $i$ and $j$, why not let the value in the matrix reflect the *strength* of the connection? For example, to link back to our discussions on Kernel functions, $K\_h$ (an example might be the Gaussian density function), we could define the alternative matrix

$$W\_{ij} = K\_h(X\_i - X\_j)$$

where $X\_i \in \mathbb{R}^p$ is a vector of the $p$ measured variables for observation $i$. There exist nice thoeretical properties of such formulations, but in the discussion that follow we will proceed with a general adjacency matrix, $W$, defined in any way you like (if you prefer the simple $0-1$ adjacency matrix, that's just fine!). 

The next useful object is the *Laplacian matrix*, typically defined by the symmetric graph Laplacian:
$$L\_0 = D - W$$

However, just like our adjacency matrix, there are many different possible definitions of the Laplacian matrix, each of which normalize by degree (number of connections) in a slightly different way. For example, the *random walk Laplacian*:
$$L\_{rw} = I - D^{-1}W,$$

the *normalized symmetric graph Laplacian*:
$$L\_N = 1 - D^{-1/2}WD^{-1/2}$$

and the Laplacian that we will use which is a special version of the normalized symmetric graph Laplacian
$${\bf L = D^{-1/2}WD^{-1/2}}$$

Note that performing eigenvalue decomposition of $L$ and $L\_N$ yield the same results! So why are we even interested in the Laplacian matrix? It turns out that the second eigenvalue of the normalized Laplacian (both the standard version and our version of it) is closely connected to the conductance of a graph (a measure of how "well-knit" the graph is) via Cheeger's inequality. Conductance controls how fast a random walk on the graph converges to a uniform distribution, but we won't worry too much about that here.

By this point you're probably sitting there wondering if we're ever going to get to spectral clustering itself. The answer is: yes, we are, and here it is: suppose that we want to find $k$ clusters of observations:

> Input: Adjacency matrix $W \in \\{0, 1\\}^{n \times n}$, number of clusters $k$

> 1. Find the eigenvectors $X\_1, ..., X\_k \in \mathbb{R}^n$ corresponding to the $k$ largest eigenvalues of the Laplacian matrix $L$. $L$ is symmetric, so we can choose these eigenvectors to be orthogonal.

> 1. Form the eigenvector matrix $X = [X\_1, ..., X\_k] \in \mathbb{R}^{n \times k}$ whose columns correspond to the eigenvectors.

> 1. Treating each of the $n$ rows in $X$ as a point in $\mathbb{R}^k$, perform K-means. This creates $k$ non-overlapping sets $A\_1, ..., A\_k$ whose union is $1, ..., n$.

> Output: $A\_1, ..., A\_k$. This means that node $i$ is assigned to cluster $g$ is the $i$th row of $X$ is assigned to $A\_g$ in step 2.



So really all spectral clustering does is a) PCA on the Laplacian matrix for dimensionality reduction, followed by b) K-means for clustering. So many modern methods that seem complex and fancy are really just concatenating more commonly used, "simpler" methods. It is much easier to build on the work of others than to start from scratch. In actuality, if all reasearchers ever did was come up with new novel methods and had no interest in extending and combining existing methods, we wouldn't get very far!

So given the above discussion, why did we do PCA and K-means? Why not do PCA and hierarchical clustering? Honestly, theres probably not a particularly good reason... we could certainly instead do hierarchical clustering instead of K-means, which is just the convention!

<img src="spectral.png" alt="Minard" style="width:500px;height:300px;">


Spectral clustering is adaptive to the intrinsic sturcture of the problem; it works well under a variety of different situations. 


### Spectral clustering for directed graphs

The above method does not make any mention of "directed" graphs. In particular, it makes no assumption on the direction of a relationship or connection between two nodes. Consider, for example, the Enron dataset. We can code this example as a network, where the 154 nodes are the employees of the company and the edges are the email communications between the employees. However, a single email is not two-directional: it is sent from one person and received by another. So rather than defining an edge by the presence of an email communication, we could define directed edges, whereby an edge points from employee $i$ to employee $j$ if an email was send from employee $i$ to employee $j$. In this way, the similarity matrix is no longer symmetric (since employee $j$ may not have send the same number of emails to employee $i$ as employee $i$ sent to employee $j$), and we can define it by:
$$A\_{ij} = \text{the number of emails send from employee $i$ to employee $j$}$$
Similarly, the Laplacian matrix is asymmetric. Standard spectral clustering would produce complex (in the $i = \sqrt{-1}$ sense) eigenvectors on such a matrix, and existing works symmetrize the matrix and subsequently proceed by the usual spectral clustering approach. 

The method that we will describe below proposes and examines a specral clustering algorithm that replaces the eigen-decomposition with **singular value decomposition**, which can be performed on asymmetric matrices to produce left and right eigenvectors (in symmetric matrices, the left and right eigenvectos are equal and correspond to the usual eigenvectors). 

The adjacency matrix, $W \in \\{0, 1\\}^{n \times n}$ for a directed graph is *asymmetric*:
$$W\_{ij} = \begin{cases} 1 & \text{ if } i \rightarrow j\\\ 0 & \text{ otherwise} \end{cases}$$

so that an entry in the adjacency matrix exists if there is an edge directed *from* $i$ to $j$ but if there is no edge from $j$ to $i$ (even if there is an edge from $i$ to $j$), then $A\_{ji} = 0$. Alternative, we could use a weighted adjacency matrix (where the entries are not simply 0 or 1, but they are 0 in the absence of an edge and nonzero in the presence of an edge), where if $i \rightarrow j$, we have $W\_{ij} > 0$. Let's suppose for simplicity, however, that we have the standard $0-1$ adjacency matrix. We can define the number of "parents" (or in-links) of node $i$ as

$$P\_{ii} = \sum\_k W\_{ki} = \sum\_{k} 1\\{k \rightarrow i\\}$$

and the number of "offspring" (or out-links) of node $i$ to be
$$O\_{ii} = \sum\_k W\_{ik} = \sum\_k 1\\{i \rightarrow k\\}$$

These can be considered the directional generalizations of degree (number of *directed* connections), and the Laplacian matrix to be

$$L\_{ij} = \frac{W\_{ij}}{\sqrt{O\_{ii}P\_{jj}}}$$


The new directed spectral clustering algorithm, *DI-SIM* (pronounced "Dice 'em") can be described by

> Input: Adjacency matrix $W \in \\{0, 1\\}^{n \times n}$, number of clusters $k$

> 1. Compute the singular value decomposition of $L = U \Sigma V^T$. Remove the columns of $U$ and $V$ that correspond to the $n - k$ smallest singular values in $\Sigma$. Call the resulting matrices $U^k \in \mathbb{R}^{n \times k}$ and $V^k \in \mathbb{R}^{n \times k}$

> 1. Cluster the nodes based on similar parents by treating each row of $V^k$ as a point in $\mathbb{R}^k$. Cluster these points with K-means. Because each row of $V^k$ corresponds to a node in the graph, the resulting clusters are clusters of the nodes.

> 1. Cluster the nodes based on similar children by performing step two on the matrix $U^k$.

> Output:the clusters from Steps 2 and 3.

The directed spectral clustering algorithm creates two sets of clusters.

<FONT COLOR="red">In 15-lec8.1 there is a description of SVD that I need to put in somewhere, probably in the PCA file</FONT>


#### Directed spectral clustering example on the Enron data:

First, we computed the left and right singular vectors of the directed graph Laplacian. Suppose that we restrict to only the second, third, fourth and fifth vectors (see the image below), then we have two matrices with 154 rows and 4 columns: the left singular vectors $U \in \mathbb{R}^{154 \times 4}$ and the right singular vectors $V \in \mathbb{R}^{154 \times 4}$. Two rows in the matrix of left singular vectors are "close" if those two employees *sent* many messages to the same people. Whereas two rows inthe matrix of the right singular vectors are close if those two employees *received* many messages from the sample people. 


<img src="singular.png" alt="Minard" style="width:300px;height:300px;">


The question is, how different (or similar) are the left and right singular vectors in the Enron data?

To compare the rows of $U$ to the rows of $V$, we need to make sure that they are "aligned". Recall that the matrix $O$ consists of the numbers of offspring/out-links for each node in the graph. If we define
$$O^* = \underset{O : O^TO = I}{\text{argmin}} \\|U - VO\\|\_F$$
Then it becomes meaningful to measure the Euclidean distance between the rows of $U$ and the rows of $VO^\*$, since $VO^\*$ is aligned with $U$. The 154 distances are represented in the histogram below:

<img src="dist.png" alt="Minard" style="width:400px;height:200px;">


The outlier on the far-right corresponds to employee Bill Williams, who sent a lot of emails, but did not recieve many. Note that Williams was not identified in the symmetric PCA analysis.

## The EM algorithm

The expectation-maximization (EM) algorithm is an iterative algorithm which aims to compute the maximum likelihood estimate (whereby our goal is to estimate the model parameters for which the observed data are most likely) in the presence of missing or hidden data. It is related to techniques such as Newton-Rhapson and gradient descent. Each iteration consists of two steps: the E-step (expectation step) and the M-step (maximization step). In the E-step, the missing data (for example, the cluster membership) are estimated via a conditional expectation given the observed data and current estimate of the model parameters. In the M-step, the likelihood function is maximized under the assumption that the missing data are known, where the estimate of the missing data from the E-step are used in place of the actual missing data (since, obviously, this data is still missing!).

It is actually not hard to show that K-means in actually a variant of the EM algorithm. In the context of K-means, we might think of the E-step as the step which assigns each object to a centroid which corresponds to the most likely clustering, and the M-step as the recalculation of the model (recalculate the centroids using least squares optimization). 

The figure below from Dempster et al. (1977) provides a graphical interpretation of a single iteration of the EM algorithm.

<img src="EM.png" alt="Minard" style="width:400px;height:300px;">

A <a href="http://www.cs.utah.edu/~piyush/teaching/EM_algorithm.pdf">clear and concise tutorial</a> on the technical aspects of the EM algorithm is available by Sean Borman. We present only a concise summary here. Let's suppose that we have an unknown parameter, $\theta$, which indexes a distribution from which our observed data, $X$, was drawn. Suppose also that we have some missing data denoted by the hidden random vector, $Z$. As an example, suppose that our data, $X$, comes from a mixture of two Gaussians. In this case, each observation $X\_i$ comes from one of two Gaussian distributions: $N(\mu\_0, \sigma\_0^2)$ or $N(\mu\_1, \sigma\_1^2)$ (in which case we assume that $\theta = (\mu\_0, \sigma\_0^2, \mu\_1, \sigma\_1^2)$), but the problem is that not only do we not know which distribution a given data point came from, we don't even know what the distributions are since $\theta$ is unknown! Can you imagine what our missing variable, $Z$, corresponds to? Well, given that the information that is missing is from which distribution our data was drawn, we might encode our latent variable to be
$$Z\_i = \begin{cases} 1 &\text{if } X\_i \sim N(\mu\_1, \sigma\_1^2)\\\ 0 &\text{if } X\_i \sim N(\mu\_0, \sigma\_0^2)\end{cases}$$

We can thus rewrite out distribution as

$$X|Z \sim ZN(\mu\_1, \sigma\_1^2) + (1 - Z) N(\mu\_0, \sigma\_0^2)$$

and stress that this is a significant abuse of notation, and that you should never write something like this (*especially* not in a book!). 

That is, $Z\_i$ is an unobserved random variable that tells us which distribution our observation $X\_i$ came from. This is clearly a clustering problem! We observe a bunch of (normally distributed?) data points, for which we have reason to believe that there exist two main clusters of observations, and we would like to know what they are: we want to find $Z$! 

The idea is that, given a current estimate, $\theta\_n$ of $\theta$ (where the subscript $n$ corresponds to the $n$th iteration, not the number of data points), we can iterate through the following steps:

1. Estimate the cluster membership, $z$, for the data point using conditional expectation given the observed values of the data point, $x$, and the current parameter estimates, $\theta\_n$. That is, calculate $\hat{z}\_n = E(z | x, \theta\_n)$.

2. Calculate the value of $\theta\_{n+1}$ that is most likely given $x$ and our estimated missing values (cluster membership), $\hat{z}\_n$. This corresponds to calculating the maximum likelihood of $\theta$ at this iteration.

Thus, as the EM algorithm converges (which it is guarenteed to do), not only does our estimate of $\theta$ get closer and closer to the "true" value, but the estimates of our cluster memberships (or missing values, $z$) get closer and closer to the true values. So our final cluster membership estimates correspponds to our final calculation of the E-step!

<FONT COLOR="red">Give some of the more technical details as well as an example</FONT>


## Two types of community detection algorithms: parametric and algorithmic

There are two primary realms of community detection algorithms: 

1. Parametric model fitting approaches, and 

2. Algorithmic and data driven approaches.

In the parametric model fitting approach, we suppose that a network model in which community memberships have a parametric representation. We aim to estimate these parameters which are considered the "true" clusters (recent examples include Nowicki and Snijders (2001), Handcock et al. (2007) and Airoldi et al. (2008). On the other hand, the algorithmic and data driven approach is motivated by observations, heuristics, and insights into the appearance of clusters. The user of such approaches hopes to find plausible clusters, but does not assume the existence of "true" clusters (recent examples involve spectral clustering, Girvan-Newman).


However, how do we know that we should ever trust the output of an algorithm? Many people tend to use the same methods over and over again because they found that the method worked well for them in the past. Is this ridiculous? Probably not that ridiculous... it might not be the absolute best method, but at least they've had success with it in some setting and have been working with the method for a long time and so hopefully have a fairly thorough understanding of the method. In general, however, it is very impotant to perform "down-stream" validation analysis to assess the empirical performance of a method. What do we mean by "down-stream" analysis? First, perhaps, we should ask the question: how do you know that the clusters you've obtained from your method of choice are meaningful? Typically we don't know the true clusters (if there even are true clusters...), and if we did, we would have no need to estimate the clusters in the first place! 

The typical computer-science approach to such questions is to show that particular algorithms yield approximate solutions that are "close" to the true empirical optimum for a particular set of network data. However, just because the algorithm has the capabilities to attain "close to optimal" solutions, how do you know that it has done so for your data? 

In contrast, the statistical approach asks: how does the algorithm perform on tractable stochastic models with clearly defined population clusters? Do we get close to the truth (that we build into the model)? To understand what this means, we first need to define the Stochastic Block Model (SBM). In an SBM, each node belongs to a "block", edges are randomly placed between nodes based on independent Bernoulli random variables and the probability of an edge between two nodes depends only on the block membership of those two nodes. In particular, we can think of the blocks as the "true" clusters and make the probability of an edge high between nodes in the same block and the probability of an edge low between nodes in different blocks. 

<img src="SBM.png" alt="SBM" style="width:300px;height:400px;">

If we can show that a clustering algorithm can accurately detect these blocks (the clustering algorithm estimates the block membership for each node) then we should be fairly confident that the algorithm performs well. But is this enough to be sure that the algorithm performs well in all circumstances?


## How to choose the number of clusters?

So in all of the examples presented above, we have always assumed that we are trying to identify $k$ clusters, and we treated this number as something that you should just know! But this wasn't really fair... in most situations, we don't know how many clusters there are in our data. So how can we figure out the right value of $k$? There are a number of methods out there, but methods for which you simply plug in your data and it spits out a number of clusters are unreliable. A much better alternative is to visualize your data, and there are a number of tools available for the specific purpose of identifying the most appropriate number of clusters in your data. One such method is the Sihlouette plot.

### Silhouette

Silhouette was first introduced by Peter J. Rousseeuw in 1986. Assume that we have clustered our data into $k$ groups, and for any given data point, $i$, we define:

* $a\_i$ to be a measure of how well observation $i$ fits into its cluster (for example by calculating the average pairwise distance of points in cluster $i$).

* $b\_i$ to be a measure of how different observation $i$ is from other clusters (for example by calculating the smallest average distance of observation $i$ to other clusters).

Then we can define a value

$$s\_i = \frac{b\_i - a\_i}{\max(b\_i, a\_i)}$$

which is a value between -1 and 1. In particular, $s\_i$ is close to $1$ if observation $i$ is in a tight cluster and is far away from other clusters, and is close to $-1$ if it is in a loose cluster and is close to other clusters. Our goal is to find the value of $k$ that maximizes the mean of the $s\_i$'s.


### Cross-validation
