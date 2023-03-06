#time series plots
plot(Dataframe$time, Dataframe$x1, type = "n", xlim = c(30, 50), ylim = c(-5, 4), xlab="Time", ylab="EEG Signals")
lines(Dataframe$time, Dataframe$x1, col="blue", lwd="1")
lines(Dataframe$time, Dataframe$x2, col="red", lwd="1")

plot(Dataframe$time, Dataframe$x1, type = "n", xlim = c(50, 54), ylim = c(-5, 3.5), xlab="Time", ylab="EEG Signals")
lines(Dataframe$time, Dataframe$x1, col="blue", lwd="2")
lines(Dataframe$time, Dataframe$x2, col="red", lwd="2")
lines(Dataframe$time, Dataframe$y, col="purple", lwd="1")


plot(Dataframe$time, Dataframe$y, type = "l", xlim = c(30, 50), ylim = c(-50, 50), col="purple", xlab="Time", ylab="Audio input")

#distribution of the signals 
hist(Dataframe$x1, col="blue", main = ("Distribution of X1"), xlab="", ylab="Frequency")
hist(Dataframe$x2, col="red", main = ("Distribution of X2"), xlab="", ylab="Frequency")
hist(Dataframe$y, col="purple", main = ("Distribution of Y"), xlab="", ylab="Frequency")


#variance
print(var(Dataframe$x1))
print(var(Dataframe$x2))
print(var(Dataframe$y))
#mean
print(mean(Dataframe$x1))
print(mean(Dataframe$x2))
print(mean(Dataframe$y))
#standard deviation
print(sd(Dataframe$x1))
print(sd(Dataframe$x2))
print(sd(Dataframe$y))
#correlation
print(cor(Dataframe$x1, Dataframe$y))
print(cor(Dataframe$x2, Dataframe$y))

#scatter plot with linear model 
plot(Dataframe$x1, Dataframe$y, xlab = "X1", ylab = "Y")#positive correlation 
abline(lm(Dataframe$y ~ Dataframe$x1), col = "red")

plot(Dataframe$x2, Dataframe$y, xlab = "X2", ylab = "Y") #no correlation 
abline(lm(Dataframe$y ~ Dataframe$x2), col = "blue") 

df=data.frame(Dataframe$x1,Dataframe$x2, Dataframe$y)

#box plots
library(ggplot2)
df=data.frame(X, Dataframe$y)

# Plot the box plot
ggplot(data = df, aes(x = "x1", y = x1)) +
  geom_boxplot() +
  xlab("EEG Signal") +
  ylab("Value") +
  ggtitle("Boxplot of EEG Signal x1")

ggplot(data = df, aes(x = "x2", y = x2)) +
  geom_boxplot() +
  xlab("EEG Signal") +
  ylab("Value") +
  ggtitle("Boxplot of EEG Signal x2")

ggplot(data = df, aes(x = "y", y = Dataframe.y)) +
  geom_boxplot() +
  xlab("EEG Signal") +
  ylab("Value") +
  ggtitle("Boxplot of Sound y")
