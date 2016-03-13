c##To determine if total emissions from PM2.5 decreased in the United States from 1999 to 2008
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the year
destfile <-'dataset.zip'
if (!file.exists(destfile)) {
   fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
   download.file(fileUrl, destfile)
   unzip(destfile)
}
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")

##Aggregate emission based on the year
annualEm<-with(NEI, tapply(Emissions, year, sum, na.rm=TRUE))

##Output to png format
png("plot1.png", width=480, height=480)
plot(names(annualEm), annualEm, type="o", col="blue",lwd=2,xlab="Year",ylab="PM2.5 Emission (tons)", main="Total PM2.5 Emission (1999-2008)")
dev.off()