# -----------------------------------------------------------------
#Loading dataset
library(readr)

caterpillars <- read_delim("caterpillars.txt",";", escape_double = FALSE, trim_ws = TRUE)

View(caterpillars)

# -----------------------------------------------------------------
#Selecting  some variables for simplicity
cat_var <- subset(caterpillars, select = c(log, X1,X2,X3,X4,X5))

#Making a separate dataset for the predictor(explanatory) variables
X <- as.matrix(subset(caterpillars, select=c(X1,X2,X4,X5)))
View(X)

#dependent variable
Y <- as.matrix(subset(caterpillars, select = c(log)))

# -----------------------------------------------------------------
# In Principal Component Analysis (PCA) we are looking for which
# preditor variables are the strongest

#Run the PCA
caterpillar_pca <- prcomp(X,scale. = TRUE)
print(caterpillar_pca)

#output summary data 
summary(caterpillar_pca)

# -----------------------------------------------------------------
# Interpolation to determine the principal components. Look at:
# 1) PCs that have a Standard deviation around or > 1
# 2) PCs that take for the cumulative variance to be around 0.8

#                       PC1    PC2    PC3     PC4
#Standard deviation     1.4540 0.9878 0.9032 0.30702
#Cumulative Proportion  0.5285 0.7725 0.9764 1.00000

# Answer: PC1 and PC2

# -----------------------------------------------------------------

#Variables that correspond to PC1
C1 <- caterpillar_pca$rotation[,1]
C1

#X1        X2        X4        X5 
#0.3696742 0.1846275 0.6483770 0.6394223 

# Answer: X4 and X5 have the most influence, with scores 0f 0.6484 and 0.6394

# -----------------------------------------------------------------

#Test correlation between PC1 and the dependent variable, log.
cor(caterpillars$log, caterpillar_pca$x[,1])
# -0.4682138

#  Answer: PC1 is negatively correlated with the dependent variable,
# with a moderate correlation of -0.4682.

# -----------------------------------------------------------------
# Bar graph of thr variance by the PCs
plot(caterpillar_pca)

# 3D Plot: Explains the relationship of the PCs
biplot(caterpillar_pca,col=c("gray", "red"))
#  Answers: 
#  X4 and X5 vectors are the longest, which indicates that they explain more variance
#  X4 and X5 have similar direction, which indicates that they are highly correlated with each other

# -----------------------------------------------------------------
# WE DO NOT USE TWO VARIABLES SO HIGHLY CORRELATED LIKE X4 and X5

# Remove X5 and do PCA on the variables X1,X2,and X4
cat_vars1 <- subset(caterpillars, select = c(log,X1,X2,X4))
X1 <- as.matrix(subset(caterpillars, select=c(X1,X2,X4)))
caterpillar_pca1 <- prcomp(X1,scale. = TRUE)

print(caterpillar_pca1)
#    PC1        PC2         PC3
# X1 0.6398958 -0.3215356  0.69796003
# X2 0.4113750  0.9104846  0.04228902
# X4 0.6490793 -0.2600627 -0.71488701

summary(caterpillar_pca1)
#                        PC1    PC2    PC3
# Standard deviation     1.1845 0.9583 0.8237
# Proportion of Variance 0.4677 0.3061 0.2261
# Cumulative Proportion  0.4677 0.7739 1.0000

cor(caterpillars$log, caterpillar_pca1$x[,1])
#-0.670443

biplot(caterpillar_pca1,col=c("gray", "red"))
