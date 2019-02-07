## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## filter data to get baltimore & los angeles
subset_baltimore_la <- subset(NEI, NEI$fips=="24510" | NEI$fips=="06037")

## filter data to get type by road
subset_baltimore_la_type <- subset(subset_baltimore_la, subset_baltimore_la$type=="ON-ROAD")

## Add up the total emissions for each year
sum_by_year_baltimore_la <- aggregate(subset_baltimore_la_type$Emissions, by=list(subset_baltimore_la_type$fips,subset_baltimore_la_type$year), FUN=sum)
colnames(sum_by_year_baltimore_la) <- c("City", "Year", "Emissions")

## Open the Plot
png(filename = "plot6.png")

## Create the Plot
qplot(Year, Emissions, data = sum_by_year_baltimore_la, color = City, geom = "line") +
ggtitle("Emissions of PM2.5 in Baltimore and LA") + 
ylab("Total Emissions from motor vehicles (tons)") + 
xlab("Year") 

## Close Device
dev.off()

