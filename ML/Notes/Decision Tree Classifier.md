- Let's take the play tennis example
![[Pasted image 20241002075928.png]]
- Classify instances
	- by sorting them down from the root to the leaf node
- Each node specifies a test of an attribute
- Each branch descending from a node corresponds a possible value of the attribute
- Each leaf is the classification given the feature values
- We are not suppose to come up with the decision tree, algorithms do
	- A machine is suppose to learn it automatically from tabular data
- A good tree does not regurgitate the given table
	- Learns to discard some entries
	- It is application to new data (rows of features)
		- Generalization is paramount
- "Learning too much" if the data is noisy; will be learning all the vagaries of the data instead of the pattern
	- Too deep a tree: learning the noise, will not generalize
	- Too shallow a tree: Not learning the underlying pattern

### Machine Learning 101 (The Algorithm for DTC)
- Input: The PlayTennis Table, Output: The Decision Tree
- Q: What is the crux of a decision tree algorithm? 
	- A: Knowing informative questions to ask and sequencing them in the right order
- A good question is one that reduces uncertainty and entropy
	- What attribute should we test on first?
- Tree Stumps: Look at each feature and all the values for those
![[Pasted image 20241003211232.png]]
- A attribute is good when
	- For one value we get all instances as positive
	- for the other value we get all instance as negative
- A attribute is poor when
	- it provides no discrimination
	- attribute is immaterial to the decision
	- For each value we retain a similar split of positive and negative instances
- Entropy: Characterizes the (im)purity of arbitary collection of example
![[Pasted image 20241003213602.png]]
- Uncertainty is highest when entropy is 0.5
![[Pasted image 20241003213758.png]]
![[Pasted image 20241003213816.png]]
- Entropy is 0 if all member of S belong to the same class
![[Pasted image 20241003214204.png]]
- Information Gain
	- Entropy measures the impurity of a collection
	- Information gain is defined in terms of Entropy
		- Expected reduction in entropy caused by partitioning the examples according to this attribute
![[Pasted image 20241003215026.png]]
- The attribute with the most information gain is the root of the tree
	- Divide and Conquer: Note that each branch of the tree involves a smaller dataset, only need to consider those rows now for entropy calculations
	- Algorithm Name: ID3
- Decision Trees and Rule-Based Systems
	- Learned trees can also be re-represented as sets of if-then to improve human readability
- Appropriate problems for Decision Tree Learning
	- Instances are represented by attribute-value pairs
		- Each attribute takes on a small number of disjoint possible values, eg, yes/no, weak/strong 
			- Extensions allow real-valued variables as well, eg, temperature
	- Target function has discrete output values
		- eg, Boolean classification (yes or no)
			- easily extended to multiple-valued functions
			- can be extended to real-valued outputs as well
	- Learning to classify
		- Medical patients by their disease
		- Equipment malfunctions by their cause
		- Loan applications by likelihood of defaults on payment
- Problems with ID3
	- Greedy, makes local decisions; Trees could be suboptimal (i.e. bigger than necessary)
	- Other variants (use other impurity measures, Gini coefficient)
- Summary: Classification ML problem, learns a tree from data which will generalize to new instances
- Advanced Version: Random Forests