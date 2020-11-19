birth_yearly <- read.csv("http://datasets.flowingdata.com/birth-rate-yearly.csv")

library(lattice)
#distributions skewed to the right
histogram(~rate|year, data=birth_yearly, layout=c(10,5))

#max = 132
summary(birth_yearly)

#remove outlier
birth_yearly.new <- birth_yearly[birth_yearly$rate < 132,]

#labels stored as numeric uses the orange bar, changing to string to see the year as lables
birth_yearly.new$year <- as.character(birth_yearly.new$year)

h <- histogram(~rate|year, data=birth_yearly.new, layout=c(10,5))

#change the order of the histograms
update(h, index.cond=list(c(41:50, 31:40, 21:30, 11:20, 1:10)))
