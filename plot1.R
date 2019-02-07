## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Add up the total emissions for each year
sum_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

## Open the plot
png(filename = "plot1.png")

## Create the Base Plot
plot(sum_by_year$year, sum_by_year$x, type = "l", 
     main = "Baltimore city - Total Emissions of PM2.5",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")

## Close Device
dev.off()