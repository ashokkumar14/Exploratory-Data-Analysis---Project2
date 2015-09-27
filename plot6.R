## Read Data Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

## Get "ON-ROAD" Data for Baltimore City(fips == "24510") 
## Los Angeles County, California (fips == "06037")
OnRoadData <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

## Aggregate data
TotalByYearAndFips <- aggregate(Emissions ~ year + fips, OnRoadData, sum)

## Add City Description
TotalByYearAndFips$city <- ifelse(TotalByYearAndFips$fips == "24510", 
                                  "Baltimore", "Los Angeles")

png("plot6.png")

g <- qplot(x = TotalByYearAndFips$year,
          xlab   = "Year",
          y      = TotalByYearAndFips$Emissions,
          ylab   = "Total Emissions",
          data   = TotalByYearAndFips,
          color  = city,
          geom   = c("point", "line"),
          method = "loess",) + 
        labs(title="Vehicle Emissions, LA County and Baltimore")

print(g)

dev.off()