##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
##To determine Which city has seen greater changes over time in motor vehicle emissions?  To determine how have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City 
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

##Look for LA motor vehicle related source 
LANEI<-subset(NEI, fips=="06037")
LANEIVehSCC<-merge(LANEI, VelSCC, by="SCC")

##Output to png format  
png("plot6.png", width=640, height=480)
annualEm<-with(BaltimoreNEIVehSCC, tapply(Emissions, year, sum, na.rm=TRUE))
plot(names(annualEm), annualEm, type="o", col="blue", ylim=c(0,5000), lwd=2, xlab="Year", ylab="PM2.5 Emission (tons)", main="Total PM2.5 Emission of Baltimore vs LAs for Motor Vehicle Sources (1999-2008)")
annualEm<-with(LANEIVehSCC, tapply(Emissions, year, sum, na.rm=TRUE))
lines(names(annualEm), annualEm, type="o", col="red", ylim=c(0,5000), lwd=2)
legend("topright", col=c("blue", "red"),lwd=2,  legend=c("Baltimore", "LA"))
dev.off()
 

                             