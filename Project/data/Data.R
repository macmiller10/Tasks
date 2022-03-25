setwd("/Users/Mac/Desktop/Evolution/Tasks/Project/data")
microbiota <- read.csv('Hyp1.csv')
Ec <- read.csv('OD.csv')
resist <- read.csv('Plasmid.csv')
plot(microbiota)
# plot(x = data$x,y = data$y,
#xlab = "x-axis",
#ylab = "y-axis",
#main = "Plot"Plot
#)
Plot1 <- read.csv('Plot.Evo.csv')

plot(Plot1$Conc_Amp_ug.ml, Plot1$OD, xlab="ampycilin concentration (ug/mL)", ylab="optical density")
LO <- loess(Plot1$OD ~ Plot1$Conc_Amp_ug.ml)

Plot2 <- read.csv('Plot2.Evo.csv')
head(Plot2)

par(las=1, tck=-0.01, mgp=c(3, 0.25, 0), mar=c(4,5,1,1))
plot(1, 1, type="n", ylim=range(Plot2$Cfu), xlim=range(Plot2$Time), xlab="time (hours)", ylab="CFU/mL", log="y")
Cols <- c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928',"black","gray70")
Tmts <- unique(Plot2$Treatment)
for (i in 1:length(Tmts)){
  Pull <- which(Plot2$Treatment == Tmts[i])
  lines(Plot2[Pull,1], Plot2[Pull,4], col=Cols[i], lwd=1.25)
}

Anti <- grep("\\+", Plot2$Treatment)
AntiDat <- Plot2[Anti,]
NoAmpDat <- Plot2[setdiff(1:nrow(Plot2), Anti),]

# All
par(mar=c(9,5,1,1))
boxplot(Plot2$Cfu~Plot2$Treatment, las=2, log="y", xlab="n")
ANOVA <- aov(Plot2$Cfu~Plot2$Treatment)
summary(ANOVA)

par(mar=c(9,5,1,1), mfrow=c(1,2))
# With antibiotics
boxplot(AntiDat$Cfu~AntiDat$Treatment, las=2, log="y", xlab="n")

# Without antibiotics
boxplot(NoAmpDat$Cfu~NoAmpDat$Treatment, las=2, log="y", xlab="n")

Cfu <- log10(Plot2$Cfu)
Anti <- Plot2$Antibiotic_present
Anti[which(Anti == "no")] <- 0
Anti[which(Anti == "yes")] <- 1
Anti <- as.numeric(Anti)

Donor <- Plot2$Donor
Donor[which(Donor == "None")] <- 0
Donor[which(Donor == "Human donor 1")] <- 1
Donor[which(Donor == "Human donor 2")] <- 2
Donor[which(Donor == "Human donor 3")] <- 3
Donor <- as.factor(Donor)

Fit <- glm(Cfu ~ Anti * Donor)

