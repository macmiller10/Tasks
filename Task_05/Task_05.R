install.packages("rehh", dep=T)
install.packages("assertthat", dep=T)
install.packages("RcppArmadillo", dep=T)
install.packages("https://cran.r-project.org/src/contrib/Archive/scrm/scrm_1.7.3-1.tar.gz", repos=NULL, type="source")
install.packages("https://cran.r-project.org/src/contrib/Archive/coala/coala_0.6.0.tar.gz", repos=NULL, type="source")
library(coala)
library(phytools)
library(learnPopGen)
coalescent.plot(5,10)
coalescent.plot(5,10)
coalescent.plot(5,10)
mean(c(3,6,8))
var(c(3,6,8))
model <- coal_model(sample_size = 5, loci_number = 10, loci_length = 500, ploidy = 2) +
  feat_mutation(10) +
  feat_recombination(10) +
  sumstat_trees() +
  sumstat_nucleotide_div()
head(model)
stats <- simulate(model, nsim = 1)
head(stats)
Diversity <- stats$pi
head(Diversity)
Nloci <- length(stats$trees)
head(Nloci)
t1 <- read.tree(text=stats$trees[[1]][1])
plot(t1)
axisphylo()
age1 <- max(nodeHeights(t1))
t2 <- read.tree(text=stats$trees[[2]][1])
plot(t2)
axisphylo()
par(mfrow=c(1,2))
plot(t1)
axisphylo()
plot(t2)
axisphylo()
compare.chronograms(t1, t2)
t1_1 <- read.tree(text=stats$trees[[1]][1])
t1_2 <- read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)
for (locus in 1:Nloci) {
  ntrees <- length(stats$trees[[locus]])
  for (n in 1:trees) {
    if (locus == 1 && n == 1) {
      outphy <- read.tree(text=stats$trees[[locus]][n])
    }
    else {
      outphy <- ape:::c.phylo(outPhy, read.tree(text=stats$trees[[locus]][n]))
    }
  }
}

par(mfrow=c(1,1))
densityTree(outPhy)
model3 <- coal_model(10, 50) +
  feat_mutation(par_prior("theta", sample.int(100, 1))) +
  sumstat_nucleotide_div()
stats <- simulate(model3, nsim = 40)
mean_pi <- sapply(stats, function(x) mean(x$pi))
head(mean_pi)
theta <- sapply(stats, function(x) x$pars[["theta"]])
head(theta)
plot(mean_pi)
plot(mean_pi, theta)
Line <- lm(mean_pi ~theta)
abline(Line)


