library(dplyr)
columnClass = c("character","character","character","character","character","character","character","character","character")
E_consumption = read.table(file = "/home/leon/New path/Data_science/Exploratory Data/household_power_consumption.txt",header = TRUE,sep = ";",colClasses = columnClass)
#New_date = with(E_consumption,paste(Date,Time,sep = " "))
#New_date = strptime(New_date,format = '%d/%m/%Y %H:%M:%S')
E_consumption$Date = as.Date(E_consumption$Date,format = "%d/%m/%Y")
E_con = E_consumption[E_consumption$Date >= "2007-02-01" & E_consumption$Date <= "2007-02-02",]
E_con_new = (lapply(E_con,function(x) {as.numeric(gsub("\\?", "na", x))}))
E_con_new = as.data.frame(E_con_new, stringsAsFactors = FALSE)
date = E_con$Date
time = E_con$Time
E_con_new$Date = date
E_con_new$Time = time
New_date = paste(as.character(date),time,sep = " ")
New_date = strptime(New_date, format = '%Y-%m-%d %H:%M:%S')
png(filename = "/home/leon/New path/Data_science/Exploratory Data/plot2.png", width = 480, height = 480,units = "px")
plot(New_date,E_con_new$Global_active_power,xlab = "",ylab = "Global active power (Kilowatts)",main = "Global Active Power", col = "black",type = "l")
#dev.copy(png,file = "/home/leon/New path/Data_science/Exploratory Data/plot2.png")

dev.off()
