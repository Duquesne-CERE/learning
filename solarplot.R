# This code provides the needed commands to make a vector plot in R
# This code assumes that you have taken your data and made a data table in your lab notebook.  The data table must 
# contain time (EST), compass angle of shadow, compass angle of sun (+180mod360), and length of shadow.  These data 
# can be in a .csv file or you can enter them directly into this code.

# Some of the commands are not built into R.  Instead, they were written and distributed as a library that you can 
# install and load.  Run the following two lines to take advantage of the rename command on line 25.  This is not 
# a necessary step as you can continue to call your columns V1, V2, and V3, but it is a nice addition.
install.packages("dplyr") # you only need to run this command once ever; it is usualy omitted from codes.
library(dplyr) # you will need to run this command with every fresh startup or R run.

# GET TO THE RIGHT DIRECTORY
# Use the terminal window (Mac or Linux) or Windows command prompt to find the path of the directory where your data 
# are located.  If your data are in the same directory as where this code was saved, you can likely skip this step.
setwd("/Users/davidkahler/Documents/R/principles")

# GET DATA
dat = read.table("sundata.csv", header = FALSE, sep = ",", dec = ".")
# dat - the variable that will take the data
# sundata.csv - the filename in the current directory, which you can change above
# header - FALSE if there are no column headings, true if there are
# sep = "," sets the separator as a comma and dec = "." sets the decimal point as a dot
# this section of syntax assumes you have a csv file with three columns, only numeric values (i.e., no units in the 
# cells), named below:
dat <- dat %>% rename(tm = V1, shadow_angle = V2, shadow_length = V3)
# in this command, you can rename the columns (in order) to something more useful.  The number of renamed column 
# headers must be equal to the number of columns you have.

# PROCESS DATA
# This short loop computes the solar angle from the shadow angle.  If you completed this in a spreadsheet, you may 
# skip this step.
# Before you can store information, you have to tell the computer where it's going through preallocation:
azimuth <- array(-9999, dim = nrow(dat))
for (i in 1:nrow(dat)) {
      azimuth[i] <- dat$shadow_angle[i] + 180 # this assumes that the values were measured in degrees
      if (azimuth[i]>=360) {
            azimuth[i] <- azimuth[i] - 360
      }
}

elevation <- array(-9999, dim = nrow(dat))
stick_height <- 10 # this can be adjusted to the exact measurement.  Throughouth this code, we will assume everthing 
# is in cm.  This next loop computes the solar elevation angle; if you have already done this, you may skip this.
for (i in 1:nrow(dat)) {
      # the command atan, for arctangent, uses radians.  Therefore, we convert to degrees in the second line.
      temp <- atan((stick_height/dat$shadow_length[i]))
      elevation[i] <- 360*temp/(2*pi) # conversion from radians to degrees
}

# You may have elected to do your data processing in a spreadsheet.  If this is the case, enter your data in:
azimuth <- c(108,120) # this is just example data, enter your solar position here
elevation <- c(20.4,30.8) # enter your elevation in degrees here
# If you enter your data in raw, make sure that the lists are the same length.

# This is the actual plot command, i.e., the part you can't get around.
plot(azimuth, elevation, xlim = c(90,270), ylim = c(0,90), type = "p", xlab = "Azimuth (degrees)", ylab = "Elevation (degrees)")
# Note that the type is set to "p" for points, but there are other options, "l" for lines and "b" for both among others.