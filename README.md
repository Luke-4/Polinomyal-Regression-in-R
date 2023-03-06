# Modelling EEG signals using Polinomyal Regression in R

  1. Task 1 - Preliminary data analysis 
     - Time series plots (of audio and EEG signals)	
     - Distribution for each signal	
     - Outlier detection	
     - Correlation and scatter plots (between the audio and brain signals)

  2. WorkFinal_balanced
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
