# Chi-square test of independence
# tests whether two variables are associated
# Single population

# Rule of Thumb: cell count are at least 5. 
#If not, combine categories or use Fisher's test

# Ho : The two variables are independent
# Ha : The two variables are associated

# df : (row -1)*(column -1)

# expected cell count: (row total * column total) / overal total

#Contingency table
#Researchers believe that a punishment record while in prison is associated with success or failure while on parole
#Punishment: None, 1-2, 3+
#Violation: Parole violation, No Violation
parole = matrix(c(405,240,151,1422,470,275),nrow = 3)
parole
#     [,1] [,2]
# [1,]  405 1422
# [2,]  240  470
# [3,]  151  275

chisq.test(parole, correct = FALSE)
# Pearson's Chi-squared test
# data:  parole
# X-squared = 53.8786, df = 2, p-value = 1.997e-12

#Sufficient evidence exists to conclude that prison punishment record and parole violation status are associated.


##########################################################################

# Chi-square test of homogeneity
# Test if the distribution of one variable is the same across all categories of the other variable.
# 2+ Populations

# Ho : Distribution of one variable is the same across all sampled population
# H1 : At least 1 of the probability statement is false.
