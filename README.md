# Modelling EEG signals using Polinomyal Regression in R

  1. Task 1 - Preliminary data analysis 
     - Analysis of time series plots (of audio and EEG signals)	
     - Analysis of the distribution for each signal	
     - Outlier detection	
     - Analysis of correlation and scatter plots (between the audio and brain signals)

  2. Task 2 - Regression - Modelling the relationship between audio and EEG signals

Five candidate nonlinear polynomial regression models have been proposed, and the objective is to identify the model that can truly describe this relationship through a series of tasks. The five candidate models are: 
Model 1: y=θ_1 Χ_1^3+θ_2 Χ_2^5+θ_bias+ϵ
Model 2: y=θ_1 Χ_1^4+θ_2 Χ_2^2+θ_bias+ϵ 
Model 3: y=θ_1 Χ_1^3+θ_2 Χ_2+θ_3 Χ_1+θ_bias+ϵ 
Model 4: y=θ_1 Χ_1+θ_2 Χ_1^2+θ_3 Χ_1^3+θ_4 Χ_2^3+θ_bias+ϵ
Model 5: y=θ_1 Χ_1^3+θ_2 Χ_1^4+θ_3 Χ_2+θ_bias+ϵ

     - Data preprocessing
       - Iniciate LabelIndexer and OneHotEncoder classes of pyspark.ml.feature library (transform categorical features into numerical representations) 
       - Iniciate a VectorAssembler class of pyspark.ml.feature library (combining the columns into a single column)
       - Build a pipeline with LabelIndexer, OneHotEncoder, and VectorAssembler.
       - Fit the data on the pipeline and transform the data. 
     - Machine Learning models
       - Train a logistic regression model, decision tree classifier, and random forest classifier
       - Perform Hyperparameter tunning for Logistic regression and Decision tree classifier
     - Evaluate the models
       - Evaluate the models using True positive rate per label, False Positive rate per label, and F Measure per label
       - Evaluate the model using F1 Score, True positive rate, False positive rate, Precison, Recall, and Hamming Loss 
  3. Vizualizations accidents 2016-2021
     - Tableau visualizations of the data 
        - Top 5 cities with most accidents 
        - Total number of accidents per Year, Month, and Weekday
        - Number of accidents per weather conditon and temperature in Celsius 
        - Impact of road elements in the number of accidents 
        - Dynamic time series visualization of number of accidents per month in each state
