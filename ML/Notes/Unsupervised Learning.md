- There is no training or target/class variables
- Uses a dataset to create a mode
- Proof is often in whether the model exposes some inherent, latent, underlying, structure to the data
	- Evaluated by subjective interestingness measures

### Clustering
- Given a dataset, group it into clusters such that
	- Points in one cluster are more similar to one another
	- ...than to points in another cluster
- Sometimes referred as *unsupervised classification*
	- No predefined classes
- Typical applications
	- Stand-alone tool to get insight into data distribution
	- As a preprocessing step for other algorithms 
- Good clustering have
	- High intra-class similarity
	- Low inter-class similarity
- Precise definition of clustering quality is difficult
	- Application-dependent, subjective


### K-means
- Given n data points, group them into k clusters
- Heuristic
	- Does not explore all partitions
	- Does not guarantee optimality
- Clusters are denoted by mean of points in it
- Algorithm
	- Initialize clusters/initial centroids at random
	- Repeat until convergence
		- Assign each object to the cluster with nearest centroid
		- Compute each centroid as the mean of the objects assigned to it
- k-means sensitive to noise/outliers
- k-medoids
	- Each cluster denoted by one of the points 
- Probabilistic clustering
	- Each point can belong to more than one cluster
![[Pasted image 20241103142704.png]]

- Advantages to Hierarchical Clustering
	- Produces a tree of clusters (Dendrogram)
	- Does not require number of clusters as input
- Disadvantages
	- Heuristic, does not scale well


### Dimensionality Reduction
- Data is often very high dimensionality
	- Many dimensions are useless, irrelevant, or capture noise rather than signal
- Can we render the data in a smaller dimensional space but retain most of the information content underlying the data
	- Information Content can mean, for e.g., "variance"
- PCA is typically used as a pre-processing step
	- PCA reduce hundreds-thousands dimensions to tens of thousand dimension
		- Then apply a supervised/unsupervised learning algorithm
- Has foundations in singular value decomposition (SVD)
- Guaranteed to find the dimensions that catpure the most variance, resulting dimensions are also orthogonal
