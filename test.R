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

KNOK.cor <- qaptest(list(KNOKE, KNOKI), gcor, g1=1, g2=2, reps=2000)
KNOK.cor

plot(KNOK.cor, xlim=c(-0.25, 0.4))

nl<-netlm(KNOKE.n,           # Dependent variable/network
          KNOKI.n,           # List the independent variables/networks
          reps=1000)  
summary(nl)

nlog<-netlogit(KNOKE.n, KNOKI.n,reps=1000)
summary(nlog)

KNOK.a <- aov

gcor(KNOKI, KNOKE)

KNOKE.v <- as.vector(KNOKE.n)
KNOKI.v <- as.vector(KNOKI.n)
KNOK.v <- c(KNOKE.v, KNOKI.v)
KNOK.group = factor(rep(letters[1:2], each = 100))
fit = lm(formula = KNOK.v ~ KNOK.group)

cug.test(KNOKE.n, cmode="size")

#### Darren Trying Something ####

#Creating a network coding each element as
#"1" if both are private or both are non-private, 
#and a "0" if they are of mixed types.

KNOKP.n <-  matrix(
  c(0,1,0,1,0,0,0,1,0,1,1,0,0,1,0,0,0,1,0,1,0,0,0,0,1,1,1,0,1,0,1,1,0,0,0,0,0,1,0,1,0,0,1,0,0,1,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,1,0,0,1,0,1,1,0,1,0,0,0,0,0,1,0,0,1,0,1,1,1,0,0,0,1,1,0,1,0,0,0,1,0,0),
  nrow=10,
  ncol=10,
  byrow=T)

dimnames(KNOKP.n) = list(c(1,2,3,4,5,6,7,8,9,10), c("C","C","E","I","M","W","N","U","W","W"))

#Performance of Standard Multiple Regression 
#analysis by regressing each element in the 
#network on its corresponding elements in the 
#information network

nl_p<-netlm(KNOKI.n,           
            KNOKP.n,             
            reps=1000)  
summary(nl_p)

