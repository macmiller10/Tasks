setwd("/Users/Mac/Desktop/Evolution/Tasks/Project/data")
microbiota <- read.csv('Hyp1.csv')
Ec <- read.csv('OD.csv')
resist <- read.csv('Plasmid.csv')
plot(microbiota)
# plot(x = data$x,y = data$y,
#xlab = "x-axis",
#ylab = "y-axis",
#main = "Plot"
#)
plot(x = microbiota$time, y = microbiota$cfu,
     xlab = "time",
     ylab = "Bacteria Abundance",
     main = "Plot"
)