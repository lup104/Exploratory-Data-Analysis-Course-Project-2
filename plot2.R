##To determine if total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.
destfile <-'dataset.zip'
if (!file.exists(destfile)) {
  fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
  download.file(fileUrl, destfile)
  unzip(destfile)
}
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")

##subset data for Baltimore only based on fips
BaltimoreNEI<-subset(NEI, fips=="24510")
annualEm<-with(BaltimoreNEI, tapply(Emissions, year, sum, na.rm=TRUE))

##Output to png format
png("plot2.png", width=480, height=480)
plot(names(annualEm), annualEm, type="o", col="blue", lwd=2, xlab="Year", ylab="PM2.5 Emission (tons)", main="Total PM2.5 Emission for Baltimore (1999-2008)")
dev.off()