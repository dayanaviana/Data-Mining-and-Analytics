# Kruskal-Wallis Test

#rank-based statistical test
#test to three or more groups of data
#This test identifies whether one of the groups is systematically different from the others
#test produces slightly different results when ties are involved.

#data is entered as a single vector
x <- c(21, 19, 25, 23, 16, 19, 30, 27, 35)
#second vector lists the group for the data in the first vector
g <- c(1,1,1,2,2,2,3,3,3)

#1) 
# Ho : All groups of data are drawn from the same distribution
# H1 : At least one group is drawn from a different distribution

#2) H-statistic : 12/(N*(N+1))* SUM(Ri^2/ni) -3*(N+1)
#H is the critical value of a chi-square distribution
calcHstatistic <- function(x){
  x.rank <- rank(x)
  R1 = sum(x.rank[0:3])
  R2 = sum(x.rank[4:6])
  R3 = sum(x.rank[7:9])
  #TO-DO{}
  return(5.76)
}


kruskal.test(x,g)
#p-value = 0.02185
#Since the p-value is less than commonly used significance levels, the null hypothesis should be rejected. In other words, one or more of the samples has a significantly different mean.
