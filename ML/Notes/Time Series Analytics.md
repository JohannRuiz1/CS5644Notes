### Overview
- Time series analytics
	- Connections to both supervised and unsupervised learning
	- Methods fine tuned for temporal nature of data
- What is a time series?
	- A continuous-valued variable indexed by time (discrete or continuous)
![[Pasted image 20241103132513.png]]
## Forecasting

### Simple Moving Average 
- Assumes an average is a good estimator of future behavior
	- Used if little or no trend, used for smoothing
- ![[Pasted image 20241103132738.png]]
- ![[Pasted image 20241103132808.png]]

### Weighted Moving Average
- Gives more emphasis to recent data
- ![[Pasted image 20241103133302.png]]
![[Pasted image 20241103133356.png]]
### Exponential Smoothing
- Assumes that the most recent observations have the highest predictive value
	- Gives more weight to recent time periods
![[Pasted image 20241103133532.png]]
![[Pasted image 20241103133609.png]]
- How to choose alpha (a)
	- Depends on the emphasis you desire to place on the most recent data
- Increasing alpha (a) makes forecast more sensitive to recent data
- Higher alpha means steeper drop off on the weight 
![[Pasted image 20241103133942.png]]

### Autoregression
- Independent variables are older response variables (times t-1, t-2, ...)
- Dependent  variable is the current response variable (at time t)
- Setup a simple supervised learning scenario 
![[Pasted image 20241103134859.png]]
### ARMA
- Both Autoregression (AR) and Moving Average (MA)
- Ideal for Trend Identification
	- But restricted to linear methods for far, can be extended to non-linear relationships as well


### Applying a forecasting method
- Collect historical data
- Select a model
	- Moving average methods
		- Select n (number of periods)
		- For weighted moving average: select weights
	- Exponential smoothing
		- Select alpha (a)
	- Autoregression
		- Define past lookup period, independent variables, seasonality 

![[Pasted image 20241103135719.png]]

### Clustering Time Series Data
- K-means
- Hierarchical clustering
	- All of them require a distance of similarity functions
- Use MAD or MSE functions
	- And apply these algorithms as if you are applying them to points
- 