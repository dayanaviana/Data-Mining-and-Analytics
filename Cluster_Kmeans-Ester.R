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
# DETERNINE NUMBER OF CLUSTERS: 
# Within group sum of squares graph
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)
  }
  plot(1:nc,wss,type="b",xlab="Number of Clusters",
       ylab="Within groups sum of squares")
}

wssplot(ester.stand, nc=6)
# Find the elbow, where the sum of squares stops decreasing at a rapid rate

#--------------------------------------------------------------------------
# K-means clustering
kmeans4 <- kmeans(ester.stand,centers=4)

# Show centers for each cluster
kmeans4$centers

# Show which cluster that each observation goes to:
kmeans4$cluster

# Qnt of observations in each cluester
table(kmeans4$cluster)

#--------------------------------------------------------------------------
# Evaluate k-means clustering
table(kmeans4$cluster, ester$N)

#Cluster1 includes 27 observations from group N=1 and 22 observations from group N=4
#    1  2  3  4
# 1  27 0  0  24
# 2  0  0  31 9
# 3  0  21 0  46
# 4  0  0  0  61