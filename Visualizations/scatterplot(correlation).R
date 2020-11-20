#Load crime data
crime <-  read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.csv",
                   sep = ",", header = TRUE)

#View first 3 lines
crime[1:3,]

plot(crime$murder, crime$burglary)

#remove Washington,DC and National US averages
crime2 <- crime[crime$state != "District of Columbia",]
crime2 <- crime2[crime$state != "United States",]
plot(crime2$murder, crime2$burglary)

#adjust axis to start from zero
plot(crime2$murder, crime2$burglary, xlim = c(0,10), ylim = c(0,1200))

#plot a curve to estimate relationship
scatter.smooth(crime2$murder, crime2$burglary, xlim = c(0,10), ylim = c(0,1200))

#scatterplot matrix
#pass the whole data frame, minus the first column because that's just state names
plot(crime2[,2:9])

#scatterplot matrix with fitted LOE SS curves
pairs(crime2[,2:9], panel = panel.smooth)
