setwd("/Users/Mac/Desktop/Evolution/Tasks/Research_EC")
GBM <- read.csv('GBM.csv')
A <- c(180, 163, 67)
B <- c("Mock", "Neg. ctrl", "+ inhibitor")
barplot(A, xlab = "X-axis", ylab = "Y-axis", main ="Bar-Chart")
barplot(A, names.arg = B, xlab ="Treatment", 
        ylab ="Number", col ="grey", 
        main ="Total neurosphere count on day 9 ")
colors = c("grey85", "grey", "grey21")
Days <- c("2", "4", "7", "9")
regions <- c("Mock", "Neg. ctrl", "+ inhibitor")
Values <- matrix(c(9.475, 19.75, 37.348, 44.238, 13.177, 22.282, 36.783, 42.675, 9.05, 12.25, 3.97, 0), 
                 nrow = 3, ncol = 4, byrow = TRUE)
barplot(Values, main = "miR-21 inhibition decreases Neurosphere growth ", names.arg = Days, 
        xlab = "Day", ylab = "size (um)", 
        col = colors, beside = TRUE)
legend("topleft", regions, cex = 0.7, fill = colors)

v <- c(2, 2.2, 2.4, 2.9)
t <- c(2.23, 2.56, 2.78, 3)
m <- c(1.9, 2.1, 1.9, 1.6)

plot(v, type = "o", col = "grey85",
     xlab = "Day", ylab = "Optical density ",
     main = "LN229 cellular proliferation decreases w/ miR-21")

lines(t, type = "o", col = "grey")
lines(m, type = "0", col = "grey21")