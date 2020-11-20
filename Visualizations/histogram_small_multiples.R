#Load data
tvs <- read.table("http://datasets.flowingdata.com/tv_sizes.txt",
                  sep="\t", header = TRUE)

#Filter outliers
tvs <- tvs[tvs$size <80,]
tvs <- tvs[tvs$size >10,]

#set breaks for histograms
breaks = seq(10, 80, by = 5)

#set the layout: 4 rows, 2 columns
par(mfrow=c(4,2))

#changing margins to fit screen
par("mar") #from: [1] 5.1 4.1 4.1 2.1
par(mar=c(1,1,1,1))

#Draw histograms, one by one
hist(tvs[tvs$year == 2009,]$size, breaks = breaks)
hist(tvs[tvs$year == 2008,]$size, breaks = breaks)
hist(tvs[tvs$year == 2007,]$size, breaks = breaks)
hist(tvs[tvs$year == 2006,]$size, breaks = breaks)
hist(tvs[tvs$year == 2005,]$size, breaks = breaks)
hist(tvs[tvs$year == 2004,]$size, breaks = breaks)
hist(tvs[tvs$year == 2003,]$size, breaks = breaks)
hist(tvs[tvs$year == 2002,]$size, breaks = breaks)
