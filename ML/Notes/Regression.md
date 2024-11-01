- The output variable is a continuous outcome
	- Not a discrete quantity (like classification problems)
- Many existing methods of classification can be adapted to regression


### Linear Regression
![[Pasted image 20241015072327.png]]
- Ordinary least squares fit
	- Find the coefficients of the hyperplane such that
		- Sum of squared errors from predicted to actual values is minimized
		- Also called "linear least squares"
	- Ordinary
		- The way we measure discrepancies is ordinary 
		- We could use perpendicular distances (this isn't ordinary)
- Logistic Regression
	- Suitable for binary regression
	![[Pasted image 20241015072912.png]]
	- "Logit" model: ln(p / (1-p)) = a + Bx
	- p is the probability that the event occurs
		- p/(1-p) is the "odds" ratio
		- LHS is the logs odd ratio
		- RHS is the regular linear expression for a plane

### kNN Regression
- Combine predictions from nearby points
	- Averaging
	- Interpolation
	- Local linear regression
	- Local weighted regression