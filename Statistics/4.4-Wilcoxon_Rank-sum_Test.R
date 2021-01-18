# Wilcoxon rank-sum test
#This method ignores the values of the original data and compares the sum of the two groups' ranks.
#This test assumes that the two groups come from similar distributions, and the two sets of data are independent.

#wilcox.test(x, y = NULL, alternative = c("two.sided", "less", "greater"), mu = 0, paired = FALSE, exact = NULL, correct = TRUE, conf.int = FALSE, conf.level = 0.95, ...)
#In cases where ties exist in the data, the "exact" option should be set to FALSE.

x <- c(9.84,9.40,8.20, 8.24, 9.20,8.55,8.52,8.12)
y <- c(8.27,8.20,8.25,8.14,9.00,8.10,7.20,8.32,7.70)

#1) Ho: Median = 0  | H1: Median != 0


#2) Mean Value: n*(N+1)/2
n1 <- length(x)
n2 <- length(y)
N <- n1 + n2
mean_value <- n*(N+1)/2

#3) Standard Deviation:
Sw <- sqrt(n1*n2*(N+1)/12)

#4) W Statistics
data <- c(x,y)
data.rank <- rank(data)
x.rank.sum <- sum(data.rank[1:length(x)])
y.rank.sum <- sum(data.rank[length(x)+1:length(y)])
W_statistics <- min(x.rank.sum,y.rank.sum)

#5) Test
wilcox.test(x,y,alternative="two.sided", conf.int=TRUE, 
            conf.level=0.95, paired=FALSE, exact=FALSE, 
            correct=TRUE)

#Wilcoxon rank sum test with continuity correction
# data:  x and y
# W = 55.5, p-value = 0.06734
# alternative hypothesis: true location shift is not equal to 0
# 95 percent confidence interval:
#   -0.01002222  1.26002501
# sample estimates:
#   difference in location 
# 0.4200389 


#The p-value is 0.06734 > 0.05, so the null hypothesis should not be rejected.
#Statistical evidence exists that the median for both populations are the same.

