# O-ring failure
library(ggplot2)
nfailures <- c(0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 1)
temperature <- c(66, 70, 69, 68, 67, 72, 73, 70, 57, 63, 70, 78, 67, 53, 67, 75, 70, 81, 76, 79, 75, 76, 58)

df <- data.frame(failures = nfailures, temperature = temperature)
ggplot(df) + 
  geom_point(aes(x = temperature, y = failures), size = 3) +
  scale_y_continuous(name = "number of O-ring failures") 
  

failure <- as.numeric(nfailures > 0)
model <- lm(failure ~ temperature)

predict <- 2.9 - 0.037*18

