# Modelling EEG signals using Polinomyal Regression in R

  1. Task 1 - Preliminary data analysis 
     - Analysis of time series plots (audio and EEG signals)	
     - Analysis of the distribution for each signal	
     - Outlier detection	
     - Analysis of correlation and scatter plots (between the audio and brain signals)

  2. Task 2 - Regression - Modelling the relationship between audio and EEG signals

      Five candidate nonlinear polynomial regression models have been proposed, and the objective is to identify the model that can truly describe this relationship through a series of tasks. The five candidate models are:
      
      Model 1: $y=θ_1 Χ_1^3+θ_2 Χ_2^5+θ_b+ϵ$     
      Model 2: $y=θ_1 Χ_1^4+θ_2 Χ_2^2+θ_b+ϵ$     
      Model 3: $y=θ_1 Χ_1^3+θ_2 Χ_2+θ_3 Χ_1+θ_b+ϵ$     
      Model 4: $y=θ_1 Χ_1+θ_2 Χ_1^2+θ_3 Χ_1^3+θ_4 Χ_2^3+θ_b+ϵ$     
      Model 5: $y=θ_1 Χ_1^3+θ_2 Χ_1^4+θ_3 Χ_2+θ_b+ϵ$

     - Task 2.1 - Estimate model parameters using least squares method  
     - Tasks 2.2, 2.3, 2.4 - Compute RSS, Log-likelihood function, AIC, and BIC 
     - Task 2.5 - Evaluate the distribution of the candidate models residuals 
     - Task 2.6 - Select the best model based on the destribution of the residuals, AIC, BIC and RSS
     - Task 2.7 - Compute the model’s prediction on the testing data and plot the 95% confidence intervals  
         - Split the data into training and test sets  
         - Estimate model parameters using only the training dataset
         - Compute the model’s output/prediction on the testing data
         - Compute and plot the 95% confidence intervals together with the model prediction, and the testing data samples
       
  3. Task 3 - Approximate Bayesian Computation (ABC) 
     - Perform rejection ABC to compute the posterior distributions of the selected regression model parameters
     
          The focus was on the two parameters with the largest absolute values in the least squares estimation of the selected model, while all the other parameters were fixed as constant using the estimated values from Task 2.1.
          A Uniform distribution was used as a prior around the estimated parameter values, and samples were drawn from this prior distribution to perform the rejection ABC algorithm.
          In each iteration, the model parameters were updated, and the new parameter matrix was multiplied by the model to generate predictions, the distance was computed and the pairs of parameters were accepted if the distance was smaller than the tolerance.
