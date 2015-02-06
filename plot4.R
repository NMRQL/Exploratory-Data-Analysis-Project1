# I have saved my txt file in the directory below
# so my working directory path has to be set up first to point there
setwd("E:/Coursera/4-Exploratory data analysis/Assignments")


# Next we define the filename
HPCFile<-"household_power_consumption.txt"

# Now We read in the data
# converting "?"to NA values by means of the na.string ="?"function
HPC<-read.table(HPCFile,sep=";",na.strings="?",header=TRUE, stringsAsFactor=FALSE)

# Combine first and second column and convert to POSIXIt
HPC$Date <- strptime(paste(HPC$Date,HPC$Time), "%d/%m/%Y %H:%M:%S")
HPC<-HPC[,-2]

# only use dates from 2007-02-01 and 2007-02-02
SubsetHPC<-subset(HPC, HPC$Date>="2007-02-01 00:00:00" & HPC$Date<="2007-02-02 23:59:00")


# Define the plot space into 4 quadrants
par(mfrow=c(2,2))

# define the margins around the plots
par(mar=c(4,4,2,2))

#now draw the plots - first 3 plot we use "plot", but with the 3rd we add the additional lines with
# "lines"function
# plots will plot top left, top right, bottom left, bottom right - in that order
plot(SubsetHPC[,1],SubsetHPC[,2],type="l",ylab="Global Active Power",xlab="")
plot(SubsetHPC[,1],SubsetHPC[,4],type="l",ylab="Voltage",xlab="datetime")
plot(SubsetHPC[,1],SubsetHPC[,6],type="l",col="black", ylab="Energy sub metering",xlab="")
lines(SubsetHPC[,1],SubsetHPC[,7],type="l",col="red", xlab="")
lines(SubsetHPC[,1],SubsetHPC[,8],type="l",col="blue", xlab="")
# we add the legend but remove the legend's border with bty ="n"
legend("topright", pch= "__", col = c("grey", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")
# plot last plot
plot(SubsetHPC[,1],SubsetHPC[,3],type="l",ylab="Global_reactive_power",xlab="datetime")

#now save the plots
png("plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  type = "cairo")
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(SubsetHPC[,1],SubsetHPC[,2],type="l",ylab="Global Active Power",xlab="")
plot(SubsetHPC[,1],SubsetHPC[,4],type="l",ylab="Voltage",xlab="datetime")
plot(SubsetHPC[,1],SubsetHPC[,6],type="l",col="black", ylab="Energy sub metering",xlab="")
lines(SubsetHPC[,1],SubsetHPC[,7],type="l",col="red", xlab="")
lines(SubsetHPC[,1],SubsetHPC[,8],type="l",col="blue", xlab="")
legend("topright", pch= "__", col = c("grey", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")
plot(SubsetHPC[,1],SubsetHPC[,3],type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
