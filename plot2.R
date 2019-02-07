## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## filter data to get baltimore
subset_baltimore <- subset(NEI, NEI$fips=="24510")

## Add up the total emissions for each year
sum_by_year_baltimore <- aggregate(subset_baltimore$Emissions, by=list(year=subset_baltimore$year), FUN=sum)

## Open the plot
png(filename = "plot2.png")

## Create the Base Plot
plot(sum_by_year_baltimore$year, sum_by_year_baltimore$x, type = "l", 
     main = "Maryland - Total Emissions of PM2.5",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")

## Close Device
dev.off()