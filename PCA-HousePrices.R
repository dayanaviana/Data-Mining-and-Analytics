library(readxl)
houses <- read_excel("houses.xlsx")
View(houses)

#Filtering Rows
sold_houses <-  houses[which(houses$Status=='Sold'),]
View(sold_houses)

#Selecting Columns
variables <- subset(sold_houses, select = c('Sold_Price','SF','Units','Age','DOM','Yr_Blt'))

#Predictors
X <- as.matrix(subset(variables, select=c('SF', 'Units', 'Age', 'DOM' , 'Yr_Blt')))
View(X)

#dependent variable
Y <- as.matrix(subset(variables, select = c('Sold_Price')))

#Run the PCA
house_pca <- prcomp(X,scale. = TRUE)
summary(house_pca)
print(house_pca)

#Test correlation between PC1 and the dependent variable
cor(variables$'Sold_Price', house_pca$x[,1])
#Answer: 65% of the variance in $ is described by PC1

plot(house_pca)
biplot(house_pca,col=c("gray", "red"))

# -----------------------------------------------------------------
#Remove Age and SF
variables1 <- subset(variables, select = c('Sold_Price', 'Units', 'DOM' , 'Yr_Blt'))
X1 <- as.matrix(subset(variables, select=c('Units', 'DOM' , 'Yr_Blt')))
house_pca1 <- prcomp(X1,scale. = TRUE)
summary(house_pca1)
print(house_pca1)


cor(variables1$'Sold_Price', house_pca1$x[,1])
#Answer: 66% of the variance in $ is described by PC1

biplot(house_pca1,col=c("gray", "red"))
