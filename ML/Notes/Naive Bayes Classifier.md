
### Evaluation Strategy
- General ML Setting: Giving a training set, create model from data, then test that model against training data and verify the model's accuracy
- Divide data into
	- Training (How to create your model)
	- Validation (Compare model to the validation while training and retrain if doesn't mean threshold)
	- Test (Truly unseen data verify model's accuracy)
- Tune system to the validation set and report performance on the test set
### Evaluation Strategy
- For each class contract a confusion matrix (over a test set)
![[Pasted image 20241005110818.png]]
- Per-class evaluation measures
	- Accuracy = TP + TN / (TP + FP + TN + FN) 
	- Recall = TP / (TP + FN) (SHOULD classified as c, how many were right)
	- Precision = TP / (TP + FP) (DID classify as c, how many were right)
	- F-statistic =. Harmonic mean of recall and precision
- Final evaluation measures: average over all classes


### Cross-Validation
- 1) Divide dataset D into equal-sized parts, called "folds"
- 2) Use one fold as test set, the remaining as training set
- 3) Compute performance measure for each fold and aggregate statistics across all folds, eg mean of recall, variance of recall
- Ensures greater confidence
- Special Case: Number(folders) = Number(instances), leave-one-out cross validation (100 rows, 100 folds)

### Probability Concepts
- Question: Will this coin comes up heads?
- Frequentist Interpretation
	- Situation: Toss a coin 100 times, 54 heads, 46 tails, P(heads) = 54/100 = 0.54
	- As the number of trails increases, the expectation is that the estimated probabilities will be close enough to the "true" probabilities
- Bayesian Interpretation
	- Probability on belief, not experiments; P(heads) = 0.3 (trivial, this is my belief)
	- Called prior probability, can be based on anything (importantly, should revise this prior into a posterior based on new evidence)
	- Can answer questions about probability of events that haven't happened (Can't be answered by frequentists)
		- What is the probability that ___ will be the winner of the presidential election in ___ (future)?
- Joint Probability: Two events happening together
	- P(symptoms, disease)
	- P(A,B) = P(B,A)
- Independence 
	- A and B are independent if P(A,B) = P(A) x P(B)
	- {course performance, your grade} are likely not independent
- Conditional Probability
	- P(A|B)
	- Probability of A given that B is true, B is the world/context
	- P(grade = "A" | raw score = 100) (Very High!)
- Formal Definition of CP
	- P(A|B) = P(A,B) / P(B) 
	- P(B|A) = P(A,B) / P(A)
	- P(A,B) = P(A|B) x P(B)
- Conditional Independence
	- A and B are conditionally independent given C when: P(A,B|C) = P(A|C) x P(B|C)
	- If it's not equal, then they are conditionally dependent
- If A and B are independent: P(A|B) = P(A)
- If A and B are conditionally independent given C: P(A|B, C) = P(A|C)
- Bayes Equation
	- P(A|B) = P(B|A)P(A) / P(B)
![[Pasted image 20241005151052.png]]
-  ML: X is the data, Y is the model/class trying to predict
	- X is the data to play tennis, Y is whether or not you play tennis
![[Pasted image 20241005151326.png]]
- Naive Bayes Classification
	- For every class, calculate it's probability
	- P(Play=Yes) = 6/10, P(Play=No) = 4/10
	- P(Sunny | Play=Yes) = 3/6, P(Rain | Play=Yes) = 3/6, P(Sunny | Play=No) = 2/4, P(Rain | Play = No) = 2/4
![[Pasted image 20241005151746.png]]
- 
	- Goal: P(class1 | features) >< P(class2|features)
	- Apply Bayes rule: P(features|class1) x P(class1) >< P(features|class2) x P(class2)
	- Then be "naive" about the first term: 
		- If P(f1|class1) x P(f2|class1) x ... x P(class1) >< P(f1|class2) x P(f2|class2) ... P(class2)
		- We are assuming that features are conditionally independent given the class!
	- Applying NBC in practice
		- Text classification
			- Classes are {spam, ~spam}
			- Method
				- Organize data
				- Junk formatting and unformatting
				- Standardize Case
				- Tokenization
				- Stopword removal
				- Normalization
					- Accents, diacritics, stemming, lemmatization
			- Determine the features: word, position, count
		- Text Classification Models
			- Most Common Assumption (MNB)
				- Doesn't care about position
			- Laplace smoothing: Adding probability to words that haven't been seen because they will normally have a probability of 0
				- Gives too much weightage to unseen words
			- Good-Turing estimation/smoothing
				- Idea: if two words appear equal number of times, they have the same probability, group words into equivalence classes
			- Bernoulli model
				- Presence/absence of terms, not counts
			- Feature Selection
				- In practice, hundreds of thousands of features 
				- Apply a heuristic strategy to reduce
					- Mutual information between terms and classes
					- Chi-squared test between terms and classes
					- Frequency of terms in a given class
				- Rank features for each class and union them into a set
				- Issues: Yates correction for degrees of freedom, multiple hypothesis testing
		- Assumption: Each feature is distributed Gaussian, with a mean and variance specific to (feature, class) combination
			- Leads to the Gaussian NBC
	- Advanced: Bayesian Networks