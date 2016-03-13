##To determine how have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City 
destfile <-'dataset.zip'
if (!file.exists(destfile)) {
  fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
  download.file(fileUrl, destfile)
  unzip(destfile)
}

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Look for vehicle sources 
VelSCC<-SCC[grep("vehicle", SCC$EI.Sector, ignore.case = TRUE),]

##Look for Baltimore motor vehicle related source types
BaltimoreNEI<-subset(NEI, fips=="24510")
BaltimoreNEIVehSCC<-merge(BaltimoreNEI, VelSCC, by="SCC")  
annualEm<-with(BaltimoreNEIVehSCC, tapply(Emissions, year, sum, na.rm=TRUE))

##Output to png format
png("plot5.png", width=480, height=480)
plot(names(annualEm), annualEm, type="o", col="blue",lwd=2, xlab="Year", ylab="PM2.5 Emission (tons)", main="Total PM2.5 Emission for Motor Vehicle Sources (1999-2008)")
dev.off()


                             