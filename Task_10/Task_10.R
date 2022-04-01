setwd("/Users/Mac/Desktop/Evolution/Tasks/Task_10")
library(phytools)
trees <- list()
births <- vector()
Fractions <- vector()
netdiversification <- vector()
speciationrate <- vector()
avgbranch <- vector()
pbtree
for (i in 1:100) {
  births[i] <- runif(1,0,1)
  Fractions[i] <- runif(1,0,1)
  trees[[i]] <- pbtree(n=100, b=births [i], d=Fractions [i] * births [i])
  netdiversification[i] <- (births [i] - Fractions [i] * births[i])
  speciationrate[i] <- births[i]
  avgbranch[[i]] <- mean(trees[[i]] $edge.length)
}
totaltreetips <- log(sapply(trees, Ntip))

plot(netdiversification, totaltreetips)
line <- lm(totaltreetips ~ netdiversification)
abline(line)
#as diversification increases log of tips also increases
#Q5
plot(speciationrate, avgbranch)
#both speciation rate and avgbranch increase
#6
cor(speciationrate, avgbranch)
# -0.4217366
#q7
trees
trees[83]
Tree <- trees[[83]]
plot(Tree)
rates <- vector()
traits <- list()
for (i in 1:100) {
  rates[i] <- runif(1)
  traits[[i]] <- fastBM(Tree, sig2=rates[i])
}
#Q8
cor(mean(traits), rates)
head(rates)
head(traits)
length(traits)
head(traits[[i]])
mtraits <- sapply(traits, mean)
Q8c <- cor(mtraits, rates)
plot(mtraits, rates)
pdf("Q8 cor mtraits vs rates.pdf")
plot(mtraits, rates)
dev.off()
#no correlation between the mean and rates 
#Q9
vartraits <- sapply(traits, var)
Q9c <- cor(vartraits, rates)
plot(vartraits, rates)
pdf("Q9 cor vartraits, rates.pdf")
plot(vartraits, rates)
dev.off()


element1 <- sapply(traits, "[[",1)
element2 <- sapply(traits, "[[",2)
traitMat <- cbind(element1, element2)
plot(element1, element2)
Q10c <- cor(element1, element2)
pdf("Q10 element1 vs element 2.pdf")
plot(element1, element2)
dev.off()
