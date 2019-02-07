## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## filter data by source
coal_related_source_code <- SCC[grepl("Coal", SCC$Short.Name),]
coal_related_data <- NEI[NEI$SCC %in% coal_related_source_code$SCC, ]

## sum up emissions by year
coal_year <- aggregate(coal_related_data$Emissions, by=list(coal_related_data$year), FUN=sum)
colnames(coal_year) <- c("Year", "Emissions")

## Open the Plot
png(filename = "plot4.png")

## Create the Plot
plot(coal_year$Year, coal_year$Emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5")

## Close Device
dev.off()