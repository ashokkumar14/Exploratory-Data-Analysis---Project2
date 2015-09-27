## Raed Data Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Data for Baltimore City
BaltimoreCityNEI  <- NEI[NEI$fips=="24510", ]

## Aggregate data
Totals <- aggregate(Emissions ~ year + type, BaltimoreCityNEI, sum)

library(ggplot2)

## Create a bar plot and save to png
png('plot3.png', width=640, height=640)

baltimoreEmissions <- ggplot(Totals, aes(year, Emissions, color = type))

baltimoreEmissions <- baltimoreEmissions + geom_line() +
                        xlab("year") +
                        ylab(expression('Total PM'[2.5]*" Emissions")) +
                        ggtitle('Total Emissions in Baltimore City, Maryland for years 1999-2008')

print(baltimoreEmissions)

dev.off()