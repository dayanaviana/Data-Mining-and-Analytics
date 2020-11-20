birth <- read.csv("http://datasets.flowingdata.com/birth-rate.csv")

#Filter out missing values
birth2008 <- birth$X2008[!is.na(birth$X2008)]

#estimate curve
d2008 <-  density(birth2008)

d2008

#store coordinates in a text file
d2008frame <- data.frame(d2008$x, d2008$y)
write.table(d2008frame, "birthdensity.txt", 
            sep = ",", row.names = FALSE)

#set layout and margins
par(mfrow=c(1,1))
par(mar=c(5.1,4.1,4.1,2.1))



#set axes, but No plotting yet
plot(d2008, type = "n")

polygon(d2008, col="#821122", border="#cccccc")


