setwd("/Users/Mac/Desktop/Evolution/Tasks/Finale")
#part 1
x <- rnorm(100, 5, 2)
y <- (x * 5) + 2 + runif(100, min=0, max=0.1)
lm(y~x) #y intercept is 2.054, and slope is 5.0
# both dependent on restrictions placed on mean & var.
slope <- c()
yint <- c()
x <- c()
y <- c()
z <- c()
for (i in 1:100) 
  {
  x[i] <- rnorm(100, 5, 2)
  z[i] <- rnorm(1)
  q[i] <- x * z
  y[i] <- (q * 5) + 2 + runif(100, min=0, max=0.1)
  mod <- lm(y~x)
  cf <- coef(mod)
  slope[i] <- cf["x"]
}
plot (z,slope)
#reveals slope not dependent on z

#part 2
library(dplyr)
library(ggplot2)
sample_doors <- function() { return (sample(doors, size + 1000, replace = TRUE))}
games <- data.frame(prize = sample_doors(), pick = sample_doors())
monte_show <- function(prize, pick) {
  remaining <- setdiff(doors, c(prize, pick))
  return(ifelse(length(remaining)==1,
                remaining,
                sample(remaining, 1)))
}
games <- games %>%
  rowwise %>%
  mutate(shown = monte_show(prize, pick),
         stay = pick,
         switch = setdiff(doors, c(pick, shown)),
         strategy = factor(ifelse(prize == stay, 'stay', 'switch')))

print(summary(games$strategy)/ nrow(games))
qplot(strategy, data = games, fill = strategy, geom = 'bar') +
  xlab('winning Strategy') + 
  ggtitle("Monty Hall Problem Simulation")



#part 3
install.packages("meme")
library(meme)
u2 <- "https://i.imgflip.com/4d2hpw.jpg"
v <- meme(u2, "Watson & Crick", "Thomas Hunt Morgan")
plot(v)