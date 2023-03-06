set.seed(123)
constant = rep(1, times = length(y))
n=length(Dataframe$y)
X1 = Dataframe$x1
X2 = Dataframe$x2

model_matrix = cbind((X1^3), X2, X1, constant)

# Use a Uniform distribution as prior, around the estimated parameter values for those 2 parameters
prior1 = runif(10000, 4.181390 - 1, 4.181390 + 1)#0.078 because the when set to 1, the max and min accepted ranges +-0.57
prior2 = runif(10000, -6.651400 -1, -6.651400 + 1)#0.1

# Create empty array to store parameters
accepted_params = matrix(nrow = 0, ncol = 3)

num_iter = 100000
tolerance = 0.018

for (i in 1:num_iter) {
  # Draw parameters from prior
  theta3 = sample(prior1, 1)
  thetaBias = sample(prior2, 1)
  
  # Fix other parameters as constant
  thetahat = c(2.715713, -3.151350, theta3, thetaBias)
  theta=matrix(thetahat)
  
  # Compute simulated data using the model
  y_sim = model_matrix %*% theta
  
  # Compute distance between simulated and observed data
  dist = (sqrt(sum((y_sim - y)^2)))/n 
  
  print(dist)
  # Accept or reject parameter values based on the distance
  if (dist < tolerance) {
    accepted_params = rbind(accepted_params, c(theta3, thetaBias, dist))
  }
}

# Plot joint posterior distribution
library(ggplot2)

# Extract accepted parameters
theta3_posterior = accepted_params[, 1]
thetaBias_posterior = accepted_params[, 2]

# Plot joint posterior distribution
#plot(accepted_params[,1], accepted_params[,2], type = "p",
#     xlab = "Theta 3", ylab = "Theta Bias",col="blue", main = "Joint Posterior Distribution", lwd=1)

ggplot(data.frame(theta3_posterior, thetaBias_posterior), aes(x=theta3_posterior, y=thetaBias_posterior)) + 
  geom_bin2d(bins = 15, colour="green") +
  labs(x = expression(theta[3]), y = expression(theta[Bias]))

#plot the marginal distribution
hist(theta3_posterior, col="orangered1", main = ("Posterior distribution for Theta 3"), xlab="Value", ylab="Frequency")
hist(thetaBias_posterior, col="limegreen", main = ("Posterior distribution for Theta Bias"), xlab="Value", ylab="Frequency")