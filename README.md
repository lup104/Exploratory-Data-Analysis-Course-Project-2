# Exploratory-Data-Analysis-Course-Project-2

The project consists of R programs and plots to address 6 questions below.   Summary of findings are also included after each question.
Assumption:  The 6 R programs can be run in any sequence.  Therefore, each R program will download the source data and unzip the original data set at the begnning of each program. 

1.	Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.  
    A.	plot1.png illustrates that the total emissions from PM2.5 have decreased in the United States from 1999 to 2008 .

2.	Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
    A.  plot2.png illustrates that the total emissions from PM2.5 actually have increased in the Baltimore City from  2002-2005.

3.	Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
    A.	Plot3.png illustrates that “nonpoint”, “onroad”, and “nonroad” are the 3 sources with decrease in emissions from 1999-2008 for Baltimore.  The only source with increase emissions from 1999-2005 is “point”.   There is a downward trend for “point” from 2005 to 2008.

4.	Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?  
    A.	Plot4.png illustrates that there is a decrease in emissions from coal combustion-related sources  1999-2002.  There is a slight increase in the emissions from 2002-2005.  A sharp decrease was shown from 2005 to 2008. 

5.	How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
    A.	Plot5.png illustrates that there is an overall decrease in emissions from motor vehicles sources 1999-2008.  The sharp decresea occurs during 1999-2002.   The emissions level was relative flat between 2002 to 2005.  A decrease can be found from 2005 to 2008.  

6.	Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions? 
    A.	Plot6.png illustrates when comparing Baltimore with emissions from motor vehicle  sources,  LA has greater changes over times.  The motor vehicle emissions have increased from 1999 to 2005 for LA.  A decrease in emissions can be found fro 2005 to 2008.
