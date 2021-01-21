# Chi-square test
# 2 samples, 2 categories, large sample

# calculate how unusual the observed contingency table is under the null hypothesis
# compares the observed values in each cell of a contingency table to the expected values

gilbert = matrix(c(40,34,217,1350),nrow = 2)
gilbert
#       [,1] [,2]
# [1,]   40  217
# [2,]   34 1350

# TEST STATISTIC = X² = ??? [(observed count - expected count)² / expected count]

# Ho : p1 = p2
# Ha : p1 != p2  "The proportion of shifts where a death occured is different for shifts where gilbert worked than for shifts gilbert did not work"

chisq.test(gilbert, correct = FALSE)

# Pearson's Chi-squared test
# data:  gilbert
# X-squared = 86.4809, df = 1, p-value < 2.2e-16

# Reject Ho
# Sufficient evidence exist to conclude that the proportion of shifts gilbert worked with a death occurring is different than the proportion of the shifts Gilbert did not work with a death occurring
