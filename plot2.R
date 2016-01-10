dfhead <- read.table("household_power_consumption.txt",header=FALSE, sep=";",nrows=1,stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt",header=FALSE, sep=";",skip= grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=2878)
colnames(df) <- unlist(dfhead)
df2 <- df
df2$Date <- as.Date(strptime(df2[,1],"%d/%m/%Y"))
df2$datetime <- as.POSIXct(paste(df2$Date, df2$Time), format="%Y-%m-%d %H:%M:%S")
plot(df2$datetime,df2$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)")
dev.copy(png,"plot2.png")
dev.off()