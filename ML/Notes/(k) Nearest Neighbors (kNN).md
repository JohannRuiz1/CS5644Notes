- Eager Algorithms: A model-based algorithm, most of the hard work is done during the learning phase
- Lazy Algorithm: Doesn't do much learning, most of the hard work is done during the evaluation/application phase
- kNN is a lazy algorithm
	- Instance based learning, a non-parametric method
![[Pasted image 20241014202046.png]]
- k is better if it's an odd number to break even split of neighbors
- Higher k, smoother regions
- How to choose k
	- Divide training examples into two sets
		- A training set (80%) and a validation set (10%), and a test set (10%)
	- Predict the class labels for validation set by using the examples in training set
	- Choose the number of neighbors k that maximizes the classification accuracy 
		- Cross-validation
![[Pasted image 20241014202524.png]]
- Advantages
	- Can learn very complex target functions with arbitrary boundaries
	- Fast training time 
- Disadvantages
	- Can get easily bogged by noise
	- Slow at classification time
![[Pasted image 20241014202639.png]]
	- Traverse the tree looking for the nearest neighbor of the query point
	- Examine nearby points first: Explore the branch of the tree that is closet to the query point first
	- When we reach a leaf node: compute the distance to each point in the node
	- Then we can backtrack and try the other branch at each node visited
	- Using the distance bounds and the bounds of the data below each node, we can prune parts of the tree that could NOT include the nearest neighboor
- Curse of dimensionality
	- Need to do feature selection before applying kNN
