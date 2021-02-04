#Library with commands to estimate both risk and odds ratios
install.packages("epitools")
library(epitools)

#Create a 2x2 table
antiseptic.tab=matrix(c(34,6,19,16),byrow=TRUE,nrow=2)
antiseptic.tab
#             Amputation
#Antiseptic Survive Death
#             [,D1] [,D2]
# [E1,]         34a    6b
# [E2,]         19c   16d

#The default comparison is for the second outcome column, D2, comparing the second predictor to the first, E2 to E1. 
#The option rev = "both" changes both the outcome and exposure comparisons so that the results match the given formulas
epitab(antiseptic.tab, method = "riskratio", rev = "both")
epitab(antiseptic.tab, method = "oddsratio", rev = "both")

# 
# Outcome
# Predictor  riskratio    lower    upper     p.value
# Exposed2  1.000000       NA       NA          NA
# Exposed1  1.565789 1.124876 2.179525 0.005018047
# 
# Outcome
# Predictor  oddsratio    lower    upper     p.value
# Exposed2   1.00000       NA       NA          NA
# Exposed1   4.77193 1.598973 14.24122 0.005018047

# "lower" and "upper" display the lower and upper bounds respectively for a 95% confidence interval.
