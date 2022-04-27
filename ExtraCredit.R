setwd("/Users/Mac/Desktop/Evolution/Tasks/Extra_Credit")


#part 3
install.packages("meme")
library(meme)
u2 <- "https://i.imgflip.com/4d2hpw.jpg"
v <- meme(u2, "Watson & Crick", "Thomas Hunt Morgan")
plot(v)