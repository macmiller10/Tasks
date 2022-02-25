setwd("/Users/Mac/Desktop/Evolution/Tasks/Task_07")
install.packages("rvertnet")
library(rvertnet)
res <- searchbyterm(class="Aves", state= "North Carolina", limit=10, messages=FALSE)
head(res)


