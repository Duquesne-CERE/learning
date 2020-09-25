# This code provides the needed commands to make a vector plot in R
# This code assumes that you have taken your data and made a data table in your lab notebook.  The data table must 
# contain time (EST), compass angle of shadow, compass angle of sun (+180mod360), and length of shadow.  These data 
# can be in a .csv file or you can enter them directly into this code.

# getting to the right directory
# use the terminal window (Mac or Linux) or Windows command prompt to find the path of the directory where your data 
# are located.  If your data are in the same directory as where this code was saved, you can likely skip this step.
setwd("/Users/davidkahler/Documents/R/principles")

# get data
dat = read.table("mydata.csv", header = FALSE, sep = ",", dec = ".")
# dat - the variable that will take the data
# mydata.csv - the filename in the current directory, which you can change above
# header - FALSE if there are no column headings, true if there are
# sep = "," sets the separator as a comma and dec = "." sets the decimal point as a dot
dat <- dat %>% rename(tm = V1, shadow_angle = V2, shadow_length = V3)
# in this command, you can rename the columns (in order) to something more useful.  The number of renamed column 
# headers must be equal to the number of columns you have.

# this short loop computes the solar angle from the shadow angle.  If you completed this in a spreadsheet, you may 
# skip this step.
for (i in 1:nrow(dat)) {
      solar_angle[i] <- shadow_angle[i] + 180 # this assumes that the values were measured in degrees
      if (solar_angle[i]>=360) {
            solar_angle[i] <- solar_angle[i] - 360
      }
}

stick_height <- 10 # this can be adjusted to the exact measurement.  Throughouth this code, we will assume everthing 
# is in cm.  This next loop computes the solar elevation angle; if you have already done this, you may skip this.
for (i in 1:nrow(dat)) {
      solar_elev[i] <- atan((stick_height/shadow_length[i]))
}

# This is the actual plot command.
plot(solar_angle, solar_elev, xlim = c(90,360), ylim = c(0,90), type = "l", xlab = "Heading (degrees)", ylab = "Elevation (degrees)")


