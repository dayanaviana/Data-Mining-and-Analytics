#NONPARAMETRIC TECHNIQUE
#Compare mean between two sets

#dataset: Man and Woman weights
male <- c(245,200,145,180,250,205,195,170,140,170)
female <- c(165,120,170,190,195,120,170,140,130,150)

#1) TEST STATISTICS
test_statistics = mean(male)-mean(female)

#2) NUMBER OF ALL POSSIBLE COMBINATIONS
#  (N choose K) = N! / [k!(N-K)!]
calcCombinations <- function(N,k){
  factorial(N)/(factorial(k)*(factorial(N-k)))
}
qntCombinations <- calcCombinations(20,10) 
#20 elements choosen by groups of 10
#even though we select 184756 samples, because they are ramdomly selected
#there's no garantee that each possible allocation is used the same number of times

#3) CALCULATE DIFFERENT COMBINATIONS
#combine all itens
x <- c(male,female)
# 10,000 itarations
qntIterations <- 10000
results <- numeric(qntIterations)
for (i in 1:qntIterations) {
  #permute data points
  data <- sample(x)
  #test statistics for each sample
  #AVG male - AVG female
  results[i] <- mean(data[1:10]-data[11:20])
}

#4) RATIO (results wanted / #combinations)
pvalue <- sum(results >= 0.0) / qntIterations
pvalue

#Probability that man weight more than women
#Ho : Weights are the same
#H1 : Man weight more than women

#pvalue < ?? (0.05)
#Reject Ho

#pvalue > ?? (0.05)
#Fail to Reject Ho
