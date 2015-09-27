## Have total emissions from PM2.5 decreased in the United States from 1999 to 
## 2008? Using the base plotting system, make a plot showing the total PM2.5 
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.


## Raed Data Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate required data
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

## Create a bara plot and save to png
png('plot1.png', width=480, height=480)

barplot(height = TotalByYear$Emissions, 
        names.arg = TotalByYear$year, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))

dev.off()