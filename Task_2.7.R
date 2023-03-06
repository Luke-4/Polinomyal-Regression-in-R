set.seed(123)
#split the matrix of data 70% training data and 30% testing data
data = sort(sample(nrow(X), nrow(X)*.7))
train_data<-Dataframe[data,]
test_data<-Dataframe[-data,]

#task 2.7.1
#create the theta bias of length X1 in training data.
const = rep(1, times=length(train_data$x1))

#create the theta bias of length X1 in training data.
const_test = rep(1, times=length(test_data$x1))

#create the model
model3=cbind((train_data$x1^3), train_data$x2, train_data$x1, const)
model3_test_data=cbind((test_data$x1^3), test_data$x2, test_data$x1, const_test)

#estimate model parameters using least squares (training data)
thetahat=solve(t(model3) %*% model3) %*% t(model3) %*% train_data$y

#compute model prediction using test data
y_pred=model3_test_data %*% thetahat

#plot 95% confidence interval 
residuals = test_data$y - y_pred
rss = sum(residuals^2)
n = length(test_data$y)
#calculate variance of the residuals
sigma_squared = rss/(n-1)
#compute the estimated covariance matrix of the model parameters
cov_thetaHat = sigma_squared * (solve(t(model3_test_data) %*% model3_test_data))

var_y_hat = matrix(0 , n , 1)

#compute the variance for of y_pred
for( i in 1:n){
  X_i = matrix( model3_test_data[i,] , 1 , 4 ) # X[i,] creates a vector. Convert it to matrix
  var_y_hat[i,1] = X_i %*% cov_thetaHat %*% t(X_i) 
}

#get all three variables to order
CI = 2 * sqrt(var_y_hat) # Confidence interval
y=test_data$y
time=test_data$time

#create dataframe and order it to plot
data = data.frame(y, y_pred, CI, time)
data = data[order(data$time), ]

#plot prediction, testing data, and confidence intervals 
plot(data$time, data$y_pred, type = "o", xlim = c(41, 47), ylim = c(-1, 1), col="steelblue1", xlab="Time", ylab="Y", lwd=2)
points(data$time, data$y, col="forestgreen", lwd=2)
segments(data$time, data$y_pred - data$CI, data$time, data$y_pred + data$CI, col="red1", lwd=3)
