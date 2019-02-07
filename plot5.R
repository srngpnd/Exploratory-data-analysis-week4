## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## filter data to get baltimore
subset_baltimore <- subset(NEI, NEI$fips=="24510")

## filter data to get type by road
subset_baltimore_type <- subset(subset_baltimore, subset_baltimore$type=="ON-ROAD")

## Add up the total emissions for each year
sum_by_year_baltimore <- aggregate(subset_baltimore_type$Emissions, by=list(year=subset_baltimore_type$year), FUN=sum)
colnames(sum_by_year_baltimore) <- c("Year", "Emissions")

## Open the Plot
png(filename = "plot5.png")

## Create the Plot
plot(sum_by_year_baltimore$Year, sum_by_year_baltimore$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")

## Close Device
dev.off()

