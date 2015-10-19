library(ggplot2)
inc <- runif(100, 10, 100)
food <- c()
for(i in 1:100) {
  food[i] <- abs(inc[i] + 20 + rnorm(1, 0, inc[i]/2))
}

df <- data.frame(x = inc, y = food)
ggplot(df) + 
  geom_point(aes(x = x, y = y), size = 3) +
  scale_x_continuous(name="Income ($10,000's)") + 
  scale_y_continuous(name="Meal Expenditure") 
