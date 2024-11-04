![[Pasted image 20241102105605.png]]
Three Operations for a Idealized Neurons
1) Weighting
2) Summation (+ Bias)
3) Activation Functions

### Perceptron
- Takes the dot product of vector x (input) and w (weights), and the activiation function ouputs 1 if the result is positive or -1 if the result is negative (sin)
![[Pasted image 20241102110046.png]]

- Perceptrons are good linear classifiers; construct a linear decision boundary to separate instances from different classes
- The dot product (x1\*w1 + x2\*w2 + ... + xn\*wn) forms a linear line where the boundary represents 1 or -1 (in a 2D case, two different classes)
![[Pasted image 20241102110243.png]]
- First, let's view perceptions as linear regression mechanism, no activation functions 
- Gradient Descent: 
	- Image you had three foods, and you didn't know the cost of the individual food, but after selecting an amount of the three foods the cashier told you the total price.
	- You can conduct an iterative approach of guessing the prices of each of the food and compare it to the total price the cashier gives you, and adjust the guess to better match the outcome
	- This always converges
	- ![[Pasted image 20241102111527.png]]
	- Residual error = (t - y) (t is actual result, y is the result from our guessing weight)
- Problems with perception
	- Only classifier linearly separable classes
	- If you run it with XOR data, weight swill oscillate forever, a single line can't separate
	![[Pasted image 20241102112301.png]]
	- Multiple solutions are also possible depending on starting point
![[Pasted image 20241102112405.png]]
![[Pasted image 20241102112419.png]]
- Can't determine if the solution is a global optimal solution, only local optimal 

### Neurons Models
- The choice of activation function determines the neuron model
- ![[Pasted image 20241102112603.png]]
- ![[Pasted image 20241102114829.png]]
- ![[Pasted image 20241102114610.png]]
- The sigmoid function is often used because the transition portions are easily differentiate (unlike ramp and step)
- Differentiate is used to navigate the error surface, which is used by finding the slope 
![[Pasted image 20241102115150.png]]
- Summary of Perceptron
	- Perception training rule guaranteed to succeed if (No activation/threshold unit))
		- Training examples are linearly separable
		- Sufficiently small learning rate n
	- Linear unit training rule uses gradient descent (Has activation/threshold unit)
		- Guaranteed to converge to hypothesis with minimum squared error
		- Given sufficiently small learning rate n
		- Even when training data contains noise
		- Even when training data not separable by H

### Neural Networks
- One problem was for neurons that feed in as inputs to the last neuron (the last neuron determines the output), you know how to adjust the weight for the last neuron. For example, when training, you know what kind of output you want, so you can adjust weights for that. But how do you adjust weights for intermediate neurons? How do you know adjust weights on the neurons outputs that are going to be the input for another neuron?
![[Pasted image 20241102115938.png]]
- Backpropagation (How to train neuron networks) 
	- Randomly assign weights (between 0-1)
	- Present inputs from training data, propagate to outputs
	- Compute outputs O, adjust weights according to the delta rule, backpropagating the errors. The weights will be nudged closer so that the networks learns to give the desired output
	- Repeat; stop when no errors, or enough epochs completed

### Deep Learning
- Deep learning is "deep" because it has lots of layers
![[Pasted image 20241102121957.png]]
- There was a paper that said you only need one or two layers to model anything in the world (Universality Theorem)
- Deep Learning comes from the insight that the internal nodes are very modular in nature
	- For example, let's say a neural network is used to understand a photograph
	- 1st layer could be modeling brightness, 2nd layer could be modeling regions, 3rd layer could be modeling objects
![[Pasted image 20241102124555.png]]
### Summary
1) A neural network is a function composed of simple functions (neurons)
	1) Usually we design the network structure, and let machine find parameters from data
2) Cost function evaluates how good a set of parameters is
	1) Design cost function based on the task
3) Find the best function set (e.g. gradient descent)
4) 