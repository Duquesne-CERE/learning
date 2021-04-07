library(dplyr)
library(readr)
library(ggplot2)
library(lubridate)

# Read in all data:
ebbr <- read.table('cement_EBBR.csv', header = TRUE, sep = ",", dec = ".", stringsAsFactors = FALSE) # W/m^2
pan <- read.table('chickasha_PAN.csv', header = TRUE, sep = ",", dec = ".", stringsAsFactors = FALSE) # hundredths of inches

# EBBR data:
ebbr_day <- as.Date(ebbr$Day.Number, origin = "1992-12-31") # day 1 is 01 Jan 1993
ebbr_Wm2 <- ebbr$Latent.Heat.Flux..daytime..W.m.2. # This is LeE
for (i in (1:length(ebbr_Wm2))) {
      if ((ebbr_Wm2[i] > 998) | (ebbr_Wm2[i] < -100)) {
            ebbr_Wm2[i] <- NA
      }
}
Le <- 2.258e6 # J/kg latent heat of vaporization
rho <- 999 # kg/m^3 density of water, \rho
ebbr_mm <- 24*3600*1e3 * ebbr_Wm2 / (2.258e6 * 999) # This is LeE/(Le \rho mm/m).  The leading 1000 is mm/m conversion, the others are seconds to day.
# Note, you could make this conversion more accurate with the inclusion of temperature-dependent Le and \rho.

# Pan data:
pan_in <- array(c(pan$DAY01,pan$DAY02,pan$DAY03,pan$DAY04,pan$DAY05,pan$DAY06,pan$DAY07,pan$DAY08,pan$DAY09,pan$DAY10,pan$DAY11,pan$DAY12,pan$DAY13,pan$DAY14,pan$DAY15,pan$DAY16,pan$DAY17,pan$DAY18,pan$DAY19,pan$DAY20,pan$DAY21,pan$DAY22,pan$DAY23,pan$DAY24,pan$DAY25,pan$DAY26,pan$DAY27,pan$DAY28,pan$DAY29,pan$DAY30,pan$DAY31),c(nrow(pan),31))
# set the start date with <- as.Date("1953-6-1")
start <- as.Date("1953-06-01", origin = "1970-01-01")
end <- as.Date("2004-10-09", origin = "1970-01-01")
pan_day <- array(0, dim = (end-start+1))
pan_mm <- array(0, dim = (end-start+1)) # data in mm

for (i in 1:(end-start+1)) {
      d <- as.numeric(start + i - 1)
      pan_day[i] <- as.Date(d, origin = "1970-01-01")
      dom <- mday(as.Date(pan_day[i], origin = "1970-01-01"))
      mon <- month(as.Date(pan_day[i], origin = "1970-01-01"))
      year <- year(as.Date(pan_day[i], origin = "1970-01-01"))
      yearmo <- year*100+mon
      s <- which(pan$YEARMO==yearmo)
      if (length(s) > 0) {
            if ((pan_in[s,dom] < 899) & (pan_in[s,dom] > -100)) {
                  pan_mm[i] <- 25.4 * pan_in[s,dom] / 100
            } else {
                  pan_mm[i] <- NA
            }
      } else {
            pan_mm[i] <- NA
      }
}
pan_day <- as.Date(pan_day, origin = "1970-01-01")
# Where do they match up?  Since EBBR starts later
s <- which(pan_day==ebbr_day[1])
# and EBBR ends earlier
e <- which(pan_day==ebbr_day[length(ebbr_day)])

plot(ebbr_day,ebbr_mm, type = "p", col = "red")
lines(pan_day[s:e], pan_mm[s:e])
plot(ebbr_mm,pan_mm[s:e])

par(mfrow = c(2,1), mar = c(6,6,3,3))
plot(ebbr_day,ebbr_mm, type = "p")
plot(pan_day[s:e],pan_mm[s:e], type = "p")
par(mfrow = c(1,1), mar = c(6,6,3,3))

# for use with ggplot2
evap <- data.frame(ebbr_day, ebbr_mm,pan_day[s:e],pan_mm[s:e])
ggplot() +
      geom_line(data = evap, mapping = aes(x = ebbr_day, y = ebbr_mm, color = "EBBR")) +
      geom_point(data = evap, mapping = aes(x = ebbr_day, y = pan_mm.s.e., color = "Pan")) +
      labs(x = "date", y = "evaporation (mm)")
