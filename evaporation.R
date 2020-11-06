library(dplyr)
library(readr)
library(lubridate)

ebbr <- read.table('cement_EBBR.csv', header = TRUE, sep = ",", dec = ".", stringsAsFactors = FALSE) # W/m^2
pan <- read.table('chickasha_PAN.csv', header = TRUE, sep = ",", dec = ".", stringsAsFactors = FALSE) # hundredths of inches

actual_day <- ebbr$Day.Number # day 1 is 01 Jun 1993
actual_mes <- ebbr$Latent.Heat.Flux..daytime..W.m.2.

# set the start date with <- as.Date("1953-6-1")
start <- as.Date("1953-6-1", origin = "1970-01-01")
end <- as.Date("2004-10-09", origin = "1970-01-01")



day <- array(0, dim = (end-start+1))
for (i in 1:(end-start+1)) {
      
      day[i] <- start + i - 1
      
      dom <- mday(as.Date(day[i], origin = "1970-01-01"))
      mon <- month(as.Date(day[i], origin = "1970-01-01"))
      year <- year(as.Date(day[i], origin = "1970-01-01"))
      
      match(pan$YEARMO,(100*year+month))
      
}

