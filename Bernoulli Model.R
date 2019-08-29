library(statnet)
library(ergm)
library(sna)
library(coda)

set.seed(0)

data('florentine')
flomarriage

plot(flomarriage, main="Florentine Marriage", cex.main=0.8)
summary(flomarriage~edges)

flomodel.01 <- ergm(flomarriage~edges)
summary(flomodel.01)

#TRIAD FORMATION
summary(flomarriage~edges+triangle)

flomodel.02 <- ergm(flomarriage~edges+triangle)
summary(flomodel.02)

class(flomodel.02)
names(flomodel.02)

flomodel.02$coef

wealth <- flomarriage %v% 'wealth'
wealth
summary(wealth)

plot(flomarriage, vertex.cex=wealth/25, main="Florentine marriage by wealth", cex.main=0.8)
