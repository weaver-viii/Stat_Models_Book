library(ggplot2)
library(dplyr)
library(reshape2)

# Turn off my usual default of warnings as error.
options(warn=0)

# Load the data.
log <- read.csv('sonoma-data-log.csv',header=T)
missing <- which(apply(log, 1, function(x) sum(is.na(x))) > 0)
log <- log[-missing,]
log <- log %>% filter(humidity > 0)



ggplot(log[sample(1:nrow(log), 10000),]) + 
  geom_point(aes(x=humidity, y=humid_temp), alpha = 0.4) + 
  stat_smooth(aes(x = humidity, y = humid_temp), col = "red", size = 2, method = "loess") + 
  scale_y_continuous(name = "temperature")
