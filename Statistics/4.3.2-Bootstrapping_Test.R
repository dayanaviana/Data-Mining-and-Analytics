#NONPARAMETRIC TECHNIQUE (Sampling with replacement)
#Compare mean between two sets 

#dataset: Man and Woman weights
male <- c(245,200,145,180,250,205,195,170,140,170)
female <- c(165,120,170,190,195,120,170,140,130,150)

results <- numeric(10000)
for( i in 1:10000) { 
  data.male <- sample(male,10,replace=T)
  data.female <- sample(female,10,replace=T)
  #TEST STATISTICS: Difference bewtwen averages
  results[i] <- mean(data.male)-mean(data.female)
}
hist(results)

alpha = 0.05
# 100*(1 - ??) %
threshold_higher = 100* (1-alpha/2)
# 100*(??/2) %
threshold_lower = 100* alpha/2

n1=10
n2=10
#Standard Deviation
se = sqrt(sd(male)^2/n1+sd(female)^2/n2)
x = mean(results)
df = n1-1

#Confidence Interval
# x??= sample mean, t*= t-distribution table, S*= Standard Deviation of th bootstrap

# x?? - t* (S*)
ci.l <- mean(results) - qt(1-alpha/2, df=n1-1) *se
# x?? + t* (S*)
ci.u <- mean(results) + qt(1-alpha/2, df=n1-1) *se

#The confidence interval can also be found directly from the bootstrap distribution using the sort command.
#This command will sort the data that is used to create the distribution. The values of the specific data points that match the desired percentiles can be read directly from the sorted data.
sort(results)

###########################################################

calcConfidenceInterval <- function(x,t,sd){
  results <- numeric(2)
  results[1] <- x - t * sd
  results[1] <- round(results[1], digits = 3)
  results[2] <- x + t * sd
  results[2] <- round(results[2], digits = 3)
  return(results)
}
calcTDistribution <- function(alpha,df){
  value <- qt(1-alpha/2, df)
  value <- round(value, digits = 3)
  return(value)
}

#A sample has a mean of 3.1 and a standard deviation of 0.29. A bootstrap distribution created from resampling the population has a mean of 3.5 and a standard deviation of 0.31. What is the range of values for a 95% confidence interval if the resamples consist of 6 data points?

t <- calcTDistribution(0.05,5)
ci <- calcConfidenceInterval(3.1, t, 0.31)
ci[1]
ci[2]
