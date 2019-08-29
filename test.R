library(statnet)

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

network.density(KNOKI.n)
network.density(KNOKE.n)

KNOK.cor <- qaptest(list(KNOKI, KNOKE), gcor, g1=1, g2=2, reps=2000)
KNOK.cor

plot(KNOK.cor, xlim=c(-0.25, 0.4))

nl<-netlm(KNOKE.n,           # Dependent variable/network
          KNOKI.n, # List the independent variables/networks
          reps=10000)  
summary(nl)

nlog<-netlogit(KNOKE.n, KNOKI.n,reps=1000)
summary(nlog)

KNOK.a <- aov

gcor(KNOKI, KNOKE)
