## Read Data Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)

## Get Baltimore Data for "ON ROAD"
BaltimoreData <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

## Aggregare Emission data by year for Baltimore "ON ROAD" records
TotalByYear <- aggregate(Emissions ~ year, BaltimoreData, sum)

png("plot5.png")

BaltimoreEmissions <- ggplot(TotalByYear, aes(factor(year), Emissions))

BaltimoreEmissions <- BaltimoreEmissions + 
                      geom_bar(stat="Identity", fill="#FF9999") +
                      xlab("Year") +
                      ylab(expression('Total ON-ROAD PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City from 1999 to 2008')

print(BaltimoreEmissions)

dev.off()