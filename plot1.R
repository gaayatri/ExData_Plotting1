dfhead <- read.table("household_power_consumption.txt",header=FALSE, sep=";",nrows=1,stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt",header=FALSE, sep=";",skip= grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=2878)
colnames(df) <- unlist(dfhead)
##df2 <- df
##df2$Date <- as.Date(strptime(df2[,1],"%d/%m/%Y"))
##datetimestr <- paste(df2$Date,df2$Time,collapse = " ")
hist(df$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

dev.copy(png,"plot1.png")
dev.off()