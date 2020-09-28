est <- subset(ester, select=-Y) # Select only the X variable
est.stand <- scale(est[-2])  # -2 eliminates the id N variable

#--------------------------------------------------------------------------
#How many k-means clusters are there?
wssplot(est.stand, nc=6)
#Answer = 3

#--------------------------------------------------------------------------
#What is the value for the center of k-means cluster 2?
kmeans3 <- kmeans(est.stand,centers=3)
kmeans3$centers
#Answer = 2  1.06928780

#--------------------------------------------------------------------------
#How many k-means clusters contain only one group?
kmeans3$cluster
table(kmeans3$cluster)
#Answer = ???

#--------------------------------------------------------------------------
#Per the rule given in the exercise, how many clusters are there using Ward'shierarchical clustering?
dist1 <- dist(est.stand, method = "euclidean")
efit1 <- hclust(dist, method = "ward")
plot(efit1)
#Answer = 4

#--------------------------------------------------------------------------
#Most of the first cluster in the Ward's hierarchical cluster has observations from which group?
grps1 <- cutree(efit1, k=4)
rect.hclust(efit1, k=4, border="red")
table(grps1, est$N)
#Answer = Cluster 1 includes 27 observations from group N=1
