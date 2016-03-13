##To determine Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, if total emissions from PM2.5 decreased in 
##the United States from 1999 to 2008, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008
##Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
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

##Group emission data based on year, type 
annualEm<-as.data.frame(aggregate(Emissions ~ year*type, data = BaltimoreNEI, FUN=sum, na.rm=TRUE))
colnames(annualEm) <- c("Year", "Pollution_Type", "Emissions")

##Output to png format
png("plot3.png",width=480, height=480)
g<-ggplot(annualEm, aes(x=Year, y=Emissions, color=Pollution_Type))
g <- g + geom_line(size=2)+xlab("Year")+ylab("PM2.5 Emission (tons)") + ggtitle("Total PM2.5 Emission by Source type for Baltimore (1999-2008)")
print(g)
dev.off()