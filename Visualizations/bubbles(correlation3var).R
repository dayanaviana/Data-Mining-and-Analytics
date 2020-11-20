crime <- read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.tsv",
                  header = TRUE, sep = "\t")

#X=murder rate, Y=burglary rate, size/radius=population
symbols(crime$murder, crime$burglary, circles = crime$population)

# ! Bubbles must be sized by area instead of radius
#Area of circle = pi*r^2
# r = sqrt (area / pi )

#find square root 
radius <- sqrt(crime$population/pi)
symbols(crime$murder, crime$burglary, circles=radius)

#scale down all circles. Rezed California to 1inche, and the rest of the circles are scaled accordingly
symbols(crime$murder, crime$burglary, circles=radius, inches=0.35,
        fg="white", bg="red", xlab="Murder Rate", ylab="Burglary Rate")
text(crime$murder, crime$burglary, crime$state, cex=0.5)

#trying squares, instead of bubbles
symbols(crime$murder, crime$burglary, squares = sqrt(crime$population), inches=0.5)
#squares sized by area: sides sized by the square root of the area