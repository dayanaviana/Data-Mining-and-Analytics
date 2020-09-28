library(readr)
ester <- read_delim("ester.txt",";", escape_double = FALSE, trim_ws = TRUE)
View(ester)

#--------------------------------------------------------------------------
# STANDARDIZE THE VARIABLES! So all can be on the same relative unit
# It prevents variables having large influence due to larger values
# Calculate the number of standard deviation each observation is from the mean
# (Variable - mean(variable)) / Standard deviation (variable)
ester.stand <- scale(ester[-3]) # -3 eliminates the id N variable

summary(ester)
summary(ester.stand)

#--------------------------------------------------------------------------
# Calculate Euclidean distance between the observations
dist <- dist(ester.stand, method = "euclidean")

# Run cluster - Ward's method
efit <- hclust(dist, method = "ward")

# Create dendogram to determine # of clusters
plot(efit)

# Cut tree halfway up the y-axis
grps <- cutree(efit, k=4)

# Display cutoff on the dendrogram
rect.hclust(efit, k=4, border="red")

# Evaluate algorithm
table(grps, ester$N)

# Cluster 4 includes 28 observations from group N=2 and 112 observations from group N=4.
# grps   1   2   3   4
# 1     27   0   0   0
# 2      0  21   0  28
# 3      0   0  31   0
# 4      0   0   0 112