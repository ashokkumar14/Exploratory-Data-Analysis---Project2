
## Read Data Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Combine both datasets
CombinedData <- merge( NEI, SCC, by="SCC")

library(ggplot2)

## Get all records with "coal"
MatchingRecords  <- grepl("coal", CombinedData$Short.Name, ignore.case=TRUE)
subsetCoal <- CombinedData[MatchingRecords, ]

TotalByYear <- aggregate(Emissions ~ year, subsetCoal, sum)

png("plot4.png", width=480, height=480)

CoalEmissions <- ggplot(TotalByYear, aes(factor(year), Emissions))

CoalEmissions <- CoalEmissions + 
                 geom_bar(stat="identity") +
                 xlab("year") +
                 ylab(expression('Total Coal PM'[2.5]*" Emissions")) +
                 ggtitle('Total Coal Emissions from 1999 to 2008')

print( CoalEmissions )

dev.off()