# Fisher's Exact Test is a method of calculating the exact p-value for contingency tables.

#2x2 contingency table
#           Container
# Guess    Can  Bottle    Total by Guess
# Can       7     3       10
# Bottle    4     6       10
# Total     11    9       20
# by Container

N <- 20 #total orange juice samples
m <- 11 #total orange juice samples from a can
n <- 9  #total oranje juice samples from a bottle
k <- 10 #number of guesses that a sample comes from a can

X <- 7 #random variable representing the number of correctly identified orange juice samples from a can

#Hypergeometric Distribution 
dhyper(x = 7, m = 11, n = 9, k = 10)
# [1] 0.1500357
# The probability of correctly guessing exactly 7 of the 11 orange juice samples that came from a can, when guessing a total of 10 samples from cans, is 0.1500357.

###################################################################################

# Ho : p_can = p_bottle <- instructor is randomly guessing whether orange juice is in a bottle or can
# Ha : p_can > p_bottle <- instructor is more likely to say that canned orange juice come from a can then from a bottle

#1) Create a Contingence Table
orangejuice.table = matrix(c(7,3,4,6), nrow=2, byrow = TRUE)
orangejuice.table
#      [,1] [,2]
#[1,]    7    3
#[2,]    4    6

#2) Perform Fisher's exact test
fisher.test(orangejuice.table, alternative = "greater")

# Fisher's Exact Test for Count Data
# data:  orangejuice.table
# p-value = 0.1849
# alternative hypothesis: true odds ratio is greater than 1
# 95 percent confidence interval:
#  0.5306209       Inf
# sample estimates:
# odds ratio 
#   3.274233

#Since the p-value (0.1849) is greater than the commonly used significance levels (0.1, 0.05), insufficient evidence exists to reject the null hypothesis . Thus, the statistic students were justified in being skeptical of their instructor's alleged ability to distinguish an orange juice sample coming from a can versus another sample coming from a bottle.

#3) Two-sided Test: When prior beliefs does not existS
# Ha : p_can != p_bottle
fisher.test(orangejuice.table,alternative = "two.sided")
fisher.test(orangejuice.table)
