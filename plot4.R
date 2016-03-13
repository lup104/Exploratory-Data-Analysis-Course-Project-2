##To determine how have emissions from coal combustion-related sources changed from 1999-2008 across the United States
destfile <-'dataset.zip'
if (!file.exists(destfile)) {
  fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
  download.file(fileUrl, destfile)
  unzip(destfile)
}
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Look for Coal Combusion related source types
coalCombSCC<-subset(SCC,EI.Sector=="Fuel Comb - Comm/Institutional - Coal")

##Merge two files 
coalCombNEISCC<-merge(NEI, coalCombSCC, by="SCC")
annualEm<-with(coalCombNEISCC, tapply(Emissions, year, sum, na.rm=TRUE))

##Output to png format
png("plot4.png", width=480, height=480)
plot(names(annualEm), annualEm, type="o", col="blue", lwd=2, xlab="Year", ylab="PM2.5 Emission (tons)", main="Total PM2.5 Emission for Coal Combustion (1999-2008)")
dev.off()