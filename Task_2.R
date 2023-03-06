set.seed(123)

#create the theta bias
constant = rep(1, times = length(y))

#split X into X1 and X2
X1=Dataframe[,1]
X2=Dataframe[,2]

#create the models 
model1=cbind((X1^3), (X2^5), constant)
model2=cbind((X1^4), (X2^2), constant)
model3=cbind((X1^3), X2, X1, constant)
model4=cbind(X1, (X1^2),(X1^3), (X2^3), constant)
model5=cbind((X1^3), (X1^4), X2, constant)

for (i in 1:5) {
  #get the model for every index: (model + i)
  var_name=paste0("model", i)
  my_model=get(var_name)
  
  #estimate model parameters using least squares (task 2.1)
  thetahat=solve(t(my_model) %*% my_model) %*% t(my_model) %*% y
  #print(thetahat) #print thetahat to include in the report
  
  #compute the models prediction
  y_pred=my_model %*% thetahat

  #compute model residual (error) and calculate the sum of squared errors (task 2.2)
  residuals = y - y_pred
  rss = sum(residuals^2)
  print(paste0("--------------------- Model ", i," -----------------------"))
  print(paste0("RSS for model ",i, ": ", rss))
  
  #compute the log-likelihood function (task 2.3)
  n = length(y)
  sigma_squared = rss/(n-1)
  loglikelihood = -(n/2) * log(2*pi) - (n/2) * log(sigma_squared) - (1/(2*sigma_squared)) * rss
  print(paste0("log likelihood for model ",i, ": ", loglikelihood))
  
  #define k for AIC and BIC this is the number of estimated parameters in each model 
  #K is 4 in model 1 and 2, K is 5 in model 3 and 5, K is 6 in model 4  
  if (i == 1 || i == 2) {
    k= 4
  } else if (i == 4){
    k= 6
  } else {
    k= 5
  }
  #compute AIC (task 2.4)
  AIC = 2 * k - 2 * loglikelihood
  print(paste0("AIC for model ",i, ": ", AIC, " info: K is equal to: ", k))
  
  #compute BIC
  BIC = log(n) * k - 2 * loglikelihood  
  print(paste0("BIC for model ",i, ": ", BIC))
  
  #Check if the residuals are close to normal/Gaussian (task 2.5)
  qqnorm(residuals, main=paste("Q-Q Plot for Model", i))
  qqline(residuals)
  hist(residuals, col="limegreen", main=paste("Distribution of the residuals for model", i), xlab="Model prediction errors", ylab="Frequency")
  print(shapiro.test(residuals))
} 