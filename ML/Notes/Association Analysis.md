### Summary
- Association anaysis
	- Primarily unsupervised learning
	- One of the "new age" data mining problems
- Goes by
	- Market based analysis
	- Mining transaction datasets 
	- Itemset mining
	- Association rule mining

### Examples
- Given a set of transactions, fund rules that will predict the occurrence of an item baed on the occurrences of other items in the transaction
![[Pasted image 20241103170216.png]]
- Examples of Association Rules:
	- {Diaper} -> {Beer}
	- {Milk, Bread} -> {Eggs, Coke}
	- {Beer, Break} -> {Milk}
- Implications means co-occurrence, not causality

### How to Find Association Rules
- First: Find "frequent" itemsets {X,Y}
	- Defined by a support threshold
- Next: See if X -> Y or Y -> X hold
	- Defined by a confidence threshold

### Frequent itemsets
- Itemset
	- A collection of one or more items
		- Example: {Milk, Bread, Diaper}
	- k-itemset
		- An itemset that contains k items
- Support count (sigma)
	- Frequency of occurrence of an itemset
	- E.g. sigma({Milk, Bread, Diaper}) = 2
- Support
	- Fraction of transactions that contain an itemset
	- E.g. s({Milk, Bread, Diaper}) = 2/5
- Frequent Itemset
	- An itemset whose support is greater than or equal to a minsup threshold
	- E.g. Only want itemsets that are greater than

### Association Rules
- Association Rules
	- An implication expression of the form X -> Y, where X and Y are itemsets
	- E.g. {Milk, Diaper} -> {Beer}
- Rule Evaluation Metrics
	- Support (s)
		- Fraction of transactions that contain both X and Y
	- Confidence (c)
		- Measures how often items in Y appear in transactions that contain X
![[Pasted image 20241103172838.png]]

### Two Step Approach
1) Frequent Itemset Generation
	1) Generate all itemsets who support >= minsup
2) Rule Generation
	1) Generate high confidence rules from each frequent itemset, where each rule is a binary partitioning of a frequent itemset
![[Pasted image 20241103173749.png]]


### The Apriori Principle
- If a set does not have minimum support (does not exceed the support threshold), then it's superset is not going to have support
	- If AB has a support of 18%, and the threshold is 20%, then every superset (ABC, ABD, ABCDE) is not going to have a support larger than 18%
- Support is anti-monotone
	- If an itemset X does not have support, no superset of X can have support
![[Pasted image 20241103173945.png]]

![[Pasted image 20241103175458.png]]![[Pasted image 20241103175518.png]]
### Practical Issues
- Many real datasets have skewed support distributions
	- Too small support vs too large support
- Association analysis tends to produce too many rules
	- Use interestingness measures to prune/select rules


## Recommender Systems

### How do they work
- Two basic threads
	- Content-based filtering
		- Tom likes aviation movies, so Tom will like Sully
	- Collaborative filtering
		- Tom like the movies that Sally likes and Sally liked Sully, so Tom will like Sully
			- Suffers from "coldstart" problems (initial conditions)

### Collaborative filtering
- Two basic flabors
	- User-based
	- Item-based
- Both are types of nearest neighbor reasoning

#### User Based
- First measure similarities between users 
	- ![[Pasted image 20241103183820.png]]
- Second, make a predication
	- To predict the rating for user A for product p, find others who have rated p and scale their rating their similarity to user A
	- ![[Pasted image 20241103184116.png]]
- Problem: Has scalability issues if there are many more users than items


#### Item-based
- Look for items similar to item5
- Take Alice's ratings for these items to predict her rating for item5
- Amazon uses it
![[Pasted image 20241103184348.png]]
