## Raed Data Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Data for Baltimore City
BaltimoreCityNEI  <- NEI[NEI$fips=="24510", ]

## Aggregate data
TotalByYear <- aggregate(Emissions ~ year, BaltimoreCityNEI, sum)

## Create a bara plot and save to png
png('plot2.png', width=480, height=480)

barplot(height = TotalByYear$Emissions, 
        names.arg = TotalByYear$year, 
        xlab = "Years", 
        ylab = expression('Total PM'[2.5]*' emission'),
        main = expression('Total PM'[2.5]*' Emissions in Baltimore City,  Maryland'))

dev.off()