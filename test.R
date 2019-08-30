#Import the libraries needed to complete this tutorial
library(statnet)
library(resample)
library(snowboot)
library(igraph)

#Creation of information and monetry network data
#First, a matrix is created, and thereafter names 
#are assigned the the relevant columns.
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

#Once the matrices have been created, they are
#converted into networks. Thereafter, a summary
#is run on each in order to further understand
#data structure
KNOKI.n <- as.network(KNOKI)
KNOKE.n <- as.network(KNOKE)
KNOKI.n
KNOKE.n

summary(KNOKI.n)
summary(KNOKE.n)


#In this instance, Binary Networks use density for a degree of central tendency
#When creating predicitions of network densities, creating the hypothesus around 
#an expected density is necessary and then to measure vairation around the expected 
#and actual density
network.density(KNOKI.n)
network.density(KNOKE.n)

set.seed(1)
B <- 500
KNOKI.boot <- vertboot(KNOKI, B)

densities <- sapply(1:B, function(x)
  graph.density(graph_from_adjacency_matrix(KNOKI.boot[[x]])))
mean(densities)

#IN order to produce a sample distribution of density 
#measures, wi know bootstrap and thereafter 
#re-calcukate density
KNOK.bootstrap <- bootstrap(KNOKI)
network.density(KNOK.bootstrap)

#Here, a quadratic assignment procedure (QAP) hypothesis 
#test is performed. In a qaptest, an arbitrary graph-level
#statistic(computed on the first argument, by the second) 
#is tested against a qap null hypothesis.
KNOK.cor <- qaptest(list(KNOKE, KNOKI), gcor, g1=1, g2=2, reps=2000)
KNOK.cor

KNOK.den <- qaptest(KNOKE, density, reps=1000)
KNOK.den

plot(KNOK.cor, xlim=c(-0.25, 0.4))

#Performance of Standard Multiple Regression Analysis 
nl<-netlm(KNOKE.n,           # Dependent variable/network
          KNOKI.n,           # List the independent variables/networks
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

=======
#cug.test(KNOKE.n, cmode="size")
>>>>>>> 16367e44d7d3323af8f3c01925ea75ebda5275b8
