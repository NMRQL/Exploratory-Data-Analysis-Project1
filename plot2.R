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

#draw the plot
plot(SubsetHPC[,1],SubsetHPC[,2],type="l",ylab="Global Active Power (kilowatts)",xlab="")

#save the plot
png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  type = "cairo")
plot(SubsetHPC[,1],SubsetHPC[,2],type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


