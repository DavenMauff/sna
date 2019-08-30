library(statnet)
library(resample)
library(snowboot)
library(igraph)

KNOKI <-  matrix(
  c(0,1,0,0,1,0,1,0,1,0,1,0,1,1,1,0,1,1,1,0,0,1,0,1,1,1,1,0,0,1,1,1,0,0,1,0,1,0,0,0,1,1,1,1,0,0,1,1,1,1,0,0,1,0,0,0,1,0,1,0,0,1,0,1,1,0,0,0,0,0,1,1,0,1,1,0,1,0,1,0,0,1,0,0,1,0,1,0,0,0,1,1,1,0,1,0,1,0,0,0),
  nrow=10,
  ncol=10,
  byrow=T)

dimnames(KNOKI) = list(c(1,2,3,4,5,6,7,8,9,10), c("C","C","E","I","M","W","N","U","W","W"))

KNOKE <-  matrix(
  c(0,0,1,0,1,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,1,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),
  nrow=10,
  ncol=10,
  byrow=T)

dimnames(KNOKE) = list(c(1,2,3,4,5,6,7,8,9,10), c("C","C","E","I","M","W","N","U","W","W"))

KNOKI.n <- as.network(KNOKI)
KNOKE.n <- as.network(KNOKE)
KNOKI.n
KNOKE.n

summary(KNOKI.n)
summary(KNOKE.n)


#In this instance, Binary Networks use density for a degree of central tendency

#When creating predicitions of network densities, creating the hypothesus around an expected density is necessary and then to measure vairation around the expected and actual density
network.density(KNOKI.n)
network.density(KNOKE.n)

set.seed(1)
B <- 500
KNOKI.boot <- vertboot(KNOKI, B)

densities <- sapply(1:B, function)


KNOK.bootstrap <- bootstrap(KNOKI)
network.density(KNOK.bootstrap)

KNOK.cor <- qaptest(list(KNOKE, KNOKI), gcor, g1=1, g2=2, reps=2000)
KNOK.cor

KNOK.den <- qaptest(KNOKE, density, reps=1000)
KNOK.den

plot(KNOK.cor, xlim=c(-0.25, 0.4))

nl<-netlm(KNOKE.n,           # Dependent variable/network
          KNOKI.n, # List the independent variables/networks
          reps=1000)  
summary(nl)

nlog<-netlogit(KNOKE.n, KNOKI.n,reps=1000)
summary(nlog)

#KNOK.a <- aov

gcor(KNOKI, KNOKE)

#KNOKE.v <- as.vector(KNOKE.n)
#KNOKI.v <- as.vector(KNOKI.n)
#KNOK.v <- c(KNOKE.v, KNOKI.v)
#KNOK.group = factor(rep(letters[1:2], each = 100))
#fit = lm(formula = KNOK.v ~ KNOK.group)

#cug.test(KNOKE.n, cmode="size")
