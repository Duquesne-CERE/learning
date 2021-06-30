library(e1071)
library(readr)

# Read data, perform basic statistics and visualization

# use file chooser:
file <- file.choose()
data <- read_csv(file)

# find file in correct directory (most useful for repeat 
setwd("c:/Users/kahlerd/Downloads/")
data <- read_csv("2622217.csv")
data_test <- read.csv("2622217.csv")

m <- mean(data$TOBS, na.rm = TRUE)
s <- sd(data$TOBS, na.rm = TRUE)
sk <- skewness(data$TOBS, na.rm = TRUE)
kr <- kurtosis(data$TOBS, na.rm = TRUE)

h <- hist(data$TOBS, breaks = c(-30, -20, -10, 0, 10, 20, 30))
