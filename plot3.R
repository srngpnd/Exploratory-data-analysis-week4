## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## filter data to get baltimore
subset_baltimore <- subset(NEI, NEI$fips=="24510")

## Add up the total emissions for each year
sum_by_type_year_baltimore <- aggregate(subset_baltimore$Emissions, by=list(subset_baltimore$type,subset_baltimore$year), FUN=sum)
colnames(sum_by_type_year_baltimore) <- c("Type", "Year", "Emissions")

## Open the plot
png(filename = "plot3.png")

## Create the Plot
qplot(Year, Emissions, data = sum_by_type_year_baltimore, color = Type, geom = "line") +
  ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
  ylab("Total Emissions (tons)") + 
  xlab("Year")

## Close Device
dev.off()